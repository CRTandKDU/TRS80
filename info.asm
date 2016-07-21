	;; ********************************************************************
	;; info.asm
	;; Scans a Texinfo-produced info file for node tags list
	;; jmc
	;; July, 15, 2016
	;; ********************************************************************
@ERROR  EQU     4409H
@EXIT   EQU     402DH
@FSPEC  EQU     441CH
@GET	EQU	0013H
@INIT   EQU     4420H
@OPEN   EQU     4424H
@PUT    EQU     001BH
@CLOSE  EQU     4428H
@REW	EQU	443FH
@POSN	EQU	4442H
@KEY	EQU	0049H
@DSPLY	EQU	4467H
@DSP	EQU	0033H
@CLS	EQU	01C9H
SEP	EQU	1FH
LF	EQU	10
CR	EQU	13
MAXTAG	EQU	14	
;
	ORG	5200H
BEGIN	LD	DE,FCB1
	CALL	@FSPEC
	;; Set up to OPEN the source file
        LD      HL,BUFFER1    ;Pt to buffer
        LD      DE,FCB1       ;Pt to fcb
        LD      B,0           ;LRL
        CALL    @OPEN         ;open the file
        JP      NZ,IOERR      ;Jump on error
	;; Build Tag Table
NEXT	CALL	BUFNCLEAR
	LD	HL,BUFNODE	;read 255b node section
	LD      DE,FCB1		;source fcb
	LD	B,255		;max chars to read
getchar CALL    @GET          	;input one character	
        JR      NZ,done       	;write it if read was OK
	CP	1FH		;node separator
	JR	Z,WAIT
	LD	(HL),A
	INC	HL
	DJNZ	getchar
	JR	WAIT
	;;Got end of file or error if NZ - check error code
done    CP      1CH           ;end of file?
        JP      NZ,IOERR      ;go if some other error
        JP      @EXIT         ;all done, back to LDOS	
WAIT	LD	(HL),A	      ;add 1FH sentinel
	INC	HL
	LD	A,CR	      ;add CR for display
	LD	(HL),A
	CALL	@CLS	      ;display node buffer and	
	LD	HL,BUFNODE
	;; CALL	@DSPLY		
	;;Search for Tag substring  
	LD	HL,BUFNODE
	LD	(TextAddress),HL
	LD	HL,256
	LD	(TextLength),HL
	LD	HL,STRTAG
	LD	(StringAddress),HL
	LD	HL,11
	LD	(StringLength),HL
	CALL	STRIDX
	LD	A,H
	OR	L
	JR	NZ,FOUND
WAIT1
	;; CALL	@KEY		
	JR	NEXT
	;;
FOUND
	;; PUSH	HL
	;; LD	HL,SFOUND	;found 'Tag Table: '
	;; CALL	@DSPLY
	;; POP	HL
	CALL	PARSET		;parse tag table
	LD	HL,TBLTAG	;display tag table
SALL	LD	A,(HL)		;show parsed tag table
	CP	1FH
	JR	Z,WAIT1
SHOW	LD	A,(HL)		;show one tag record
	CP	0
	JR	Z,show0
	CALL	@DSP
	INC	HL
	JR	SHOW
show0	INC	HL
	INC	HL
	INC	HL
	LD	A,LF
	CALL	@DSP
	;; CALL	@KEY
	JR	SALL
	;; 
	;; Texinfo text handling
	;;
	;; BUFNCLEAR
	;; Clears node buffer
BUFNCLEAR:
	LD	HL,BUFNODE
	LD	BC,256
nclear	LD	A,0
	LD	(HL),A
	INC	HL
	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,nclear
	RET
	;; CVTNUM
	;; Convert number string to word
	;; DE => ptr to strore word
CVTNUM:
	PUSH	HL
	PUSH	DE
	LD	HL,STRNUM
	PUSH	DE
	CALL	0E6CH	;(HL) -> ACC str conversion
	POP	HL	;HL/DE exchanged
	CALL	09CBH	;ACC -> (HL) word
	POP	DE
	POP	HL
	RET
	;; PARSEN
	;; Parse a node name from (HL)
	;; into (DE), maxed at 14 chars
	;; DE => ptr to tag table buffer
	;; HL => node text, usually beg of line
	;; HL <= beg of next line (0AH)
PARSEN:	
	LD	BC,6		;assume it is a 'Node: '
	ADD	HL,BC
	LD	B,MAXTAG
mvhlde	LD	A,(HL)		;look for end of node name
	CP	7FH
	JR	Z,pad
	LD	(DE),A
	INC	DE
	INC	HL
	DJNZ	mvhlde
	JR	retsen
pad	LD	A,0		;null terminated
	LD	(DE),A
	INC	DE
retsen	PUSH	DE		;store away DE
	LD	DE,STRNUM	;buffer for number
	INC	HL		;point to char after 7FH
nnumc	LD	A,(HL)		;find next line in input
	LD	(DE),A
	INC	DE
	INC	HL
	CP	LF
	JR	NZ,nnumc
	DEC	DE
	LD	A,0		;replace 0AH by 00H (eos)
	LD	(DE),A
	POP	DE
	CALL	CVTNUM
	INC	DE		;skip index parsing
	INC	DE
	RET
	;; PARSET
	;; Parses a sequence of lines of tag info, ending in 1FH
	;; HL => start of 'Tag Table: ' node
	;; Fills in TBLTAG, closing it with 1FH
PARSET:
	LD	BC,11		;tag table is a sequence 
	ADD	HL,BC		;of lines ending with 1FH
	LD	DE,TBLTAG
nparse	LD	A,(HL)
	CP	1FH
	JR	Z,parret
	CALL	PARSEN
	JR	nparse
parret	LD	(DE),A		;use 1FH for end of table
	RET
	;; STRIDX
	;; Search occurence of str in txt
	;; HL <= first char in txt if found, 0 if not
STRIDX:
	ld hl,(TextAddress)
	ld de,(StringAddress)
	ld bc,(StringLength)
Repeat: 	         ; This loop verifies if the text from the current byte
	ld a,(de)	 ; matches the string given, character by character. If
	cp (hl)          ; it does, then the zero flag is set. Execution is
	jr nz,EndRepeat  ; continued from EndRepeat, regardless of the success of
	inc hl           ; the search.
	inc de
	dec bc
	ld a,b
	or c
	jr nz,Repeat
EndRepeat:
	ld hl,(TextAddress)	; Note that LD preserves the flags
	jr z,Finish
	inc hl                  ; The text pointer is advanced
	ld (TextAddress),hl
	ld bc,(TextLength)
	dec bc                  ; Total byte count is decreased
	ld (TextLength),bc
	ld a,b
	or c
	jr nz,STRIDX
	ld hl,0                 ; Not found (BC=0)
Finish:	
	RET
	;; 
IOERR   SET     6,A           ;short msg/abort
        JP      @ERROR
	;;
	;; 
FCB1    DS      32            ;space for file FCB'S & Buffers
BUFFER1 DS      256
BUFNODE	DS	256		;buffer for node text	
	DB	13		;stop for display
STRTAG	DB	'Tag Table:',10	;tag node header
;; SFOUND	DB	'INFO> String found.',13
STRNUM	DS	6
	;; Buffers for STRIDX
TextAddress:
	DW	BUFNODE
TextLength:
	DW	256
StringAddress:
	DW	STRTAG
StringLength:
	DW	11
	;; Table of tag internal representations
TBLTAG	DS	640		
        END     BEGIN
	
