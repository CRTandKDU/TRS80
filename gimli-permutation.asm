;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.9 #9995 (MINGW32)
;--------------------------------------------------------
	.module gimli_permutation
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _state
	.globl _cy
	.globl _v
	.globl _u
	.globl _z
	.globl _y
	.globl _x
	.globl _hex
	.globl _spbox_zerocy
	.globl _spbox_rotate
	.globl _spbox_x
	.globl _spbox_y
	.globl _spbox_z
	.globl _state_print
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_x::
	.ds 4
_y::
	.ds 4
_z::
	.ds 4
_u::
	.ds 4
_v::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_cy::
	.ds 1
_state::
	.ds 48
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
;gimli-permutation.c:28: void main( void ){
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
;gimli-permutation.c:41: for( round=24; round > 0; round-- ){
	ld	-2 (ix), #0x18
	ld	-1 (ix), #0x00
;gimli-permutation.c:42: for( col=0; col<4; col++ ){
00115$:
	ld	-3 (ix), #0x00
00109$:
;gimli-permutation.c:44: spbox_zerocy();
	call	_spbox_zerocy
;gimli-permutation.c:46: spbox_rotate( col );
	ld	a, -3 (ix)
	push	af
	inc	sp
	call	_spbox_rotate
	inc	sp
;gimli-permutation.c:47: x = state[col]; y = state[col+4]; z = state[col+8];
	ld	l, -3 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	bc,#_state
	add	hl,bc
	ex	de, hl
	ld	l, e
	ld	h, d
	ld	a, (hl)
	ld	iy, #_x
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	inc	hl
	ld	a, (hl)
	ld	2 (iy), a
	inc	hl
	ld	a, (hl)
	ld	3 (iy), a
	ld	l, -3 (ix)
	inc	l
	inc	l
	inc	l
	inc	l
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	bc,#_state
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a, (hl)
	ld	iy, #_y
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	inc	hl
	ld	a, (hl)
	ld	2 (iy), a
	inc	hl
	ld	a, (hl)
	ld	3 (iy), a
	ld	a, -3 (ix)
	add	a, #0x08
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	a, #<(_state)
	add	a, l
	ld	-5 (ix), a
	ld	a, #>(_state)
	adc	a, h
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	iy, #_z
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	inc	hl
	ld	a, (hl)
	ld	2 (iy), a
	inc	hl
	ld	a, (hl)
	ld	3 (iy), a
;gimli-permutation.c:50: spbox_x();
	push	bc
	push	de
	call	_spbox_x
	call	_spbox_y
	call	_spbox_z
	pop	de
	pop	bc
;gimli-permutation.c:58: state[col] = z; state[col+4] = y; state[col+8] = x;
	ld	iy, #_z
	ld	a, 0 (iy)
	ld	(de), a
	inc	de
	ld	a, 1 (iy)
	ld	(de), a
	inc	de
	ld	a, 2 (iy)
	ld	(de), a
	inc	de
	ld	a, 3 (iy)
	ld	(de), a
	ld	iy, #_y
	ld	a, 0 (iy)
	ld	(bc), a
	inc	bc
	ld	a, 1 (iy)
	ld	(bc), a
	inc	bc
	ld	a, 2 (iy)
	ld	(bc), a
	inc	bc
	ld	a, 3 (iy)
	ld	(bc), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	iy, #_x
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 2 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 3 (iy)
	ld	(hl), a
;gimli-permutation.c:42: for( col=0; col<4; col++ ){
	inc	-3 (ix)
	ld	a, -3 (ix)
	sub	a, #0x04
	jp	C, 00109$
;gimli-permutation.c:61: if( 0 == (round&3) ){
	ld	a, -2 (ix)
	and	a, #0x03
	ld	-5 (ix), a
;gimli-permutation.c:62: x = state[0]; state[0] = state[1]; state[1] = x;
;gimli-permutation.c:63: x = state[2]; state[2] = state[3]; state[3] = x;
;gimli-permutation.c:61: if( 0 == (round&3) ){
	ld	-4 (ix), #0x00
	ld	a, #0x00
	or	a, -5 (ix)
	jp	NZ, 00103$
;gimli-permutation.c:62: x = state[0]; state[0] = state[1]; state[1] = x;
	ld	hl, #_state + 0
	ld	a, (hl)
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	inc	hl
	ld	a, (hl)
	ld	2 (iy), a
	inc	hl
	ld	a, (hl)
	ld	3 (iy), a
	ld	de, #(_state + 0x0004)
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	de, #_state
	ld	hl, #0x0000
	add	hl, sp
	ld	bc, #0x0004
	ldir
	ld	hl, #(_state + 0x0004)
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 2 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 3 (iy)
	ld	(hl), a
;gimli-permutation.c:63: x = state[2]; state[2] = state[3]; state[3] = x;
	ld	hl, #(_state + 0x0008) + 0
	ld	a, (hl)
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	inc	hl
	ld	a, (hl)
	ld	2 (iy), a
	inc	hl
	ld	a, (hl)
	ld	3 (iy), a
	ld	bc, (#(_state + 0x000c) + 0)
	ld	de, (#(_state + 0x000c) + 2)
	ld	((_state + 0x0008)), bc
	ld	((_state + 0x0008)+2), de
	ld	hl, #(_state + 0x000c)
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 2 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 3 (iy)
	ld	(hl), a
00103$:
;gimli-permutation.c:66: if( 2 == (round&3) ){
	ld	a, -5 (ix)
	sub	a, #0x02
	or	a, -4 (ix)
	jr	NZ,00105$
;gimli-permutation.c:67: x = state[0]; state[0] = state[2]; state[2] = x;
	ld	hl, #_state + 0
	ld	a, (hl)
	ld	iy, #_x
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	inc	hl
	ld	a, (hl)
	ld	2 (iy), a
	inc	hl
	ld	a, (hl)
	ld	3 (iy), a
	ld	bc, (#(_state + 0x0008) + 0)
	ld	de, (#(_state + 0x0008) + 2)
	ld	(_state), bc
	ld	(_state+2), de
	ld	hl, #(_state + 0x0008)
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 2 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 3 (iy)
	ld	(hl), a
;gimli-permutation.c:68: x = state[1]; state[1] = state[3]; state[3] = x;
	ld	hl, #(_state + 0x0004) + 0
	ld	a, (hl)
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	inc	hl
	ld	a, (hl)
	ld	2 (iy), a
	inc	hl
	ld	a, (hl)
	ld	3 (iy), a
	ld	bc, (#(_state + 0x000c) + 0)
	ld	de, (#(_state + 0x000c) + 2)
	ld	((_state + 0x0004)), bc
	ld	((_state + 0x0004)+2), de
	ld	hl, #(_state + 0x000c)
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 2 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 3 (iy)
	ld	(hl), a
00105$:
;gimli-permutation.c:71: if( 0 == (round&3) ){
	ld	a, -4 (ix)
	or	a, -5 (ix)
	jr	NZ,00112$
;gimli-permutation.c:72: state[0] = state[0] ^ ((unsigned long) 0x9e377900 | (unsigned long)round);
	ld	de, #_state
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	a, b
	rla
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	a, b
	or	a, #0x79
	ld	b, a
	ld	a, e
	or	a, #0x37
	ld	e, a
	ld	a, d
	or	a, #0x9e
	ld	d, a
	ld	a, c
	xor	a, -9 (ix)
	ld	c, a
	ld	a, b
	xor	a, -8 (ix)
	ld	b, a
	ld	a, e
	xor	a, -7 (ix)
	ld	e, a
	ld	a, d
	xor	a, -6 (ix)
	ld	d, a
	ld	(_state), bc
	ld	(_state+2), de
00112$:
;gimli-permutation.c:41: for( round=24; round > 0; round-- ){
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00147$
	xor	a, #0x80
00147$:
	jp	M, 00115$
;gimli-permutation.c:79: state_print();
	call	_state_print
;gimli-permutation.c:86: __endasm;
	ld	a,#0x0d ; CR
	call	0x33 ; Print it
	ld	hl,#0x6cc ; BASIC command line
	jp	(hl)
	ld	sp, ix
	pop	ix
	ret
_hex:
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
;gimli-permutation.c:90: void spbox_zerocy(){
;	---------------------------------
; Function spbox_zerocy
; ---------------------------------
_spbox_zerocy::
;gimli-permutation.c:91: cy = 0;
	ld	hl,#_cy + 0
	ld	(hl), #0x00
	ret
;gimli-permutation.c:96: void spbox_rotate( char col ){
;	---------------------------------
; Function spbox_rotate
; ---------------------------------
_spbox_rotate::
;gimli-permutation.c:123: __endasm;
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	l,4 (ix)
	ld	a,4 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	de,#_state
	add	hl,de
	ld	e, l
	ld	d, h
	ld	a,(de)
	push	de
	pop	hl
	inc	hl
	ld	c,#0x03
	ld	b,#0x00
	ldir
	ld	(de),a;
;gimli-permutation.c:162: __endasm;
	ld	l,4 (ix)
	ld	a,4 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	de,#_state
	add	hl,de
	ld	bc, #0x10
	add	hl,bc
	ld	e, l
	ld	d, h
	inc	de
	inc	de
	push	de
	pop	hl
	inc	de
	ld	a,(de)
	ld	c,#0x03
	ld	b,#0x00
	lddr
	ld	(de), a
	push	de
	pop	iy
	ld	a,3 (iy)
	rl	a
	rl	0 (iy)
	rl	1 (iy)
	rl	2 (iy)
	rl	3 (iy)
	pop	ix
;gimli-permutation.c:163: return;
	ret
;gimli-spboxx.c:11: void spbox_x(){
;	---------------------------------
; Function spbox_x
; ---------------------------------
_spbox_x::
;gimli-spboxx.c:135: __endasm;
	ld	iy,#_cy
	ld	e,#0x0
	ld	d,#0x0
;
	ld	hl,#_x+0
	ld	c,(hl)
	ld	hl,#_u+0
	ld	(hl),c
;
	ld	hl,#_z+0
	ld	b,(hl)
	ld	a,b
	sla	b
	rl	0 (iy)
	ld	hl,#_v+0
	ld	(hl),b
;
	ld	hl,#_y+0
	and	(hl)
;
	sla	a
	rl	d
	sla	a
	rl	e
;
	xor	b
	xor	c
;
	ld	hl,#_x+0
	ld	(hl),a
	ld	hl,#_x+1
	ld	c,(hl)
	ld	hl,#_u+1
	ld	(hl),c
;
	ld	hl,#_z+1
	ld	b,(hl)
	ld	a,b
	rr	0(iy)
	rl	b
	rl	0 (iy)
	ld	hl,#_v+1
	ld	(hl),b
;
	ld	hl,#_y+1
	and	(hl)
;
	rr	d
	rl	a
	rl	d
	rr	e
	rl	a
	rl	e
;
	xor	b
	xor	c
;
	ld	hl,#_x+1
	ld	(hl),a
	ld	hl,#_x+2
	ld	c,(hl)
	ld	hl,#_u+2
	ld	(hl),c
;
	ld	hl,#_z+2
	ld	b,(hl)
	ld	a,b
	rr	0(iy)
	rl	b
	rl	0 (iy)
	ld	hl,#_v+2
	ld	(hl),b
;
	ld	hl,#_y+2
	and	(hl)
;
	rr	d
	rl	a
	rl	d
	rr	e
	rl	a
	rl	e
;
	xor	b
	xor	c
;
	ld	hl,#_x+2
	ld	(hl),a
	ld	hl,#_x+3
	ld	c,(hl)
	ld	hl,#_u+3
	ld	(hl),c
;
	ld	hl,#_z+3
	ld	b,(hl)
	ld	a,b
	rr	0(iy)
	rl	b
	rl	0 (iy)
	ld	hl,#_v+3
	ld	(hl),b
;
	ld	hl,#_y+3
	and	(hl)
;
	rr	d
	rl	a
	rl	d
	rr	e
	rl	a
	rl	e
;
	xor	b
	xor	c
;
	ld	hl,#_x+3
	ld	(hl),a
;gimli-spboxx.c:136: return;
	ret
;gimli-spboxy.c:10: void spbox_y(){
;	---------------------------------
; Function spbox_y
; ---------------------------------
_spbox_y::
;gimli-spboxy.c:93: __endasm;
	ld	d,#0x00
	ld	hl,#_y+0
	ld	c,(hl)
	ld	hl,#_v+0
	ld	(hl),c
	ld	hl,#_u+0
	ld	b,(hl)
	ld	hl,#_z+0
	ld	a,(hl)
	or	b
	sla	a
	rl	d
	xor	b
	xor	c
	ld	hl,#_y+0
	ld	(hl),a
	ld	hl,#_y+1
	ld	c,(hl)
	ld	hl,#_v+1
	ld	(hl),c
	ld	hl,#_u+1
	ld	b,(hl)
	ld	hl,#_z+1
	ld	a,(hl)
	or	b
	rr	d
	rl	a
	rl	d
	xor	b
	xor	c
	ld	hl,#_y+1
	ld	(hl),a
	ld	hl,#_y+2
	ld	c,(hl)
	ld	hl,#_v+2
	ld	(hl),c
	ld	hl,#_u+2
	ld	b,(hl)
	ld	hl,#_z+2
	ld	a,(hl)
	or	b
	rr	d
	rl	a
	rl	d
	xor	b
	xor	c
	ld	hl,#_y+2
	ld	(hl),a
	ld	hl,#_y+3
	ld	c,(hl)
	ld	hl,#_v+3
	ld	(hl),c
	ld	hl,#_u+3
	ld	b,(hl)
	ld	hl,#_z+3
	ld	a,(hl)
	or	b
	rr	d
	rl	a
	rl	d
	xor	b
	xor	c
	ld	hl,#_y+3
	ld	(hl),a
;gimli-spboxy.c:94: return;
	ret
;gimli-spboxz.c:10: void spbox_z(){
;	---------------------------------
; Function spbox_z
; ---------------------------------
_spbox_z::
;gimli-spboxz.c:95: __endasm;
	ld	hl,#_cy
	ld	a,#0x00
	ld	(hl),a
	ld	d, a
	ld	e, a
	ld	hl,#_u+0
	ld	a,(hl)
	ld	hl,#_v+0
	ld	b,(hl)
	and	b
	ld	hl,#_cy
	sla	a
	rl	(hl)
	sla	a
	rl	d
	sla	a
	rl	e
	xor	b
	ld	hl,#_z+0
	xor	(hl)
	ld	(hl),a
	ld	hl,#_u+1
	ld	a,(hl)
	ld	hl,#_v+1
	ld	b,(hl)
	and	b
	ld	hl,#_cy
	rr	(hl)
	rl	a
	rl	(hl)
	rr	d
	rl	a
	rl	d
	rr	e
	rl	a
	rl	e
	xor	b
	ld	hl,#_z+1
	xor	(hl)
	ld	(hl),a
	ld	hl,#_u+2
	ld	a,(hl)
	ld	hl,#_v+2
	ld	b,(hl)
	and	b
	ld	hl,#_cy
	rr	(hl)
	rl	a
	rl	(hl)
	rr	d
	rl	a
	rl	d
	rr	e
	rl	a
	rl	e
	xor	b
	ld	hl,#_z+2
	xor	(hl)
	ld	(hl),a
	ld	hl,#_u+3
	ld	a,(hl)
	ld	hl,#_v+3
	ld	b,(hl)
	and	b
	ld	hl,#_cy
	rr	(hl)
	rl	a
	rl	(hl)
	rr	d
	rl	a
	rl	d
	rr	e
	rl	a
	rl	e
	xor	b
	ld	hl,#_z+3
	xor	(hl)
	ld	(hl),a
	ret
;gimli-print.c:2: void state_print(){
;	---------------------------------
; Function state_print
; ---------------------------------
_state_print::
;gimli-print.c:112: __endasm;
	ld	hl, #0x409c
	ld	a,#0x0
	ld	(hl),a
	ld	a,#0x0d
	call	0x33
	ld	iy,#_state
	ld	hl, #_cy+0
	ld	a, #0x03
	ld	(hl),a
	    00004$:
	ld	b, #0x04
	    00005$:
	ld	a, 3 (iy)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	e,a
	ld	d,#0x00
	ld	hl,#_hex+0
	add	hl,de
	ld	a,(hl)
	call	0x33
	ld	a, 3 (iy)
	and	a, #0x0F
	ld	e, a
	ld	d,#0x00
	ld	hl,#_hex+0
	add	hl, de
	ld	a,(hl)
	call	0x33
	ld	a, 2 (iy)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	e, a
	ld	d, #0x00
	ld	hl,#_hex+0
	add	hl, de
	ld	a,(hl)
	call	0x33
	ld	a, 2 (iy)
	and	a, #0x0F
	ld	e, a
	ld	d, #0x00
	ld	hl,#_hex+0
	add	hl, de
	ld	a,(hl)
	call	0x33
	ld	a, 1 (iy)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	e, a
	ld	d, #0x00
	ld	hl,#_hex+0
	add	hl, de
	ld	a,(hl)
	call	0x33
	ld	a, 1 (iy)
	and	a, #0x0F
	ld	e, a
	ld	d, #0x00
	ld	hl,#_hex+0
	add	hl, de
	ld	a,(hl)
	call	0x33
	ld	a, 0 (iy)
	srl	a
	srl	a
	srl	a
	srl	a
	ld	e, a
	ld	d, #0x00
	ld	hl,#_hex+0
	add	hl, de
	ld	a,(hl)
	call	0x33
	ld	a, 0 (iy)
	and	a, #0x0F
	ld	e, a
	ld	d, #0x00
	ld	hl,#_hex+0
	add	hl, de
	ld	a,(hl)
	call	0x33
	ld	a,#0x20
	call	0x33
	call	0x33
	inc	iy
	inc	iy
	inc	iy
	inc	iy
	dec	b
	jp	NZ,00005$
	ld	a,#0x0d
	call	0x33
	ld	hl,#_cy+0
	dec	(hl)
	jp	NZ,00004$
;gimli-print.c:113: return;
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__cy:
	.db #0x00	; 0
__xinit__state:
	.byte #0x00,#0x00,#0x00,#0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.area _CABS (ABS)
