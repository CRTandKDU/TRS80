;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Mon Nov 11 11:59:15 2013
;--------------------------------------------------------
	.module kectrs8
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rot
	.globl _main
	.globl _buf
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
	.globl _print_title
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_A::
	.ds 25
_C::
	.ds 5
_D::
	.ds 5
_B::
	.ds 25
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
;kectrs8.c:40: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;kectrs8.c:43: for( i=0; i<K_LANES; i++ ) A[i] = 0;
	ld	de,#0x0000
00109$:
	ld	hl,#_A
	add	hl,de
	ld	(hl),#0x00
	inc	de
	ld	a,e
	sub	a, #0x19
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00109$
;kectrs8.c:44: A[0]=128; A[1]=2; A[2]=3; A[3]=64; A[4]=255;
	ld	hl,#_A
	ld	(hl),#0x80
	inc	hl
	ld	(hl),#0x02
	ld	hl,#_A + 2
	ld	(hl),#0x03
	ld	hl,#_A + 3
	ld	(hl),#0x40
	ld	hl,#_A + 4
	ld	(hl),#0xFF
;kectrs8.c:47: for( i=0; i<K_LANES; i++ ){
	ld	de,#0x0000
00111$:
;kectrs8.c:48: if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
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
;kectrs8.c:49: print_char( A[i] );
	ld	hl,#_A
	add	hl,de
	ld	h,(hl)
	push	de
	push	hl
	inc	sp
	call	_print_char
	inc	sp
	pop	de
;kectrs8.c:47: for( i=0; i<K_LANES; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x19
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00111$
;kectrs8.c:51: print_crlf();
	call	_print_crlf
;kectrs8.c:60: KRounds();
	call	_KRounds
;kectrs8.c:74: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
	ld hl,#0x6cc ; BASIC command line
	jp (hl)
	ret
_main_end::
;kectrs8.c:84: unsigned char rot( unsigned char x, unsigned char n ){
;	---------------------------------
; Function rot
; ---------------------------------
_rot_start::
_rot:
;kectrs8.c:107: __endasm;
	ld d,#0x00
	00001$:
	ld hl,#3
	add hl,sp
	ld a,d
	sub a, (hl)
	jr NC,00002$
	push de
	ld iy,#4
	add iy,sp
	push iy
	pop de
	ld a,(de)
	rlca
	ld (de),a
	pop de
	inc d
	jr 00001$
	00002$:
	nop
;kectrs8.c:108: return x;
	ld	iy,#2
	add	iy,sp
	ld	l,0 (iy)
	ret
_rot_end::
;kectrs8.c:112: void KThetaStep(){
;	---------------------------------
; Function KThetaStep
; ---------------------------------
_KThetaStep_start::
_KThetaStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;kectrs8.c:114: for( i=0; i<5; i++ ){
	ld	de,#0x0000
00104$:
;kectrs8.c:115: C[i]=A[i]^A[i+5]^A[i+10]^A[i+15]^A[i+20];
	ld	hl,#_C
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	hl,#_A
	add	hl,de
	ld	a,(hl)
	ld	-3 (ix),a
	ld	b,e
	ld	a,b
	add	a, #0x05
	add	a,#<(_A)
	ld	l,a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	xor	a, -3 (ix)
	ld	c,a
	ld	a,b
	add	a, #0x0A
	add	a,#<(_A)
	ld	l,a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	xor	a, c
	ld	c,a
	ld	a,b
	add	a, #0x0F
	add	a,#<(_A)
	ld	l,a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	xor	a, c
	ld	c,a
	ld	a,b
	add	a, #0x14
	add	a,#<(_A)
	ld	l,a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	h,a
	ld	a,(hl)
	xor	a, c
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
;kectrs8.c:114: for( i=0; i<5; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x05
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00104$
;kectrs8.c:163: __endasm;
	ld hl,#(_C+0x01)
	ld a,(hl)
	rlca
	ld hl,#(_C+0x04)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x00)
	ld (hl),a
	ld hl,#(_C+0x02)
	ld a,(hl)
	rlca
	ld hl,#(_C+0x00)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x01)
	ld (hl),a
	ld hl,#(_C+0x03)
	ld a,(hl)
	rlca
	ld hl,#(_C+0x01)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x02)
	ld (hl),a
	ld hl,#(_C+0x04)
	ld a,(hl)
	rlca
	ld hl,#(_C+0x02)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x03)
	ld (hl),a
	ld hl,#(_C+0x00)
	ld a,(hl)
	rlca
	ld hl,#(_C+0x03)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x04)
	ld (hl),a
;kectrs8.c:164: for( i=0; i<5; i++ )
	ld	de,#0x0000
;kectrs8.c:165: for( j=0; j<5; j++ ){
00114$:
	ld	hl,#_D
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	bc,#0x0000
00106$:
;kectrs8.c:166: A[i+j*5] = A[i+j*5]^D[i];
	ld	-3 (ix),e
	ld	a,c
	push	de
	ld	e,a
	add	a, a
	add	a, a
	add	a, e
	pop	de
	ld	h,a
	ld	a,-3 (ix)
	add	a, h
	ld	h,a
	ld	iy,#_A
	push	bc
	ld	c,h
	ld	b,#0x00
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	h,(hl)
	xor	a, h
	ld	0 (iy), a
;kectrs8.c:165: for( j=0; j<5; j++ ){
	inc	bc
	ld	a,c
	sub	a, #0x05
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00106$
;kectrs8.c:164: for( i=0; i<5; i++ )
	inc	de
	ld	a,e
	sub	a, #0x05
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00114$
	ld	sp,ix
	pop	ix
	ret
_KThetaStep_end::
;kectrs8.c:171: void KRhoPiStep(){
;	---------------------------------
; Function KRhoPiStep
; ---------------------------------
_KRhoPiStep_start::
_KRhoPiStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-59
	add	hl,sp
	ld	sp,hl
;kectrs8.c:174: unsigned char pB[K_LANES] = {
	ld	hl,#0x0019
	add	hl,sp
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),#0x00
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	(hl),#0x0A
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	ld	(hl),#0x14
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x05
	ld	a,-2 (ix)
	add	a, #0x04
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0F
	ld	a,-2 (ix)
	add	a, #0x05
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x10
	ld	a,-2 (ix)
	add	a, #0x06
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x01
	ld	a,-2 (ix)
	add	a, #0x07
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0B
	ld	a,-2 (ix)
	add	a, #0x08
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x15
	ld	a,-2 (ix)
	add	a, #0x09
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x06
	ld	a,-2 (ix)
	add	a, #0x0A
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x07
	ld	a,-2 (ix)
	add	a, #0x0B
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x11
	ld	a,-2 (ix)
	add	a, #0x0C
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x02
	ld	a,-2 (ix)
	add	a, #0x0D
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0C
	ld	a,-2 (ix)
	add	a, #0x0E
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x16
	ld	a,-2 (ix)
	add	a, #0x0F
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x17
	ld	a,-2 (ix)
	add	a, #0x10
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x08
	ld	a,-2 (ix)
	add	a, #0x11
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x12
	ld	a,-2 (ix)
	add	a, #0x12
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x03
	ld	a,-2 (ix)
	add	a, #0x13
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0D
	ld	a,-2 (ix)
	add	a, #0x14
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0E
	ld	a,-2 (ix)
	add	a, #0x15
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x18
	ld	a,-2 (ix)
	add	a, #0x16
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x09
	ld	a,-2 (ix)
	add	a, #0x17
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x13
	ld	a,-2 (ix)
	add	a, #0x18
	ld	l,a
	ld	a,-1 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x04
;kectrs8.c:177: unsigned char r[K_LANES]  = {
	ld	hl,#0x0000
	add	hl,sp
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl),#0x00
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	ld	(hl),#0x01
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	inc	hl
	ld	(hl),#0x06
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x04
	ld	a,-4 (ix)
	add	a, #0x04
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x03
	ld	a,-4 (ix)
	add	a, #0x05
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x04
	ld	a,-4 (ix)
	add	a, #0x06
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x04
	ld	a,-4 (ix)
	add	a, #0x07
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x06
	ld	a,-4 (ix)
	add	a, #0x08
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x07
	ld	a,-4 (ix)
	add	a, #0x09
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x04
	ld	a,-4 (ix)
	add	a, #0x0A
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x03
	ld	a,-4 (ix)
	add	a, #0x0B
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x02
	ld	a,-4 (ix)
	add	a, #0x0C
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x03
	ld	a,-4 (ix)
	add	a, #0x0D
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x01
	ld	a,-4 (ix)
	add	a, #0x0E
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x07
	ld	a,-4 (ix)
	add	a, #0x0F
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x01
	ld	a,-4 (ix)
	add	a, #0x10
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x05
	ld	a,-4 (ix)
	add	a, #0x11
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x07
	ld	a,-4 (ix)
	add	a, #0x12
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x05
	ld	a,-4 (ix)
	add	a, #0x13
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-4 (ix)
	add	a, #0x14
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x02
	ld	a,-4 (ix)
	add	a, #0x15
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x02
	ld	a,-4 (ix)
	add	a, #0x16
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x05
	ld	a,-4 (ix)
	add	a, #0x17
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x00
	ld	a,-4 (ix)
	add	a, #0x18
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x06
;kectrs8.c:190: for( i=0; i<K_LANES; i++ ){
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x00
00105$:
;kectrs8.c:191: if( 0==r[i] ){
	ld	a,-4 (ix)
	add	a, -9 (ix)
	ld	l,a
	ld	a,-3 (ix)
	adc	a, -8 (ix)
	ld	h,a
	ld	c,(hl)
;kectrs8.c:192: B[pB[i]] = A[i];
	ld	a,-2 (ix)
	add	a, -9 (ix)
	ld	l,a
	ld	a,-1 (ix)
	adc	a, -8 (ix)
	ld	h,a
	ld	iy,#_A
	ld	e,-9 (ix)
	ld	d,-8 (ix)
	add	iy, de
	ld	e,(hl)
	ld	a, 0 (iy)
	ld	-5 (ix),a
	ld	a,#<(_B)
	add	a, e
	ld	-7 (ix),a
	ld	a,#>(_B)
	adc	a, #0x00
	ld	-6 (ix),a
;kectrs8.c:191: if( 0==r[i] ){
	ld	a,c
	or	a, a
	jr	NZ,00102$
;kectrs8.c:192: B[pB[i]] = A[i];
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a,-5 (ix)
	ld	(hl),a
	jr	00106$
00102$:
;kectrs8.c:195: B[pB[i]] = rot( A[i], r[i] );
	ld	a,c
	push	af
	inc	sp
	ld	a,-5 (ix)
	push	af
	inc	sp
	call	_rot
	pop	af
	ld	a,l
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	(hl),a
00106$:
;kectrs8.c:190: for( i=0; i<K_LANES; i++ ){
	inc	-9 (ix)
	jr	NZ,00116$
	inc	-8 (ix)
00116$:
	ld	a,-9 (ix)
	sub	a, #0x19
	ld	a,-8 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00105$
	ld	sp,ix
	pop	ix
	ret
_KRhoPiStep_end::
;kectrs8.c:200: void KKhiStep(){
;	---------------------------------
; Function KKhiStep
; ---------------------------------
_KKhiStep_start::
_KKhiStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-13
	add	hl,sp
	ld	sp,hl
;kectrs8.c:202: for( j=0; j<5; j++ ){
	ld	hl,#0x0000
	ex	(sp), hl
00102$:
;kectrs8.c:203: A[0+5*j] = B[0+5*j]^(B[2+5*j]&(255-B[1+5*j]));
	ld	a,-13 (ix)
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
	ld	-1 (ix),a
	add	a,#<(_A)
	ld	e,a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	d,a
	ld	a,#<(_B)
	add	a, -1 (ix)
	ld	c,a
	ld	a,#>(_B)
	adc	a, #0x00
	ld	b,a
	ld	a,(bc)
	ld	-2 (ix),a
	ld	a,-1 (ix)
	add	a, #0x02
	ld	-3 (ix),a
	add	a,#<(_B)
	ld	-5 (ix),a
	ld	a,#>(_B)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-6 (ix),a
	ld	a,-1 (ix)
	inc	a
	ld	-7 (ix),a
	add	a,#<(_B)
	ld	-9 (ix),a
	ld	a,#>(_B)
	adc	a, #0x00
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	l,(hl)
	ld	a,#0xFF
	sub	a, l
	and	a, -6 (ix)
	xor	a, -2 (ix)
	ld	(de),a
;kectrs8.c:204: A[1+5*j] = B[1+5*j]^(B[3+5*j]&(255-B[2+5*j]));
	ld	a,#<(_A)
	add	a, -7 (ix)
	ld	e,a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	d,a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	ld	a,-1 (ix)
	add	a, #0x03
	ld	-6 (ix),a
	ld	iy,#_B
	push	bc
	ld	c,-6 (ix)
	ld	b,#0x00
	add	iy, bc
	pop	bc
	ld	a, 0 (iy)
	ld	-2 (ix),a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	l,(hl)
	ld	a,#0xFF
	sub	a, l
	and	a, -2 (ix)
	xor	a, -7 (ix)
	ld	(de),a
;kectrs8.c:205: A[2+5*j] = B[2+5*j]^(B[4+5*j]&(255-B[3+5*j]));
	ld	a,#<(_A)
	add	a, -3 (ix)
	ld	e,a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	d,a
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	ld	a,-1 (ix)
	add	a, #0x04
	ld	-5 (ix),a
	add	a,#<(_B)
	ld	-11 (ix),a
	ld	a,#>(_B)
	adc	a, #0x00
	ld	-10 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-3 (ix),a
	ld	l, 0 (iy)
	ld	a,#0xFF
	sub	a, l
	and	a, -3 (ix)
	xor	a, -7 (ix)
	ld	(de),a
;kectrs8.c:206: A[3+5*j] = B[3+5*j]^(B[0+5*j]&(255-B[4+5*j]));
	ld	a,#<(_A)
	add	a, -6 (ix)
	ld	e,a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	d,a
	ld	a, 0 (iy)
	ld	-7 (ix),a
	ld	a,(bc)
	ld	-6 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	h,(hl)
	ld	a,#0xFF
	sub	a, h
	and	a, -6 (ix)
	xor	a, -7 (ix)
	ld	(de),a
;kectrs8.c:207: A[4+5*j] = B[4+5*j]^(B[1+5*j]&(255-B[0+5*j]));
	ld	a,#<(_A)
	add	a, -5 (ix)
	ld	-5 (ix),a
	ld	a,#>(_A)
	adc	a, #0x00
	ld	-4 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	d,(hl)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	e,(hl)
	ld	a,(bc)
	ld	l,a
	ld	a,#0xFF
	sub	a, l
	and	a, e
	xor	a, d
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl),a
;kectrs8.c:202: for( j=0; j<5; j++ ){
	inc	-13 (ix)
	jr	NZ,00110$
	inc	-12 (ix)
00110$:
	ld	a,-13 (ix)
	sub	a, #0x05
	ld	a,-12 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00102$
	ld	sp,ix
	pop	ix
	ret
_KKhiStep_end::
;kectrs8.c:212: void KRounds(){
;	---------------------------------
; Function KRounds
; ---------------------------------
_KRounds_start::
_KRounds:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-26
	add	hl,sp
	ld	sp,hl
;kectrs8.c:215: unsigned char RC[24] = { 0x0000000000000001&0xFF,
	ld	hl,#0x0000
	add	hl,sp
	ex	de,hl
	ld	a,#0x01
	ld	(de),a
	ld	l, e
	ld	h, d
	inc	hl
	ld	(hl),#0x82
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl),#0x8A
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#0x8B
	ld	hl,#0x0005
	add	hl,de
	ld	(hl),#0x01
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x81
	ld	hl,#0x0007
	add	hl,de
	ld	(hl),#0x09
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x8A
	ld	hl,#0x0009
	add	hl,de
	ld	(hl),#0x88
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x09
	ld	hl,#0x000B
	add	hl,de
	ld	(hl),#0x0A
	ld	hl,#0x000C
	add	hl,de
	ld	(hl),#0x8B
	ld	hl,#0x000D
	add	hl,de
	ld	(hl),#0x8B
	ld	hl,#0x000E
	add	hl,de
	ld	(hl),#0x89
	ld	hl,#0x000F
	add	hl,de
	ld	(hl),#0x03
	ld	hl,#0x0010
	add	hl,de
	ld	(hl),#0x02
	ld	hl,#0x0011
	add	hl,de
	ld	(hl),#0x80
	ld	hl,#0x0012
	add	hl,de
	ld	(hl),#0x0A
	ld	hl,#0x0013
	add	hl,de
	ld	(hl),#0x0A
	ld	hl,#0x0014
	add	hl,de
	ld	(hl),#0x81
	ld	hl,#0x0015
	add	hl,de
	ld	(hl),#0x80
	ld	hl,#0x0016
	add	hl,de
	ld	(hl),#0x01
	ld	hl,#0x0017
	add	hl,de
	ld	(hl),#0x08
;kectrs8.c:239: for( j=0; j< K_ROUNDS; j++ ){
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
00111$:
;kectrs8.c:240: KThetaStep();
	push	de
	call	_KThetaStep
	call	_KRhoPiStep
	call	_KKhiStep
	pop	de
;kectrs8.c:256: A[0] ^= RC[j];
	ld	hl, #_A + 0
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	add	hl,de
	ld	a,(hl)
	xor	a, b
	ld	(#_A),a
;kectrs8.c:260: print_title(); print_char(j+1);
	push	de
	call	_print_title
	pop	de
	ld	h,-2 (ix)
	inc	h
	push	de
	push	hl
	inc	sp
	call	_print_char
	inc	sp
	pop	de
;kectrs8.c:262: for( i=0; i<K_LANES; i++ ){
	ld	bc,#0x0000
00109$:
;kectrs8.c:263: if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
	ld	a,b
	or	a,c
	jr	Z,00101$
	ld	a,c
	sub	a,#0x05
	jr	NZ,00138$
	or	a,b
	jr	Z,00101$
00138$:
	ld	a,c
	sub	a,#0x0A
	jr	NZ,00139$
	or	a,b
	jr	Z,00101$
00139$:
	ld	a,c
	sub	a,#0x0F
	jr	NZ,00140$
	or	a,b
	jr	Z,00101$
00140$:
	ld	a,c
	sub	a,#0x14
	jr	NZ,00102$
	or	a,b
	jr	NZ,00102$
00101$:
	push	bc
	push	de
	call	_print_crlf
	pop	de
	pop	bc
00102$:
;kectrs8.c:264: print_char( A[i] );
	ld	hl,#_A
	add	hl,bc
	ld	h,(hl)
	push	bc
	push	de
	push	hl
	inc	sp
	call	_print_char
	inc	sp
	pop	de
	pop	bc
;kectrs8.c:262: for( i=0; i<K_LANES; i++ ){
	inc	bc
	ld	a,c
	sub	a, #0x19
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00109$
;kectrs8.c:266: print_crlf();
	push	de
	call	_print_crlf
	pop	de
;kectrs8.c:239: for( j=0; j< K_ROUNDS; j++ ){
	inc	-2 (ix)
	jr	NZ,00143$
	inc	-1 (ix)
00143$:
	ld	a,-2 (ix)
	sub	a, #0x12
	ld	a,-1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00111$
	ld	sp,ix
	pop	ix
	ret
_KRounds_end::
;kectrs8.c:283: void print_crlf(){
;	---------------------------------
; Function print_crlf
; ---------------------------------
_print_crlf_start::
_print_crlf:
;kectrs8.c:287: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
;kectrs8.c:288: return;
	ret
_print_crlf_end::
;kectrs8.c:292: void print_char(unsigned char c ){
;	---------------------------------
; Function print_char
; ---------------------------------
_print_char_start::
_print_char:
;kectrs8.c:293: if( c<10 ){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x0A
	jr	NC,00102$
;kectrs8.c:297: __endasm;
	ld a,#0x20
	call 0x33
00102$:
;kectrs8.c:299: if( c<100 ){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x64
	jr	NC,00104$
;kectrs8.c:303: __endasm;
	ld a,#0x20
	call 0x33
00104$:
;kectrs8.c:318: __endasm;
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
;kectrs8.c:319: return;
	ret
_print_char_end::
;kectrs8.c:323: void print_title(){
;	---------------------------------
; Function print_title
; ---------------------------------
_print_title_start::
_print_title:
	ld	iy,#-7
	add	iy,sp
	ld	sp,iy
;kectrs8.c:324: char title[]="Round ";
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
;kectrs8.c:330: __endasm;
	ex de,hl
	ld a,#0
	ld (#0x409c),a
	call #0x28a7
;kectrs8.c:331: return;
	pop	af
	pop	af
	pop	af
	inc	sp
	ret
_print_title_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
