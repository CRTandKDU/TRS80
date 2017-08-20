;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Sat Aug 19 15:01:01 2017
;--------------------------------------------------------
	.module gimli_permutation
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _state
	.globl _hex
	.globl _cy
	.globl _hexc
	.globl _v
	.globl _u
	.globl _z
	.globl _y
	.globl _x
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
_hexc::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_cy::
	.ds 1
_hex::
	.ds 16
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
;gimli-permutation.c:23: void main( void ){
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
;gimli-permutation.c:26: for( round=24; round > 0; round-- ){
	ld	hl,#0x0018
	ex	(sp), hl
;gimli-permutation.c:27: for( col=0; col<4; col++ ){
00115$:
	ld	d,#0x00
00109$:
;gimli-permutation.c:29: spbox_zerocy();
	push	de
	call	_spbox_zerocy
	pop	de
;gimli-permutation.c:31: spbox_rotate( col );
	push	de
	push	de
	inc	sp
	call	_spbox_rotate
	inc	sp
	pop	de
;gimli-permutation.c:32: x = state[col]; y = state[col+4]; z = state[col+8];
	ld	a,d
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_state)
	add	a, l
	ld	c,a
	ld	a,#>(_state)
	adc	a, h
	ld	b,a
	ld	l, c
	ld	h, b
	ld	a,(hl)
	ld	iy,#_x
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_x + 3),a
	ld	a,d
	add	a, #0x04
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_state)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_state)
	adc	a, h
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	ld	iy,#_y
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_y
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_y
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_y + 3),a
	ld	a,d
	add	a, #0x08
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_state)
	add	a, l
	ld	-4 (ix),a
	ld	a,#>(_state)
	adc	a, h
	ld	-3 (ix),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	iy,#_z
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_z
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_z
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_z + 3),a
;gimli-permutation.c:35: spbox_x();
	push	bc
	push	de
	call	_spbox_x
	call	_spbox_y
	call	_spbox_z
	pop	de
	pop	bc
;gimli-permutation.c:43: state[col] = z; state[col+4] = y; state[col+8] = x;
	ld	a,(#_z + 0)
	ld	(bc),a
	inc	bc
	ld	a,(#_z + 1)
	ld	(bc),a
	inc	bc
	ld	a,(#_z + 2)
	ld	(bc),a
	inc	bc
	ld	a,(#_z + 3)
	ld	(bc),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(#_y + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#_y + 1)
	ld	(hl),a
	inc	hl
	ld	a,(#_y + 2)
	ld	(hl),a
	inc	hl
	ld	a,(#_y + 3)
	ld	(hl),a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(#_x + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 1)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 2)
	ld	(hl),a
	inc	hl
	ld	iy,#_x
	ld	a,3 (iy)
	ld	(hl),a
;gimli-permutation.c:27: for( col=0; col<4; col++ ){
	inc	d
	ld	a,d
	xor	a, #0x80
	sub	a, #0x84
	jp	C,00109$
;gimli-permutation.c:46: if( 0 == (round&3) ){
	ld	a,-10 (ix)
	and	a, #0x03
	ld	-4 (ix),a
;gimli-permutation.c:47: x = state[0]; state[0] = state[1]; state[1] = x;
;gimli-permutation.c:48: x = state[2]; state[2] = state[3]; state[3] = x;
;gimli-permutation.c:46: if( 0 == (round&3) ){
	ld	-3 (ix), #0x00
	ld	a, #0x00
	or	a,-4 (ix)
	jp	NZ,00103$
;gimli-permutation.c:47: x = state[0]; state[0] = state[1]; state[1] = x;
	ld	hl, #_state + 0
	ld	a,(hl)
	ld	iy,#_x
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	3 (iy),a
	ld	de,#(_state + 0x0004)
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	de,#_state
	ld	hl, #0x0002
	add	hl, sp
	ld	bc, #0x0004
	ldir
	ld	hl,#(_state + 0x0004)
	ld	a,(#_x + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 1)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 2)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 3)
	ld	(hl),a
;gimli-permutation.c:48: x = state[2]; state[2] = state[3]; state[3] = x;
	ld	hl, #(_state + 0x0008) + 0
	ld	a,(hl)
	ld	iy,#_x
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_x + 3),a
	ld	de, (#(_state + 0x000c) + 0)
	ld	bc, (#(_state + 0x000c) + 2)
	ld	((_state + 0x0008)), de
	ld	((_state + 0x0008) + 2), bc
	ld	hl,#(_state + 0x000c)
	ld	a,(#_x + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 1)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 2)
	ld	(hl),a
	inc	hl
	ld	iy,#_x
	ld	a,3 (iy)
	ld	(hl),a
00103$:
;gimli-permutation.c:51: if( 2 == (round&3) ){
	ld	a,-4 (ix)
	sub	a, #0x02
	jp	NZ,00105$
	ld	a,-3 (ix)
	or	a, a
	jp	NZ,00105$
;gimli-permutation.c:52: x = state[0]; state[0] = state[2]; state[2] = x;
	ld	hl, #_state + 0
	ld	a,(hl)
	ld	iy,#_x
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_x + 3),a
	ld	de, (#(_state + 0x0008) + 0)
	ld	bc, (#(_state + 0x0008) + 2)
	ld	(_state), de
	ld	(_state + 2), bc
	ld	hl,#(_state + 0x0008)
	ld	a,(#_x + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 1)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 2)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 3)
	ld	(hl),a
;gimli-permutation.c:53: x = state[1]; state[1] = state[3]; state[3] = x;
	ld	hl, #(_state + 0x0004) + 0
	ld	a,(hl)
	ld	iy,#_x
	ld	0 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	1 (iy),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_x
	ld	2 (iy),a
	inc	hl
	ld	a,(hl)
	ld	(#_x + 3),a
	ld	de, (#(_state + 0x000c) + 0)
	ld	bc, (#(_state + 0x000c) + 2)
	ld	((_state + 0x0004)), de
	ld	((_state + 0x0004) + 2), bc
	ld	hl,#(_state + 0x000c)
	ld	a,(#_x + 0)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 1)
	ld	(hl),a
	inc	hl
	ld	a,(#_x + 2)
	ld	(hl),a
	inc	hl
	ld	iy,#_x
	ld	a,3 (iy)
	ld	(hl),a
00105$:
;gimli-permutation.c:56: if( 0 == (round&3) ){
	ld	a,-3 (ix)
	or	a,-4 (ix)
	jr	NZ,00112$
;gimli-permutation.c:57: state[0] = state[0] ^ ((unsigned long) 0x9e377900 | (unsigned long)round);
	ld	de,#_state
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	ld	a,-9 (ix)
	rla
	sbc	a, a
	ld	l,a
	ld	b,a
	ld	a,d
	or	a, #0x79
	ld	h,a
	ld	a,l
	or	a, #0x37
	ld	l,a
	ld	a,b
	or	a, #0x9E
	ld	d,a
	ld	a,-8 (ix)
	xor	a, e
	ld	-8 (ix),a
	ld	a,-7 (ix)
	xor	a, h
	ld	-7 (ix),a
	ld	a,-6 (ix)
	xor	a, l
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, d
	ld	-5 (ix),a
	ld	de,#_state
	ld	hl, #0x0002
	add	hl, sp
	ld	bc, #0x0004
	ldir
00112$:
;gimli-permutation.c:26: for( round=24; round > 0; round-- ){
	pop	hl
	push	hl
	dec	hl
	ex	(sp), hl
	xor	a, a
	cp	a, -10 (ix)
	sbc	a, -9 (ix)
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	M,00115$
;gimli-permutation.c:64: state_print();
	call	_state_print
;gimli-permutation.c:71: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
	ld hl,#0x6cc ; BASIC command line
	jp (hl)
	ld	sp,ix
	pop	ix
	ret
_main_end::
;gimli-permutation.c:75: void spbox_zerocy(){
;	---------------------------------
; Function spbox_zerocy
; ---------------------------------
_spbox_zerocy_start::
_spbox_zerocy:
;gimli-permutation.c:76: cy = 0;
	ld	hl,#_cy + 0
	ld	(hl), #0x00
	ret
_spbox_zerocy_end::
;gimli-permutation.c:81: void spbox_rotate( char col ){
;	---------------------------------
; Function spbox_rotate
; ---------------------------------
_spbox_rotate_start::
_spbox_rotate:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;gimli-permutation.c:82: char c, *p = (char *)(state+col);
	ld	l,4 (ix)
	ld	a,4 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_state)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_state)
	adc	a, h
	ld	-1 (ix),a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
;gimli-permutation.c:84: c = p[0]; p[0] = p[1]; p[1]=p[2]; p[2]=p[3]; p[3]=c;
	ld	a,(de)
	ld	-3 (ix),a
	ld	c, e
	ld	b, d
	inc	bc
	ld	a,(bc)
	ld	(de),a
	push	de
	pop	iy
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	ld	(bc),a
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	0 (iy), a
	ld	a,-3 (ix)
	ld	(hl),a
;gimli-permutation.c:86: p = (char *)(state+col+4);
	ld	a,-2 (ix)
	add	a, #0x10
	ld	h,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	l,a
	ld	e, h
	ld	d, l
;gimli-permutation.c:97: __endasm;
	push de
	pop iy
	ld a,3 (iy)
	rl a
	rl 0 (iy)
	rl 1 (iy)
	rl 2 (iy)
	rl 3 (iy)
;gimli-permutation.c:98: c = p[3]; p[3]=p[2]; p[2]=p[1]; p[1]=p[0]; p[0]=c;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	-3 (ix),a
	push	de
	pop	iy
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	ld	(bc),a
	ld	c, e
	ld	b, d
	inc	bc
	ld	a,(bc)
	ld	0 (iy), a
	ld	a,(de)
	ld	(bc),a
	ld	a,-3 (ix)
	ld	(de),a
;gimli-permutation.c:99: return;
	ld	sp,ix
	pop	ix
	ret
_spbox_rotate_end::
;gimli-spboxx.c:11: void spbox_x(){
;	---------------------------------
; Function spbox_x
; ---------------------------------
_spbox_x_start::
_spbox_x:
;gimli-spboxx.c:135: __endasm;
	ld iy,#_cy
	ld e,#0x0
	ld d,#0x0
;
	ld hl,#_x+0
	ld c,(hl)
	ld hl,#_u+0
	ld (hl),c
;
	ld hl,#_z+0
	ld b,(hl)
	ld a,b
	sla b
	rl 0 (iy)
	ld hl,#_v+0
	ld (hl),b
;
	ld hl,#_y+0
	and (hl)
;
	sla a
	rl d
	sla a
	rl e
;
	xor b
	xor c
;
	ld hl,#_x+0
	ld (hl),a
	ld hl,#_x+1
	ld c,(hl)
	ld hl,#_u+1
	ld (hl),c
;
	ld hl,#_z+1
	ld b,(hl)
	ld a,b
	rr 0(iy)
	rl b
	rl 0 (iy)
	ld hl,#_v+1
	ld (hl),b
;
	ld hl,#_y+1
	and (hl)
;
	rr d
	rl a
	rl d
	rr e
	rl a
	rl e
;
	xor b
	xor c
;
	ld hl,#_x+1
	ld (hl),a
	ld hl,#_x+2
	ld c,(hl)
	ld hl,#_u+2
	ld (hl),c
;
	ld hl,#_z+2
	ld b,(hl)
	ld a,b
	rr 0(iy)
	rl b
	rl 0 (iy)
	ld hl,#_v+2
	ld (hl),b
;
	ld hl,#_y+2
	and (hl)
;
	rr d
	rl a
	rl d
	rr e
	rl a
	rl e
;
	xor b
	xor c
;
	ld hl,#_x+2
	ld (hl),a
	ld hl,#_x+3
	ld c,(hl)
	ld hl,#_u+3
	ld (hl),c
;
	ld hl,#_z+3
	ld b,(hl)
	ld a,b
	rr 0(iy)
	rl b
	rl 0 (iy)
	ld hl,#_v+3
	ld (hl),b
;
	ld hl,#_y+3
	and (hl)
;
	rr d
	rl a
	rl d
	rr e
	rl a
	rl e
;
	xor b
	xor c
;
	ld hl,#_x+3
	ld (hl),a
;gimli-spboxx.c:136: return;
	ret
_spbox_x_end::
;gimli-spboxy.c:10: void spbox_y(){
;	---------------------------------
; Function spbox_y
; ---------------------------------
_spbox_y_start::
_spbox_y:
;gimli-spboxy.c:93: __endasm;
	ld d,#0x00
	ld hl,#_y+0
	ld c,(hl)
	ld hl,#_v+0
	ld (hl),c
	ld hl,#_u+0
	ld b,(hl)
	ld hl,#_z+0
	ld a,(hl)
	or b
	sla a
	rl d
	xor b
	xor c
	ld hl,#_y+0
	ld (hl),a
	ld hl,#_y+1
	ld c,(hl)
	ld hl,#_v+1
	ld (hl),c
	ld hl,#_u+1
	ld b,(hl)
	ld hl,#_z+1
	ld a,(hl)
	or b
	rr d
	rl a
	rl d
	xor b
	xor c
	ld hl,#_y+1
	ld (hl),a
	ld hl,#_y+2
	ld c,(hl)
	ld hl,#_v+2
	ld (hl),c
	ld hl,#_u+2
	ld b,(hl)
	ld hl,#_z+2
	ld a,(hl)
	or b
	rr d
	rl a
	rl d
	xor b
	xor c
	ld hl,#_y+2
	ld (hl),a
	ld hl,#_y+3
	ld c,(hl)
	ld hl,#_v+3
	ld (hl),c
	ld hl,#_u+3
	ld b,(hl)
	ld hl,#_z+3
	ld a,(hl)
	or b
	rr d
	rl a
	rl d
	xor b
	xor c
	ld hl,#_y+3
	ld (hl),a
;gimli-spboxy.c:94: return;
	ret
_spbox_y_end::
;gimli-spboxz.c:10: void spbox_z(){
;	---------------------------------
; Function spbox_z
; ---------------------------------
_spbox_z_start::
_spbox_z:
;gimli-spboxz.c:95: __endasm;
	ld hl,#_cy
	ld a,#0x00
	ld (hl),a
	ld d, a
	ld e, a
	ld hl,#_u+0
	ld a,(hl)
	ld hl,#_v+0
	ld b,(hl)
	and b
	ld hl,#_cy
	sla a
	rl (hl)
	sla a
	rl d
	sla a
	rl e
	xor b
	ld hl,#_z+0
	xor (hl)
	ld (hl),a
	ld hl,#_u+1
	ld a,(hl)
	ld hl,#_v+1
	ld b,(hl)
	and b
	ld hl,#_cy
	rr (hl)
	rl a
	rl (hl)
	rr d
	rl a
	rl d
	rr e
	rl a
	rl e
	xor b
	ld hl,#_z+1
	xor (hl)
	ld (hl),a
	ld hl,#_u+2
	ld a,(hl)
	ld hl,#_v+2
	ld b,(hl)
	and b
	ld hl,#_cy
	rr (hl)
	rl a
	rl (hl)
	rr d
	rl a
	rl d
	rr e
	rl a
	rl e
	xor b
	ld hl,#_z+2
	xor (hl)
	ld (hl),a
	ld hl,#_u+3
	ld a,(hl)
	ld hl,#_v+3
	ld b,(hl)
	and b
	ld hl,#_cy
	rr (hl)
	rl a
	rl (hl)
	rr d
	rl a
	rl d
	rr e
	rl a
	rl e
	xor b
	ld hl,#_z+3
	xor (hl)
	ld (hl),a
	ret
_spbox_z_end::
;gimli-print.c:2: void state_print(){
;	---------------------------------
; Function state_print
; ---------------------------------
_state_print_start::
_state_print:
;gimli-print.c:8: for( i=0; i<10; i++ ){
	ld	de,#0x0000
00106$:
;gimli-print.c:9: hex[i] = i + 48;
	ld	hl,#_hex
	add	hl,de
	ld	a,e
	add	a, #0x30
	ld	(hl),a
;gimli-print.c:8: for( i=0; i<10; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x0A
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00106$
;gimli-print.c:11: for( i=0; i <6; i++ ){
	ld	de,#0x0000
00108$:
;gimli-print.c:12: hex[i+10] = i + 65;
	ld	c,e
	ld	a,c
	add	a, #0x0A
	add	a,#<(_hex)
	ld	l,a
	ld	a,#>(_hex)
	adc	a, #0x00
	ld	h,a
	ld	a,c
	add	a, #0x41
	ld	(hl),a
;gimli-print.c:11: for( i=0; i <6; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x06
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00108$
;gimli-print.c:20: __endasm;
	ld hl, #0x409c
	ld a,#0x0
	ld (hl),a
	call 0x01c9
	ld iy,#_state
;gimli-print.c:21: for( i=0; i<12; i++ ){
	ld	de,#0x0000
00110$:
;gimli-print.c:112: __endasm;
	push hl
	ld a, 3 (iy)
	srl a
	srl a
	srl a
	srl a
	ld c,a
	ld b,#0x00
	ld hl,#_hex+0
	add hl,bc
	ld a,(hl)
	call 0x32a
	ld a, 3 (iy)
	and a, #0x0F
	ld c,a
	ld b,#0x00
	ld hl,#_hex+0
	add hl,bc
	ld a,(hl)
	call 0x32a
	ld a, 2 (iy)
	srl a
	srl a
	srl a
	srl a
	ld c,a
	ld b,#0x00
	ld hl,#_hex+0
	add hl,bc
	ld a,(hl)
	call 0x32a
	ld a, 2 (iy)
	and a, #0x0F
	ld c,a
	ld b,#0x00
	ld hl,#_hex+0
	add hl,bc
	ld a,(hl)
	call 0x32a
	ld a, 1 (iy)
	srl a
	srl a
	srl a
	srl a
	ld c,a
	ld b,#0x00
	ld hl,#_hex+0
	add hl,bc
	ld a,(hl)
	call 0x32a
	ld a, 1 (iy)
	and a, #0x0F
	ld c,a
	ld b,#0x00
	ld hl,#_hex+0
	add hl,bc
	ld a,(hl)
	call 0x32a
	ld a, 0 (iy)
	srl a
	srl a
	srl a
	srl a
	ld c,a
	ld b,#0x00
	ld hl,#_hex+0
	add hl,bc
	ld a,(hl)
	call 0x32a
	ld a, 0 (iy)
	and a, #0x0F
	ld c,a
	ld b,#0x00
	ld hl,#_hex+0
	add hl,bc
	ld a,(hl)
	call 0x32a
	ld a,#0x20
	call 0x32a
	call 0x32a
	inc iy
	inc iy
	inc iy
	inc iy
	pop hl
;gimli-print.c:113: if( 3 == (i%4) ){
	push	de
	ld	hl,#0x0004
	push	hl
	push	de
	call	__modsint_rrx_s
	pop	af
	pop	af
	pop	de
	ld	a,l
	sub	a,#0x03
	jr	NZ,00111$
	or	a,h
	jr	NZ,00111$
;gimli-print.c:117: __endasm;
	ld a,#0x0d
	call 0x32a
00111$:
;gimli-print.c:21: for( i=0; i<12; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x0C
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00110$
;gimli-print.c:120: return;
	ret
_state_print_end::
	.area _CODE
	.area _INITIALIZER
__xinit__cy:
	.db #0x00	;  0
__xinit__hex:
	.db #0x30	;  48	'0'
	.db #0x31	;  49	'1'
	.db #0x32	;  50	'2'
	.db #0x33	;  51	'3'
	.db #0x34	;  52	'4'
	.db #0x35	;  53	'5'
	.db #0x36	;  54	'6'
	.db #0x37	;  55	'7'
	.db #0x38	;  56	'8'
	.db #0x39	;  57	'9'
	.db #0x41	;  65	'A'
	.db #0x42	;  66	'B'
	.db #0x43	;  67	'C'
	.db #0x44	;  68	'D'
	.db #0x45	;  69	'E'
	.db #0x46	;  70	'F'
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
