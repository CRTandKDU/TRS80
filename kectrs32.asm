;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Sat Nov 09 12:48:02 2013
;--------------------------------------------------------
	.module kectrs32
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _KRPStep1
	.globl _rot32
	.globl _main
	.globl _buf
	.globl _RC
	.globl _r
	.globl _pB
	.globl _B
	.globl _D
	.globl _C
	.globl _A
	.globl _KThetaStep
	.globl _KRhoPiStep
	.globl _KKhiStep
	.globl _KRounds
	.globl _print_crlf
	.globl _print_char
	.globl _print_short
	.globl _print_str
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_A::
	.ds 400
_C::
	.ds 20
_D::
	.ds 20
_B::
	.ds 400
_pB::
	.ds 25
_r::
	.ds 25
_RC::
	.ds 96
_buf::
	.ds 8
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;kectrs32.c:77: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;kectrs32.c:79: RC[0]=1;
	ld	hl,#0x0001
	ld	(_RC), hl
	ld	hl,#0x0000
	ld	(_RC + 2), hl
;kectrs32.c:80: RC[1]=32898;
	ld	hl,#0x8082
	ld	((_RC + 0x0004)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0004) + 2), hl
;kectrs32.c:81: RC[2]=32906;
	ld	hl,#0x808A
	ld	((_RC + 0x0008)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0008) + 2), hl
;kectrs32.c:82: RC[3]=2147516416;
	ld	hl,#0x8000
	ld	((_RC + 0x000c)),hl
	ld	((_RC + 0x000c) + 2), hl
;kectrs32.c:83: RC[4]=32907;
	ld	hl,#0x808B
	ld	((_RC + 0x0010)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0010) + 2), hl
;kectrs32.c:84: RC[5]=2147483649;
	ld	hl,#0x0001
	ld	((_RC + 0x0014)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0014) + 2), hl
;kectrs32.c:85: RC[6]=2147516545;
	ld	hl,#0x8081
	ld	((_RC + 0x0018)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0018) + 2), hl
;kectrs32.c:86: RC[7]=32777;
	ld	hl,#0x8009
	ld	((_RC + 0x001c)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x001c) + 2), hl
;kectrs32.c:87: RC[8]=138;
	ld	hl,#0x008A
	ld	((_RC + 0x0020)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0020) + 2), hl
;kectrs32.c:88: RC[9]=136;
	ld	hl,#0x0088
	ld	((_RC + 0x0024)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0024) + 2), hl
;kectrs32.c:89: RC[10]=2147516425;
	ld	hl,#0x8009
	ld	((_RC + 0x0028)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0028) + 2), hl
;kectrs32.c:90: RC[11]=2147483658;
	ld	hl,#0x000A
	ld	((_RC + 0x002c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x002c) + 2), hl
;kectrs32.c:91: RC[12]=2147516555;
	ld	hl,#0x808B
	ld	((_RC + 0x0030)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0030) + 2), hl
;kectrs32.c:92: RC[13]=139;
	ld	hl,#0x008B
	ld	((_RC + 0x0034)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0034) + 2), hl
;kectrs32.c:93: RC[14]=32905;
	ld	hl,#0x8089
	ld	((_RC + 0x0038)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0038) + 2), hl
;kectrs32.c:94: RC[15]=32771;
	ld	hl,#0x8003
	ld	((_RC + 0x003c)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x003c) + 2), hl
;kectrs32.c:95: RC[16]=32770;
	ld	hl,#0x8002
	ld	((_RC + 0x0040)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0040) + 2), hl
;kectrs32.c:96: RC[17]=128;
	ld	hl,#0x0080
	ld	((_RC + 0x0044)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0044) + 2), hl
;kectrs32.c:97: RC[18]=32778;
	ld	hl,#0x800A
	ld	((_RC + 0x0048)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0048) + 2), hl
;kectrs32.c:98: RC[19]=2147483658;
	ld	hl,#0x000A
	ld	((_RC + 0x004c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x004c) + 2), hl
;kectrs32.c:99: RC[20]=2147516545;
	ld	hl,#0x8081
	ld	((_RC + 0x0050)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0050) + 2), hl
;kectrs32.c:100: RC[21]=32896;
	ld	hl,#0x8080
	ld	((_RC + 0x0054)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0054) + 2), hl
;kectrs32.c:101: RC[22]=2147483649;
	ld	hl,#0x0001
	ld	((_RC + 0x0058)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0058) + 2), hl
;kectrs32.c:102: RC[23]=2147516424;
	ld	hl,#0x8008
	ld	((_RC + 0x005c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x005c) + 2), hl
;kectrs32.c:104: r[0]=0;
	ld	hl,#_r
	ld	(hl),#0x00
;kectrs32.c:105: r[1]=1;
	inc	hl
	ld	(hl),#0x01
;kectrs32.c:106: r[2]=30;
	ld	hl,#_r + 2
	ld	(hl),#0x1E
;kectrs32.c:107: r[3]=28;
	ld	hl,#_r + 3
	ld	(hl),#0x1C
;kectrs32.c:108: r[4]=27;
	ld	hl,#_r + 4
	ld	(hl),#0x1B
;kectrs32.c:109: r[5]=4;
	ld	hl,#_r + 5
	ld	(hl),#0x04
;kectrs32.c:110: r[6]=12;
	ld	hl,#_r + 6
	ld	(hl),#0x0C
;kectrs32.c:111: r[7]=6;
	ld	hl,#_r + 7
	ld	(hl),#0x06
;kectrs32.c:112: r[8]=23;
	ld	hl,#_r + 8
	ld	(hl),#0x17
;kectrs32.c:113: r[9]=20;
	ld	hl,#_r + 9
	ld	(hl),#0x14
;kectrs32.c:114: r[10]=3;
	ld	hl,#_r + 10
	ld	(hl),#0x03
;kectrs32.c:115: r[11]=10;
	ld	hl,#_r + 11
	ld	(hl),#0x0A
;kectrs32.c:116: r[12]=11;
	ld	hl,#_r + 12
	ld	(hl),#0x0B
;kectrs32.c:117: r[13]=25;
	ld	hl,#_r + 13
	ld	(hl),#0x19
;kectrs32.c:118: r[14]=7;
	ld	hl,#_r + 14
	ld	(hl),#0x07
;kectrs32.c:119: r[15]=9;
	ld	hl,#_r + 15
	ld	(hl),#0x09
;kectrs32.c:120: r[16]=13;
	ld	hl,#_r + 16
	ld	(hl),#0x0D
;kectrs32.c:121: r[17]=15;
	ld	hl,#_r + 17
	ld	(hl),#0x0F
;kectrs32.c:122: r[18]=21;
	ld	hl,#_r + 18
	ld	(hl),#0x15
;kectrs32.c:123: r[19]=8;
	ld	hl,#_r + 19
	ld	(hl),#0x08
;kectrs32.c:124: r[20]=18;
	ld	hl,#_r + 20
	ld	(hl),#0x12
;kectrs32.c:125: r[21]=2;
	ld	hl,#_r + 21
	ld	(hl),#0x02
;kectrs32.c:126: r[22]=29;
	ld	hl,#_r + 22
	ld	(hl),#0x1D
;kectrs32.c:127: r[23]=24;
	ld	hl,#_r + 23
	ld	(hl),#0x18
;kectrs32.c:128: r[24]=14;
	ld	hl,#_r + 24
	ld	(hl),#0x0E
;kectrs32.c:130: pB[0]=0;
	ld	hl,#_pB
	ld	(hl),#0x00
;kectrs32.c:131: pB[1]=10;
	inc	hl
	ld	(hl),#0x0A
;kectrs32.c:132: pB[2]=20;
	ld	hl,#_pB + 2
	ld	(hl),#0x14
;kectrs32.c:133: pB[3]=5;
	ld	hl,#_pB + 3
	ld	(hl),#0x05
;kectrs32.c:134: pB[4]=15;
	ld	hl,#_pB + 4
	ld	(hl),#0x0F
;kectrs32.c:135: pB[5]=16;
	ld	hl,#_pB + 5
	ld	(hl),#0x10
;kectrs32.c:136: pB[6]=1;
	ld	hl,#_pB + 6
	ld	(hl),#0x01
;kectrs32.c:137: pB[7]=11;
	ld	hl,#_pB + 7
	ld	(hl),#0x0B
;kectrs32.c:138: pB[8]=21;
	ld	hl,#_pB + 8
	ld	(hl),#0x15
;kectrs32.c:139: pB[9]=6;
	ld	hl,#_pB + 9
	ld	(hl),#0x06
;kectrs32.c:140: pB[10]=7;
	ld	hl,#_pB + 10
	ld	(hl),#0x07
;kectrs32.c:141: pB[11]=17;
	ld	hl,#_pB + 11
	ld	(hl),#0x11
;kectrs32.c:142: pB[12]=2;
	ld	hl,#_pB + 12
	ld	(hl),#0x02
;kectrs32.c:143: pB[13]=12;
	ld	hl,#_pB + 13
	ld	(hl),#0x0C
;kectrs32.c:144: pB[14]=22;
	ld	hl,#_pB + 14
	ld	(hl),#0x16
;kectrs32.c:145: pB[15]=23;
	ld	hl,#_pB + 15
	ld	(hl),#0x17
;kectrs32.c:146: pB[16]=8;
	ld	hl,#_pB + 16
	ld	(hl),#0x08
;kectrs32.c:147: pB[17]=18;
	ld	hl,#_pB + 17
	ld	(hl),#0x12
;kectrs32.c:148: pB[18]=3;
	ld	hl,#_pB + 18
	ld	(hl),#0x03
;kectrs32.c:149: pB[19]=13;
	ld	hl,#_pB + 19
	ld	(hl),#0x0D
;kectrs32.c:150: pB[20]=14;
	ld	hl,#_pB + 20
	ld	(hl),#0x0E
;kectrs32.c:151: pB[21]=24;
	ld	hl,#_pB + 21
	ld	(hl),#0x18
;kectrs32.c:152: pB[22]=9;
	ld	hl,#_pB + 22
	ld	(hl),#0x09
;kectrs32.c:153: pB[23]=19;
	ld	hl,#_pB + 23
	ld	(hl),#0x13
;kectrs32.c:154: pB[24]=4;
	ld	hl,#_pB + 24
	ld	(hl),#0x04
;kectrs32.c:157: for( i=0; i<K_LANES; i++ ) A[i] = 0;
	ld	de,#0x0000
00109$:
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	bc,#_A
	add	hl,bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	de
	ld	a,e
	sub	a, #0x19
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00109$
;kectrs32.c:158: A[0]=123456L; A[1]=234567L; A[2]=345678L; A[3]=456789L; A[4]=567890L;
	ld	hl,#0xE240
	ld	(_A), hl
	ld	hl,#0x0001
	ld	(_A + 2), hl
	ld	hl,#0x9447
	ld	((_A + 0x0004)), hl
	ld	hl,#0x0003
	ld	((_A + 0x0004) + 2), hl
	ld	hl,#0x464E
	ld	((_A + 0x0008)), hl
	ld	hl,#0x0005
	ld	((_A + 0x0008) + 2), hl
	ld	hl,#0xF855
	ld	((_A + 0x000c)), hl
	ld	hl,#0x0006
	ld	((_A + 0x000c) + 2), hl
	ld	hl,#0xAA52
	ld	((_A + 0x0010)), hl
	ld	hl,#0x0008
	ld	((_A + 0x0010) + 2), hl
;kectrs32.c:161: for( i=0; i<K_LANES; i++ ){
	ld	de,#0x0000
00111$:
;kectrs32.c:162: if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
	ld	a,d
	or	a,e
	jr	Z,00102$
	ld	a,e
	sub	a,#0x05
	jr	NZ,00141$
	or	a,d
	jr	Z,00102$
00141$:
	ld	a,e
	sub	a,#0x0A
	jr	NZ,00142$
	or	a,d
	jr	Z,00102$
00142$:
	ld	a,e
	sub	a,#0x0F
	jr	NZ,00143$
	or	a,d
	jr	Z,00102$
00143$:
	ld	a,e
	sub	a,#0x14
	jr	NZ,00103$
	or	a,d
	jr	NZ,00103$
00102$:
	push	de
	call	_print_crlf
	pop	de
00103$:
;kectrs32.c:163: print_short( (unsigned short)(A[i]%65536) ); 
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_A)
	adc	a, h
	ld	-1 (ix),a
	push	de
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	de
	push	hl
	call	_print_short
	pop	af
	pop	de
;kectrs32.c:164: print_short( (unsigned short) (A[i]>>16) );
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,#0x10
00146$:
	srl	h
	rr	l
	rr	b
	rr	c
	dec	a
	jr	NZ,00146$
	push	de
	push	bc
	call	_print_short
	pop	af
	pop	de
;kectrs32.c:161: for( i=0; i<K_LANES; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x19
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00111$
;kectrs32.c:166: print_crlf();
	call	_print_crlf
;kectrs32.c:176: KRounds();
	call	_KRounds
;kectrs32.c:190: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
	ld hl,#0x6cc ; BASIC command line
	jp (hl)
	ld	sp,ix
	pop	ix
	ret
_main_end::
;kectrs32.c:259: unsigned long rot32( unsigned long x, unsigned char n ){
;	---------------------------------
; Function rot32
; ---------------------------------
_rot32_start::
_rot32:
;kectrs32.c:289: __endasm;
	push iy
	ld iy,#0x0
	add iy,sp
	ld d,#0x00
	00001$:
	ld a,d
	sub a, 8(iy)
	jr NC,00002$
	ld a,7(iy)
	rlca
	ld a,4(iy)
	rla
	ld 4(iy),a
	ld a,5(iy)
	rla
	ld 5(iy),a
	ld a,6(iy)
	rla
	ld 6(iy),a
	ld a,7(iy)
	rla
	ld 7(iy),a
	inc d
	jr 00001$
	00002$:
	pop iy
;kectrs32.c:290: return x;
	ld	iy,#2
	add	iy,sp
	ld	l,0 (iy)
	ld	h,1 (iy)
	ld	e,2 (iy)
	ld	d,3 (iy)
	ret
_rot32_end::
;kectrs32.c:293: void KThetaStep(){
;	---------------------------------
; Function KThetaStep
; ---------------------------------
_KThetaStep_start::
_KThetaStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;kectrs32.c:295: for( i=0; i<5; i++ ){
	ld	de,#0x0000
00104$:
;kectrs32.c:296: C[i]=(unsigned long) A[i]^A[i+5]^A[i+10]^A[i+15]^A[i+20];
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	a,#<(_C)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_C)
	adc	a, h
	ld	-1 (ix),a
	ld	bc,#_A
	add	hl,bc
	push	de
	ex	de,hl
	ld	hl, #0x000B
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	-7 (ix), e
	ld	a, e
	add	a, #0x05
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	bc,#_A
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,-6 (ix)
	xor	a, c
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, b
	ld	-5 (ix),a
	ld	a,-4 (ix)
	xor	a, l
	ld	-4 (ix),a
	ld	a,-3 (ix)
	xor	a, h
	ld	-3 (ix),a
	ld	a,-7 (ix)
	add	a, #0x0A
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	bc,#_A
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,-6 (ix)
	xor	a, c
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, b
	ld	-5 (ix),a
	ld	a,-4 (ix)
	xor	a, l
	ld	-4 (ix),a
	ld	a,-3 (ix)
	xor	a, h
	ld	-3 (ix),a
	ld	a,-7 (ix)
	add	a, #0x0F
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	bc,#_A
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,-6 (ix)
	xor	a, c
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, b
	ld	-5 (ix),a
	ld	a,-4 (ix)
	xor	a, l
	ld	-4 (ix),a
	ld	a,-3 (ix)
	xor	a, h
	ld	-3 (ix),a
	ld	a,-7 (ix)
	add	a, #0x14
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	bc,#_A
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,-6 (ix)
	xor	a, c
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, b
	ld	-5 (ix),a
	ld	a,-4 (ix)
	xor	a, l
	ld	-4 (ix),a
	ld	a,-3 (ix)
	xor	a, h
	ld	-3 (ix),a
	push	de
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x000B
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	de
;kectrs32.c:295: for( i=0; i<5; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x05
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00104$
;kectrs32.c:397: __endasm;
	push de
	push ix
;; D[0]
	ld ix,#(_D+0) ; Offset 4*i
	ld hl,#(_C+16) ; Offset 4*i
	ld de,#(_C+7) ; Offset 4i+3
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
;; D[1]
	ld ix,#(_D+4) ; Offset 4*i
	ld hl,#(_C+0) ; Offset 4*i
	ld de,#(_C+11) ; Offset 4i+3
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
;; D[2]
	ld ix,#(_D+8) ; Offset 4*i
	ld hl,#(_C+4) ; Offset 4*i
	ld de,#(_C+15) ; Offset 4i+3
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
;; D[3]
	ld ix,#(_D+12) ; Offset 4*i
	ld hl,#(_C+8) ; Offset 4*i
	ld de,#(_C+19) ; Offset 4i+3
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
;; D[4]
	ld ix,#(_D+16) ; Offset 4*i
	ld hl,#(_C+12) ; Offset 4*i
	ld de,#(_C+3) ; Offset 4i+3
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	jp 00002$
	00001$:
	ld a,(de)
	rla
	push af
	ld b,(hl)
	xor a,b
	ld 0(ix),a
	inc de
	inc ix
	inc hl
	pop af
	ret
	00002$:
	pop ix
	pop de
;kectrs32.c:398: for( i=0; i<5; i++ )
	ld	de,#0x0000
;kectrs32.c:399: for( j=0; j<5; j++ ){
00114$:
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	a,#<(_D)
	add	a, l
	ld	-6 (ix),a
	ld	a,#>(_D)
	adc	a, h
	ld	-5 (ix),a
	ld	bc,#0x0000
00106$:
;kectrs32.c:400: A[i+j*5] = A[i+j*5]^D[i];
	ld	-7 (ix),e
	ld	a,c
	push	de
	ld	e,a
	add	a, a
	add	a, a
	add	a, e
	pop	de
	ld	h,a
	ld	a,-7 (ix)
	add	a, h
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	iy,#_A
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a,0 (iy)
	ld	-11 (ix),a
	ld	a,1 (iy)
	ld	-10 (ix),a
	ld	a,2 (iy)
	ld	-9 (ix),a
	ld	a,3 (iy)
	ld	-8 (ix),a
	push	de
	push	bc
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
	pop	de
	ld	a,-15 (ix)
	xor	a, -11 (ix)
	ld	-15 (ix),a
	ld	a,-14 (ix)
	xor	a, -10 (ix)
	ld	-14 (ix),a
	ld	a,-13 (ix)
	xor	a, -9 (ix)
	ld	-13 (ix),a
	ld	a,-12 (ix)
	xor	a, -8 (ix)
	ld	-12 (ix),a
	push	de
	push	bc
	push	iy
	pop	de
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
	pop	de
;kectrs32.c:399: for( j=0; j<5; j++ ){
	inc	bc
	ld	a,c
	sub	a, #0x05
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00106$
;kectrs32.c:398: for( i=0; i<5; i++ )
	inc	de
	ld	a,e
	sub	a, #0x05
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00114$
	ld	sp,ix
	pop	ix
	ret
_KThetaStep_end::
;kectrs32.c:405: void KRPStep1(short i){
;	---------------------------------
; Function KRPStep1
; ---------------------------------
_KRPStep1_start::
_KRPStep1:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-29
	add	hl,sp
	ld	sp,hl
;kectrs32.c:409: if( 0==r[i] ) return;
	ld	hl,#_r
	ld	e,4 (ix)
	ld	d,5 (ix)
	add	hl,de
	ld	c,(hl)
	ld	a,c
	or	a, a
	jp	Z,00111$
;kectrs32.c:411: rr = (unsigned char)(r[i]%8);
	ld	a,c
	and	a, #0x07
	ld	-27 (ix),a
;kectrs32.c:412: rq = (unsigned char)(r[i]>>3);
	ld	a,c
	rrca
	rrca
	rrca
	and	a,#0x1F
	ld	-28 (ix),a
;kectrs32.c:413: a0 = (unsigned char)(A[i]&0xff);
	ld	de,#_A
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, hl
	add	hl, hl
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ex	de,hl
	ld	hl, #0x0017
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	e,-6 (ix)
;kectrs32.c:414: a1 = (unsigned char)((A[i]>>8)&0xff);
	push	af
	ld	a,-6 (ix)
	ld	-10 (ix),a
	ld	a,-5 (ix)
	ld	-9 (ix),a
	ld	a,-4 (ix)
	ld	-8 (ix),a
	ld	a,-3 (ix)
	ld	-7 (ix),a
	pop	af
	ld	b,#0x08
00128$:
	srl	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
	djnz	00128$
	ld	l,-10 (ix)
	ld	-29 (ix),l
;kectrs32.c:415: a2 = (unsigned char)((A[i]>>16)&0xff);
	push	af
	ld	a,-6 (ix)
	ld	-10 (ix),a
	ld	a,-5 (ix)
	ld	-9 (ix),a
	ld	a,-4 (ix)
	ld	-8 (ix),a
	ld	a,-3 (ix)
	ld	-7 (ix),a
	pop	af
	ld	b,#0x10
00130$:
	srl	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
	djnz	00130$
	ld	l,-10 (ix)
;kectrs32.c:416: a3 = (unsigned char)((A[i]>>24)&0xff);
	push	af
	ld	a,-6 (ix)
	ld	-10 (ix),a
	ld	a,-5 (ix)
	ld	-9 (ix),a
	ld	a,-4 (ix)
	ld	-8 (ix),a
	ld	a,-3 (ix)
	ld	-7 (ix),a
	pop	af
	ld	b,#0x18
00132$:
	srl	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
	djnz	00132$
	ld	c,-10 (ix)
;kectrs32.c:418: A[i]= (unsigned long) a3;
	ld	-10 (ix),c
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	-7 (ix),#0x00
;kectrs32.c:419: A[i]+=(unsigned long) a0<<8;
	ld	-6 (ix),e
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
;kectrs32.c:420: A[i]+=(unsigned long) a1<<16; 
	ld	a,-29 (ix)
	ld	-14 (ix),a
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
;kectrs32.c:421: A[i]+=(unsigned long) a2<<24;
	ld	-18 (ix),l
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
	ld	-15 (ix),#0x00
;kectrs32.c:417: if( 1==rq ){
	ld	a,-28 (ix)
	dec	a
	jp	NZ,00104$
;kectrs32.c:418: A[i]= (unsigned long) a3;
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0013
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs32.c:419: A[i]+=(unsigned long) a0<<8;
	push	af
	ld	a,-6 (ix)
	ld	-22 (ix),a
	ld	a,-5 (ix)
	ld	-21 (ix),a
	ld	a,-4 (ix)
	ld	-20 (ix),a
	ld	a,-3 (ix)
	ld	-19 (ix),a
	pop	af
	ld	b,#0x08
00136$:
	sla	-22 (ix)
	rl	-21 (ix)
	rl	-20 (ix)
	rl	-19 (ix)
	djnz	00136$
	ld	a,-10 (ix)
	add	a, -22 (ix)
	ld	-22 (ix),a
	ld	a,-9 (ix)
	adc	a, -21 (ix)
	ld	-21 (ix),a
	ld	a,-8 (ix)
	adc	a, -20 (ix)
	ld	-20 (ix),a
	ld	a,-7 (ix)
	adc	a, -19 (ix)
	ld	-19 (ix),a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0007
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs32.c:420: A[i]+=(unsigned long) a1<<16; 
	push	af
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	pop	af
	ld	b,#0x10
00138$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00138$
	ld	a,-22 (ix)
	add	a, l
	ld	-22 (ix),a
	ld	a,-21 (ix)
	adc	a, h
	ld	-21 (ix),a
	ld	a,-20 (ix)
	adc	a, e
	ld	-20 (ix),a
	ld	a,-19 (ix)
	adc	a, d
	ld	-19 (ix),a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0007
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs32.c:421: A[i]+=(unsigned long) a2<<24;
	push	af
	ld	e,-18 (ix)
	ld	d,-17 (ix)
	ld	l,-16 (ix)
	ld	h,-15 (ix)
	pop	af
	ld	b,#0x18
00140$:
	sla	e
	rl	d
	adc	hl, hl
	djnz	00140$
	ld	a,-22 (ix)
	add	a, e
	ld	e,a
	ld	a,-21 (ix)
	adc	a, d
	ld	d,a
	ld	a,-20 (ix)
	adc	a, l
	ld	c,a
	ld	a,-19 (ix)
	adc	a, h
	ld	b,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00104$:
;kectrs32.c:423: if( 2==rq ){
	ld	a,-28 (ix)
	sub	a, #0x02
	jp	NZ,00106$
;kectrs32.c:424: A[i]= (unsigned long) a2;
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x000B
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs32.c:425: A[i]+=(unsigned long) a3<<8;
	push	af
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	pop	af
	ld	b,#0x08
00144$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00144$
	ld	a,-18 (ix)
	add	a, l
	ld	c,a
	ld	a,-17 (ix)
	adc	a, h
	ld	b,a
	ld	a,-16 (ix)
	adc	a, e
	ld	e,a
	ld	a,-15 (ix)
	adc	a, d
	ld	d,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;kectrs32.c:426: A[i]+=(unsigned long) a0<<16; 
	push	af
	ld	a,-6 (ix)
	ld	-22 (ix),a
	ld	a,-5 (ix)
	ld	-21 (ix),a
	ld	a,-4 (ix)
	ld	-20 (ix),a
	ld	a,-3 (ix)
	ld	-19 (ix),a
	pop	af
	ld	a,#0x10
00146$:
	sla	-22 (ix)
	rl	-21 (ix)
	rl	-20 (ix)
	rl	-19 (ix)
	dec	a
	jr	NZ,00146$
	ld	a,c
	add	a, -22 (ix)
	ld	-22 (ix),a
	ld	a,b
	adc	a, -21 (ix)
	ld	-21 (ix),a
	ld	a,e
	adc	a, -20 (ix)
	ld	-20 (ix),a
	ld	a,d
	adc	a, -19 (ix)
	ld	-19 (ix),a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0007
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs32.c:427: A[i]+=(unsigned long) a1<<24;
	push	af
	ld	a,-14 (ix)
	ld	-26 (ix),a
	ld	a,-13 (ix)
	ld	-25 (ix),a
	ld	a,-12 (ix)
	ld	-24 (ix),a
	ld	a,-11 (ix)
	ld	-23 (ix),a
	pop	af
	ld	b,#0x18
00148$:
	sla	-26 (ix)
	rl	-25 (ix)
	rl	-24 (ix)
	rl	-23 (ix)
	djnz	00148$
	ld	a,-22 (ix)
	add	a, -26 (ix)
	ld	-26 (ix),a
	ld	a,-21 (ix)
	adc	a, -25 (ix)
	ld	-25 (ix),a
	ld	a,-20 (ix)
	adc	a, -24 (ix)
	ld	-24 (ix),a
	ld	a,-19 (ix)
	adc	a, -23 (ix)
	ld	-23 (ix),a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0003
	add	hl, sp
	ld	bc, #0x0004
	ldir
00106$:
;kectrs32.c:429: if( 3==rq ){
	ld	a,-28 (ix)
	sub	a, #0x03
	jp	NZ,00108$
;kectrs32.c:430: A[i]= (unsigned long) a1;
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x000F
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs32.c:431: A[i]+=(unsigned long) a2<<8;
	push	af
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	e,-16 (ix)
	ld	d,-15 (ix)
	pop	af
	ld	b,#0x08
00152$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00152$
	ld	a,-14 (ix)
	add	a, l
	ld	-26 (ix),a
	ld	a,-13 (ix)
	adc	a, h
	ld	-25 (ix),a
	ld	a,-12 (ix)
	adc	a, e
	ld	-24 (ix),a
	ld	a,-11 (ix)
	adc	a, d
	ld	-23 (ix),a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0003
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs32.c:432: A[i]+=(unsigned long) a3<<16; 
	push	af
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	e,-8 (ix)
	ld	d,-7 (ix)
	pop	af
	ld	b,#0x10
00154$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00154$
	ld	a,-26 (ix)
	add	a, l
	ld	-26 (ix),a
	ld	a,-25 (ix)
	adc	a, h
	ld	-25 (ix),a
	ld	a,-24 (ix)
	adc	a, e
	ld	-24 (ix),a
	ld	a,-23 (ix)
	adc	a, d
	ld	-23 (ix),a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0003
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs32.c:433: A[i]+=(unsigned long) a0<<24;
	push	af
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	pop	af
	ld	b,#0x18
00156$:
	sla	e
	rl	d
	adc	hl, hl
	djnz	00156$
	ld	a,-26 (ix)
	add	a, e
	ld	e,a
	ld	a,-25 (ix)
	adc	a, d
	ld	d,a
	ld	a,-24 (ix)
	adc	a, l
	ld	c,a
	ld	a,-23 (ix)
	adc	a, h
	ld	b,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
00108$:
;kectrs32.c:435: if( 0!=rr ){
	ld	a,-27 (ix)
	or	a, a
	jr	Z,00111$
;kectrs32.c:436: A[i]=rot32( A[i], rr );
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,-27 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	call	_rot32
	pop	af
	pop	af
	inc	sp
	ld	b,l
	ld	c,h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),b
	inc	hl
	ld	(hl),c
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
00111$:
	ld	sp,ix
	pop	ix
	ret
_KRPStep1_end::
;kectrs32.c:440: void KRhoPiStep(){
;	---------------------------------
; Function KRhoPiStep
; ---------------------------------
_KRhoPiStep_start::
_KRhoPiStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;kectrs32.c:442: for( i=0; i<K_LANES; i++ ){
	ld	bc,#0x0000
00102$:
;kectrs32.c:443: KRPStep1( i );
	push	bc
	push	bc
	call	_KRPStep1
	pop	af
	pop	bc
;kectrs32.c:444: B[pB[i]] = A[i];
	ld	hl,#_pB
	add	hl,bc
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	ld	a,#<(_B)
	add	a, l
	ld	e,a
	ld	a,#>(_B)
	adc	a, h
	ld	d,a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	l,a
	ld	a,#>(_A)
	adc	a, h
	ld	h,a
	push	de
	push	bc
	ex	de,hl
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
	pop	de
	push	bc
	ld	hl, #0x0002
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
;kectrs32.c:442: for( i=0; i<K_LANES; i++ ){
	inc	bc
	ld	a,c
	sub	a, #0x19
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
	ld	sp,ix
	pop	ix
	ret
_KRhoPiStep_end::
;kectrs32.c:448: void KKhiStep(){
;	---------------------------------
; Function KKhiStep
; ---------------------------------
_KKhiStep_start::
_KKhiStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-33
	add	hl,sp
	ld	sp,hl
;kectrs32.c:450: for( j=0; j<5; j++ ){
	ld	de,#0x0000
00102$:
;kectrs32.c:451: A[0+5*j] = B[0+5*j]^(B[2+5*j]&(4294967295-B[1+5*j]));
	ld	a,e
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
	ld	-1 (ix), a
	ld	l, a
	ld	a,-1 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_A
	add	hl,bc
	ld	-3 (ix),l
	ld	-2 (ix),h
	ld	hl,#_B
	add	hl,bc
	ld	-5 (ix),l
	ld	-4 (ix),h
	push	de
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	ld	hl, #0x001A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
	add	a, #0x02
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	-11 (ix),l
	ld	-10 (ix),h
	ld	a,#<(_B)
	add	a, -11 (ix)
	ld	-13 (ix),a
	ld	a,#>(_B)
	adc	a, -10 (ix)
	ld	-12 (ix),a
	push	de
	ld	e,-13 (ix)
	ld	d,-12 (ix)
	ld	hl, #0x0012
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	-19 (ix),l
	ld	-18 (ix),h
	ld	a,#<(_B)
	add	a, -19 (ix)
	ld	-21 (ix),a
	ld	a,#>(_B)
	adc	a, -18 (ix)
	ld	-20 (ix),a
	ld	l,-21 (ix)
	ld	h,-20 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,#0xFF
	sub	a, c
	ld	c,a
	ld	a,#0xFF
	sbc	a, b
	ld	b,a
	ld	a,#0xFF
	sbc	a, l
	ld	l,a
	ld	a,#0xFF
	sbc	a, h
	ld	h,a
	ld	a,c
	and	a, -17 (ix)
	ld	c,a
	ld	a,b
	and	a, -16 (ix)
	ld	b,a
	ld	a,l
	and	a, -15 (ix)
	ld	l,a
	ld	a,h
	and	a, -14 (ix)
	ld	h,a
	ld	a,-9 (ix)
	xor	a, c
	ld	-17 (ix),a
	ld	a,-8 (ix)
	xor	a, b
	ld	-16 (ix),a
	ld	a,-7 (ix)
	xor	a, l
	ld	-15 (ix),a
	ld	a,-6 (ix)
	xor	a, h
	ld	-14 (ix),a
	push	de
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0012
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	de
;kectrs32.c:452: A[1+5*j] = B[1+5*j]^(B[3+5*j]&(4294967295-B[2+5*j]));
	ld	a,#<(_A)
	add	a, -19 (ix)
	ld	-19 (ix),a
	ld	a,#>(_A)
	adc	a, -18 (ix)
	ld	-18 (ix),a
	push	de
	ld	e,-21 (ix)
	ld	d,-20 (ix)
	ld	hl, #0x0012
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
	add	a, #0x03
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	-9 (ix),l
	ld	-8 (ix),h
	ld	a,#<(_B)
	add	a, -9 (ix)
	ld	-3 (ix),a
	ld	a,#>(_B)
	adc	a, -8 (ix)
	ld	-2 (ix),a
	push	de
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,#0xFF
	sub	a, c
	ld	c,a
	ld	a,#0xFF
	sbc	a, b
	ld	b,a
	ld	a,#0xFF
	sbc	a, l
	ld	l,a
	ld	a,#0xFF
	sbc	a, h
	ld	h,a
	ld	a,c
	and	a, -25 (ix)
	ld	c,a
	ld	a,b
	and	a, -24 (ix)
	ld	b,a
	ld	a,l
	and	a, -23 (ix)
	ld	l,a
	ld	a,h
	and	a, -22 (ix)
	ld	h,a
	ld	a,-17 (ix)
	xor	a, c
	ld	-25 (ix),a
	ld	a,-16 (ix)
	xor	a, b
	ld	-24 (ix),a
	ld	a,-15 (ix)
	xor	a, l
	ld	-23 (ix),a
	ld	a,-14 (ix)
	xor	a, h
	ld	-22 (ix),a
	push	de
	ld	e,-19 (ix)
	ld	d,-18 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	de
;kectrs32.c:453: A[2+5*j] = B[2+5*j]^(B[4+5*j]&(4294967295-B[3+5*j]));
	ld	iy,#_A
	ld	c,-11 (ix)
	ld	b,-10 (ix)
	add	iy, bc
	push	de
	ld	e,-13 (ix)
	ld	d,-12 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
	add	a, #0x04
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	-19 (ix),l
	ld	-18 (ix),h
	ld	a,#<(_B)
	add	a, -19 (ix)
	ld	-17 (ix),a
	ld	a,#>(_B)
	adc	a, -18 (ix)
	ld	-16 (ix),a
	push	de
	ld	e,-17 (ix)
	ld	d,-16 (ix)
	ld	hl, #0x0006
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,#0xFF
	sub	a, c
	ld	-33 (ix),a
	ld	a,#0xFF
	sbc	a, b
	ld	-32 (ix),a
	ld	a,#0xFF
	sbc	a, l
	ld	-31 (ix),a
	ld	a,#0xFF
	sbc	a, h
	ld	-30 (ix),a
	ld	a,-29 (ix)
	and	a, -33 (ix)
	ld	l,a
	ld	a,-28 (ix)
	and	a, -32 (ix)
	ld	h,a
	ld	a,-27 (ix)
	and	a, -31 (ix)
	ld	c,a
	ld	a,-26 (ix)
	and	a, -30 (ix)
	ld	b,a
	ld	a,l
	xor	a, -25 (ix)
	ld	l,a
	ld	a,h
	xor	a, -24 (ix)
	ld	h,a
	ld	a,c
	xor	a, -23 (ix)
	ld	c,a
	ld	a,b
	xor	a, -22 (ix)
	ld	b,a
	ld	0 (iy),l
	ld	1 (iy),h
	ld	2 (iy),c
	ld	3 (iy),b
;kectrs32.c:454: A[3+5*j] = B[3+5*j]^(B[0+5*j]&(4294967295-B[4+5*j]));
	ld	iy,#_A
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	add	iy, bc
	push	de
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	ld	hl, #0x0006
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,#0xFF
	sub	a, c
	ld	c,a
	ld	a,#0xFF
	sbc	a, b
	ld	b,a
	ld	a,#0xFF
	sbc	a, l
	ld	l,a
	ld	a,#0xFF
	sbc	a, h
	ld	h,a
	ld	a,c
	and	a, -29 (ix)
	ld	c,a
	ld	a,b
	and	a, -28 (ix)
	ld	b,a
	ld	a,l
	and	a, -27 (ix)
	ld	l,a
	ld	a,h
	and	a, -26 (ix)
	ld	h,a
	ld	a,c
	xor	a, -33 (ix)
	ld	c,a
	ld	a,b
	xor	a, -32 (ix)
	ld	b,a
	ld	a,l
	xor	a, -31 (ix)
	ld	l,a
	ld	a,h
	xor	a, -30 (ix)
	ld	h,a
	ld	0 (iy),c
	ld	1 (iy),b
	ld	2 (iy),l
	ld	3 (iy),h
;kectrs32.c:455: A[4+5*j] = B[4+5*j]^(B[1+5*j]&(4294967295-B[0+5*j]));
	ld	iy,#_A
	ld	c,-19 (ix)
	ld	b,-18 (ix)
	add	iy, bc
	push	de
	ld	e,-17 (ix)
	ld	d,-16 (ix)
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	e,-21 (ix)
	ld	d,-20 (ix)
	ld	hl, #0x0006
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
	ld	a,#0xFF
	sub	a, c
	ld	c,a
	ld	a,#0xFF
	sbc	a, b
	ld	b,a
	ld	a,#0xFF
	sbc	a, l
	ld	l,a
	ld	a,#0xFF
	sbc	a, h
	ld	h,a
	ld	a,c
	and	a, -29 (ix)
	ld	c,a
	ld	a,b
	and	a, -28 (ix)
	ld	b,a
	ld	a,l
	and	a, -27 (ix)
	ld	l,a
	ld	a,h
	and	a, -26 (ix)
	ld	h,a
	ld	a,c
	xor	a, -33 (ix)
	ld	c,a
	ld	a,b
	xor	a, -32 (ix)
	ld	b,a
	ld	a,l
	xor	a, -31 (ix)
	ld	l,a
	ld	a,h
	xor	a, -30 (ix)
	ld	h,a
	ld	0 (iy),c
	ld	1 (iy),b
	ld	2 (iy),l
	ld	3 (iy),h
;kectrs32.c:450: for( j=0; j<5; j++ ){
	inc	de
	ld	a,e
	sub	a, #0x05
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00102$
	ld	sp,ix
	pop	ix
	ret
_KKhiStep_end::
;kectrs32.c:460: void KRounds(){
;	---------------------------------
; Function KRounds
; ---------------------------------
_KRounds_start::
_KRounds:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-19
	add	hl,sp
	ld	sp,hl
;kectrs32.c:463: char title[]="Round ";
	ld	hl,#0x0000
	add	hl,sp
	ex	de,hl
	ld	a,#0x52
	ld	(de),a
	ld	l, e
	ld	h, d
	inc	hl
	ld	(hl),#0x6F
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl),#0x75
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x6E
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#0x64
	ld	hl,#0x0005
	add	hl,de
	ld	(hl),#0x20
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
;kectrs32.c:465: for( j=0; j< K_ROUNDS; j++ ){
	ld	-2 (ix),e
	ld	-1 (ix),d
	ld	-12 (ix),#0x00
	ld	-11 (ix),#0x00
00111$:
;kectrs32.c:466: KThetaStep();
	call	_KThetaStep
;kectrs32.c:474: KRhoPiStep();
	call	_KRhoPiStep
;kectrs32.c:482: KKhiStep();
	call	_KKhiStep
;kectrs32.c:485: A[0] ^= RC[j];
	ld	de,#_A
	ld	hl, #0x000D
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	add	hl, hl
	add	hl, hl
	ld	de,#_RC
	add	hl,de
	ex	de,hl
	ld	hl, #0x0009
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a,-6 (ix)
	xor	a, -10 (ix)
	ld	e,a
	ld	a,-5 (ix)
	xor	a, -9 (ix)
	ld	d,a
	ld	a,-4 (ix)
	xor	a, -8 (ix)
	ld	c,a
	ld	a,-3 (ix)
	xor	a, -7 (ix)
	ld	b,a
	ld	(_A), de
	ld	(_A + 2), bc
;kectrs32.c:489: print_str( title ); 
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_print_str
	pop	af
;kectrs32.c:490: print_char(j+1);
	ld	h,-12 (ix)
	inc	h
	push	hl
	inc	sp
	call	_print_char
	inc	sp
;kectrs32.c:492: for( i=0; i<K_LANES; i++ ){
	ld	de,#0x0000
00109$:
;kectrs32.c:493: if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
	ld	a,d
	or	a,e
	jr	Z,00101$
	ld	a,e
	sub	a,#0x05
	jr	NZ,00138$
	or	a,d
	jr	Z,00101$
00138$:
	ld	a,e
	sub	a,#0x0A
	jr	NZ,00139$
	or	a,d
	jr	Z,00101$
00139$:
	ld	a,e
	sub	a,#0x0F
	jr	NZ,00140$
	or	a,d
	jr	Z,00101$
00140$:
	ld	a,e
	sub	a,#0x14
	jr	NZ,00102$
	or	a,d
	jr	NZ,00102$
00101$:
	push	de
	call	_print_crlf
	pop	de
00102$:
;kectrs32.c:494: print_short( (unsigned short)( A[i]%65536 ) );
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	-10 (ix),a
	ld	a,#>(_A)
	adc	a, h
	ld	-9 (ix),a
	push	de
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	ld	hl, #0x000F
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	de
	push	hl
	call	_print_short
	pop	af
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	ld	hl, #0x000B
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	push	af
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	pop	af
	ld	a,#0x10
00143$:
	srl	b
	rr	c
	rr	h
	rr	l
	dec	a
	jr	NZ,00143$
	push	de
	push	hl
	call	_print_short
	pop	af
	pop	de
;kectrs32.c:492: for( i=0; i<K_LANES; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x19
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00109$
;kectrs32.c:497: print_crlf();
	call	_print_crlf
;kectrs32.c:465: for( j=0; j< K_ROUNDS; j++ ){
	inc	-12 (ix)
	jr	NZ,00145$
	inc	-11 (ix)
00145$:
	ld	a,-12 (ix)
	sub	a, #0x16
	ld	a,-11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00111$
	ld	sp,ix
	pop	ix
	ret
_KRounds_end::
;kectrs32.c:520: void print_crlf(){
;	---------------------------------
; Function print_crlf
; ---------------------------------
_print_crlf_start::
_print_crlf:
;kectrs32.c:524: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
;kectrs32.c:525: return;
	ret
_print_crlf_end::
;kectrs32.c:529: void print_char(unsigned char c ){
;	---------------------------------
; Function print_char
; ---------------------------------
_print_char_start::
_print_char:
;kectrs32.c:530: if( c<10 ){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x0A
	jr	NC,00102$
;kectrs32.c:534: __endasm;
	ld a,#0x20
	call 0x33
00102$:
;kectrs32.c:536: if( c<100 ){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x64
	jr	NC,00104$
;kectrs32.c:540: __endasm;
	ld a,#0x20
	call 0x33
00104$:
;kectrs32.c:555: __endasm;
	ld iy,#0x02
	add iy,sp ; first arg is at sp+2
	ld l,0(iy) ; arg c in hl
	ld h,#0
	call #0x0a9a ; move HL to ACC
	ld hl,#_buf + 0 ; buffer for ASCII conversion
	call #0x0fbd ; ACC to ASCII string
	xor a,a
	ld (#0x409c),a ; video=0
	call #0x28a7 ; print string at cursor
	ld a,#0x20 ; space=0x20h
	call 0x33 ; print it
;kectrs32.c:556: return;
	ret
_print_char_end::
;kectrs32.c:559: void print_short(unsigned short c ){
;	---------------------------------
; Function print_short
; ---------------------------------
_print_short_start::
_print_short:
;kectrs32.c:574: __endasm;
	ld iy,#0x02
	add iy,sp ; first arg is at sp+2
	ld l,0(iy) ; arg c in hl
	ld h,1(iy)
	call #0x0a9a ; move HL to ACC
	ld hl,#_buf + 0 ; buffer for ASCII conversion
	call #0x0fbd ; ACC to ASCII string
	xor a,a
	ld (#0x409c),a ; video=0
	call #0x28a7 ; print string at cursor
	ld a,#0x20 ; space=0x20h
	call 0x33 ; print it
;kectrs32.c:575: return;
	ret
_print_short_end::
;kectrs32.c:580: void print_str( unsigned char *s ){
;	---------------------------------
; Function print_str
; ---------------------------------
_print_str_start::
_print_str:
;kectrs32.c:590: __endasm;
	ld iy,#0x02
	add iy,sp
	ld l,0(iy)
	ld h,1(iy)
	xor a,a
	ld (#0x409c),a
	call #0x28a7
;kectrs32.c:591: return;
	ret
_print_str_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
