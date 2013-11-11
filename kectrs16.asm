;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Sat Nov 09 12:47:55 2013
;--------------------------------------------------------
	.module kectrs16
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rot16
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
	.globl _KRotTest
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
	.ds 100
_C::
	.ds 10
_D::
	.ds 10
_B::
	.ds 100
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
;kectrs16.c:41: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
;kectrs16.c:44: for( i=0; i<K_LANES; i++ ) A[i] = 0;
	ld	de,#0x0000
00109$:
	ld	l, e
	ld	h, d
	add	hl, hl
	ld	bc,#_A
	add	hl,bc
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
;kectrs16.c:45: A[0]=128; A[1]=2; A[2]=3; A[3]=64; A[4]=255;
	ld	hl,#0x0080
	ld	(_A), hl
	ld	l, #0x02
	ld	((_A + 0x0002)), hl
	ld	l, #0x03
	ld	((_A + 0x0004)), hl
	ld	l, #0x40
	ld	((_A + 0x0006)), hl
	ld	l, #0xFF
	ld	((_A + 0x0008)), hl
;kectrs16.c:48: for( i=0; i<K_LANES; i++ ){
	ld	de,#0x0000
00111$:
;kectrs16.c:49: if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
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
;kectrs16.c:50: print_short( A[i] );
	ld	l, e
	ld	h, d
	add	hl, hl
	ld	bc,#_A
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	de
	push	bc
	call	_print_short
	pop	af
	pop	de
;kectrs16.c:48: for( i=0; i<K_LANES; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x19
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00111$
;kectrs16.c:52: print_crlf();
	call	_print_crlf
;kectrs16.c:62: KRounds();
	call	_KRounds
;kectrs16.c:76: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
	ld hl,#0x6cc ; BASIC command line
	jp (hl)
	ret
_main_end::
;kectrs16.c:86: unsigned char rot( unsigned char x, unsigned char n ){
;	---------------------------------
; Function rot
; ---------------------------------
_rot_start::
_rot:
;kectrs16.c:109: __endasm;
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
;kectrs16.c:110: return x;
	ld	iy,#2
	add	iy,sp
	ld	l,0 (iy)
	ret
_rot_end::
;kectrs16.c:115: unsigned short rot16( unsigned short x, unsigned char n ){
;	---------------------------------
; Function rot16
; ---------------------------------
_rot16_start::
_rot16:
;kectrs16.c:138: __endasm;
	push ix
	ld ix,#0x0
	add ix,sp
	ld d,#0x00
	00001$:
	ld a,d
	sub a, 6(ix)
	jr NC,00002$
	ld a,5(ix)
	rlca
	ld a,4(ix)
	rla
	ld 4(ix),a
	ld a,5(ix)
	rla
	ld 5(ix),a
	inc d
	jr 00001$
	00002$:
	pop ix
;kectrs16.c:139: return x;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret
_rot16_end::
;kectrs16.c:142: void KThetaStep(){
;	---------------------------------
; Function KThetaStep
; ---------------------------------
_KThetaStep_start::
_KThetaStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-5
	add	hl,sp
	ld	sp,hl
;kectrs16.c:144: for( i=0; i<5; i++ ){
	ld	de,#0x0000
00104$:
;kectrs16.c:145: C[i]=A[i]^A[i+5]^A[i+10]^A[i+15]^A[i+20];
	ld	l, e
	ld	h, d
	add	hl, hl
	ld	a,#<(_C)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_C)
	adc	a, h
	ld	-1 (ix),a
	ld	bc,#_A
	add	hl,bc
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	-3 (ix), e
	ld	a, e
	add	a, #0x05
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ex	(sp), hl
	ld	a,#<(_A)
	add	a, -5 (ix)
	ld	l,a
	ld	a,#>(_A)
	adc	a, -4 (ix)
	ld	h,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,c
	xor	a, l
	ld	c,a
	ld	a,b
	xor	a, h
	ld	b,a
	ld	a,-3 (ix)
	add	a, #0x0A
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	l,a
	ld	a,#>(_A)
	adc	a, h
	ld	h,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,c
	xor	a, l
	ld	c,a
	ld	a,b
	xor	a, h
	ld	b,a
	ld	a,-3 (ix)
	add	a, #0x0F
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	l,a
	ld	a,#>(_A)
	adc	a, h
	ld	h,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,c
	xor	a, l
	ld	c,a
	ld	a,b
	xor	a, h
	ld	b,a
	ld	a,-3 (ix)
	add	a, #0x14
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	l,a
	ld	a,#>(_A)
	adc	a, h
	ld	h,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,c
	xor	a, l
	ld	c,a
	ld	a,b
	xor	a, h
	ld	b,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;kectrs16.c:144: for( i=0; i<5; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x05
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00104$
;kectrs16.c:263: __endasm;
;; D[0]
	ld hl,#(_C+0x03)
	ld a,(hl)
	rlca
	dec hl
	ld a,(hl)
	rla
	push af
	ld hl,#(_C+0x08)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x00)
	ld (hl),a
	pop af
	ld hl,#(_C+0x03)
	ld a,(hl)
	rla
	ld hl,#(_C+0x09)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x01)
	ld (hl),a
;; D[1]
	ld hl,#(_C+0x05)
	ld a,(hl)
	rlca
	dec hl
	ld a,(hl)
	rla
	push af
	ld hl,#(_C+0x00)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x02)
	ld (hl),a
	pop af
	ld hl,#(_C+0x05)
	ld a,(hl)
	rla
	ld hl,#(_C+0x01)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x03)
	ld (hl),a
;; D[2]
	ld hl,#(_C+0x07)
	ld a,(hl)
	rlca
	dec hl
	ld a,(hl)
	rla
	push af
	ld hl,#(_C+0x02)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x04)
	ld (hl),a
	pop af
	ld hl,#(_C+0x07)
	ld a,(hl)
	rla
	ld hl,#(_C+0x03)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x05)
	ld (hl),a
;; D[3]
	ld hl,#(_C+0x09)
	ld a,(hl)
	rlca
	dec hl
	ld a,(hl)
	rla
	push af
	ld hl,#(_C+0x04)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x06)
	ld (hl),a
	pop af
	ld hl,#(_C+0x09)
	ld a,(hl)
	rla
	ld hl,#(_C+0x05)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x07)
	ld (hl),a
;; D[4]
	ld hl,#(_C+0x01)
	ld a,(hl)
	rlca
	dec hl
	ld a,(hl)
	rla
	push af
	ld hl,#(_C+0x06)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x08)
	ld (hl),a
	pop af
	ld hl,#(_C+0x01)
	ld a,(hl)
	rla
	ld hl,#(_C+0x07)
	ld b,(hl)
	xor a,b
	ld hl,#(_D+0x09)
	ld (hl),a
;kectrs16.c:264: for( i=0; i<5; i++ )
	ld	de,#0x0000
;kectrs16.c:265: for( j=0; j<5; j++ ){
00114$:
	ld	l, e
	ld	h, d
	add	hl, hl
	ld	a,#<(_D)
	add	a, l
	ld	-5 (ix),a
	ld	a,#>(_D)
	adc	a, h
	ld	-4 (ix),a
	ld	bc,#0x0000
00106$:
;kectrs16.c:266: A[i+j*5] = A[i+j*5]^D[i];
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
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ld	iy,#_A
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a,0 (iy)
	ld	-2 (ix),a
	ld	a,1 (iy)
	ld	-1 (ix),a
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	l,(hl)
	xor	a, -2 (ix)
	ld	h,a
	ld	a,l
	xor	a, -1 (ix)
	ld	0 (iy), h
	ld	1 (iy), a
;kectrs16.c:265: for( j=0; j<5; j++ ){
	inc	bc
	ld	a,c
	sub	a, #0x05
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00106$
;kectrs16.c:264: for( i=0; i<5; i++ )
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
;kectrs16.c:271: void KRhoPiStep(){
;	---------------------------------
; Function KRhoPiStep
; ---------------------------------
_KRhoPiStep_start::
_KRhoPiStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-64
	add	hl,sp
	ld	sp,hl
;kectrs16.c:275: unsigned char pB[K_LANES] = {
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
;kectrs16.c:278: unsigned char r[K_LANES]  = {
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
	ld	(hl),#0x0E
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x0C
	ld	a,-4 (ix)
	add	a, #0x04
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0B
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
	ld	(hl),#0x0C
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
	ld	(hl),#0x0A
	ld	a,-4 (ix)
	add	a, #0x0C
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0B
	ld	a,-4 (ix)
	add	a, #0x0D
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x09
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
	ld	(hl),#0x09
	ld	a,-4 (ix)
	add	a, #0x10
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0D
	ld	a,-4 (ix)
	add	a, #0x11
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0F
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
	ld	(hl),#0x08
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
	ld	(hl),#0x0D
	ld	a,-4 (ix)
	add	a, #0x17
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x08
	ld	a,-4 (ix)
	add	a, #0x18
	ld	l,a
	ld	a,-3 (ix)
	adc	a, #0x00
	ld	h,a
	ld	(hl),#0x0E
;kectrs16.c:286: for( i=0; i<K_LANES; i++ ){
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
00110$:
;kectrs16.c:287: if( 0==r[i] ){
	ld	a,-4 (ix)
	add	a, -13 (ix)
	ld	l,a
	ld	a,-3 (ix)
	adc	a, -12 (ix)
	ld	h,a
	ld	a,(hl)
	ld	-5 (ix),a
;kectrs16.c:288: B[pB[i]] = A[i];
	ld	a,-2 (ix)
	add	a, -13 (ix)
	ld	-7 (ix),a
	ld	a,-1 (ix)
	adc	a, -12 (ix)
	ld	-6 (ix),a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	-9 (ix),a
	ld	a,#>(_A)
	adc	a, h
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-11 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-10 (ix),a
;kectrs16.c:287: if( 0==r[i] ){
	ld	a,-5 (ix)
	or	a, a
	jr	NZ,00107$
;kectrs16.c:288: B[pB[i]] = A[i];
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	l,(hl)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_B
	add	hl,de
	ld	a,-11 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-10 (ix)
	ld	(hl),a
	jr	00111$
00107$:
;kectrs16.c:291: rr = r[i];
	ld	a,-5 (ix)
	ld	-14 (ix), a
	ld	c, a
;kectrs16.c:292: if( r[i]>7 ){
	ld	a,#0x07
	sub	a, -5 (ix)
	jr	NC,00102$
;kectrs16.c:293: rr -= 8;
	ld	a,c
	add	a,#0xF8
	ld	c,a
;kectrs16.c:294: A[i] = (A[i]>>8) + ((A[i]&0xff)<<8);
	ld	l,-10 (ix)
	ld	h,#0x00
	ld	d,-11 (ix)
	ld	e,#0x00
	add	hl,de
	ex	de,hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl),e
	inc	hl
	ld	(hl),d
00102$:
;kectrs16.c:288: B[pB[i]] = A[i];
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	d,(hl)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-11 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-10 (ix),a
;kectrs16.c:297: B[pB[i]] = A[i];
	ld	l,d
	ld	h,#0x00
	add	hl, hl
	ld	de,#_B
	add	hl,de
;kectrs16.c:296: if( 0==rr ){
	ld	a,c
	or	a, a
	jr	NZ,00104$
;kectrs16.c:297: B[pB[i]] = A[i];
	ld	a,-11 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-10 (ix)
	ld	(hl),a
	jr	00111$
00104$:
;kectrs16.c:300: B[pB[i]] = rot16( A[i], rr );
	push	hl
	ld	a,c
	push	af
	inc	sp
	ld	c,-11 (ix)
	ld	b,-10 (ix)
	push	bc
	call	_rot16
	pop	af
	inc	sp
	ld	d,l
	ld	e,h
	pop	hl
	ld	(hl),d
	inc	hl
	ld	(hl),e
00111$:
;kectrs16.c:286: for( i=0; i<K_LANES; i++ ){
	inc	-13 (ix)
	jr	NZ,00127$
	inc	-12 (ix)
00127$:
	ld	a,-13 (ix)
	sub	a, #0x19
	ld	a,-12 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00110$
	ld	sp,ix
	pop	ix
	ret
_KRhoPiStep_end::
;kectrs16.c:306: void KKhiStep(){
;	---------------------------------
; Function KKhiStep
; ---------------------------------
_KKhiStep_start::
_KKhiStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-35
	add	hl,sp
	ld	sp,hl
;kectrs16.c:308: for( j=0; j<5; j++ ){
	ld	de,#0x0000
00102$:
;kectrs16.c:309: A[0+5*j] = B[0+5*j]^(B[2+5*j]&(65535-B[1+5*j]));
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
	ld	a,#<(_A)
	add	a, l
	ld	c,a
	ld	a,#>(_A)
	adc	a, h
	ld	b,a
	ld	a,#<(_B)
	add	a, l
	ld	-3 (ix),a
	ld	a,#>(_B)
	adc	a, h
	ld	-2 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	-5 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-4 (ix),a
	ld	a,-1 (ix)
	add	a, #0x02
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ld	-7 (ix),l
	ld	-6 (ix),h
	ld	a,#<(_B)
	add	a, -7 (ix)
	ld	-9 (ix),a
	ld	a,#>(_B)
	adc	a, -6 (ix)
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-11 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-10 (ix),a
	ld	a,-1 (ix)
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	a,#<(_B)
	add	a, -13 (ix)
	ld	-15 (ix),a
	ld	a,#>(_B)
	adc	a, -12 (ix)
	ld	-14 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	-19 (ix), a
	ld	-18 (ix),h
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
	ld	a,#0xFF
	sub	a, -19 (ix)
	ld	-19 (ix),a
	ld	a,#0xFF
	sbc	a, -18 (ix)
	ld	-18 (ix),a
	ld	a,#0x00
	sbc	a, -17 (ix)
	ld	-17 (ix),a
	ld	a,#0x00
	sbc	a, -16 (ix)
	ld	-16 (ix),a
	ld	a,-11 (ix)
	ld	-23 (ix),a
	ld	a,-10 (ix)
	ld	-22 (ix),a
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
	ld	a,-23 (ix)
	and	a, -19 (ix)
	ld	-23 (ix),a
	ld	a,-22 (ix)
	and	a, -18 (ix)
	ld	-22 (ix),a
	ld	a,-21 (ix)
	and	a, -17 (ix)
	ld	-21 (ix),a
	ld	a,-20 (ix)
	and	a, -16 (ix)
	ld	-20 (ix),a
	ld	a,-5 (ix)
	ld	-19 (ix),a
	ld	a,-4 (ix)
	ld	-18 (ix),a
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
	ld	a,-23 (ix)
	xor	a, -19 (ix)
	ld	-23 (ix),a
	ld	a,-22 (ix)
	xor	a, -18 (ix)
	ld	-22 (ix),a
	ld	a,-21 (ix)
	xor	a, -17 (ix)
	ld	-21 (ix),a
	ld	a,-20 (ix)
	xor	a, -16 (ix)
	ld	-20 (ix),a
	ld	a,-23 (ix)
	ld	-23 (ix),a
	ld	a,-22 (ix)
	ld	-22 (ix),a
	ld	a,-23 (ix)
	ld	(bc),a
	inc	bc
	ld	a,-22 (ix)
	ld	(bc),a
;kectrs16.c:310: A[1+5*j] = B[1+5*j]^(B[3+5*j]&(65535-B[2+5*j]));
	ld	a,#<(_A)
	add	a, -13 (ix)
	ld	-23 (ix),a
	ld	a,#>(_A)
	adc	a, -12 (ix)
	ld	-22 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-19 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-18 (ix),a
	ld	a,-1 (ix)
	add	a, #0x03
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ld	-13 (ix),l
	ld	-12 (ix),h
	ld	a,#<(_B)
	add	a, -13 (ix)
	ld	-11 (ix),a
	ld	a,#>(_B)
	adc	a, -12 (ix)
	ld	-10 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	-27 (ix), a
	ld	-26 (ix),h
	ld	-25 (ix),#0x00
	ld	-24 (ix),#0x00
	ld	a,#0xFF
	sub	a, -27 (ix)
	ld	-27 (ix),a
	ld	a,#0xFF
	sbc	a, -26 (ix)
	ld	-26 (ix),a
	ld	a,#0x00
	sbc	a, -25 (ix)
	ld	-25 (ix),a
	ld	a,#0x00
	sbc	a, -24 (ix)
	ld	-24 (ix),a
	ld	hl,#0x0000
	ld	a,-27 (ix)
	and	a, c
	ld	-27 (ix),a
	ld	a,-26 (ix)
	and	a, b
	ld	-26 (ix),a
	ld	a,-25 (ix)
	and	a, l
	ld	-25 (ix),a
	ld	a,-24 (ix)
	and	a, h
	ld	-24 (ix),a
	ld	c,-19 (ix)
	ld	b,-18 (ix)
	ld	hl,#0x0000
	ld	a,c
	xor	a, -27 (ix)
	ld	c,a
	ld	a,b
	xor	a, -26 (ix)
	ld	b,a
	ld	a,l
	xor	a, -25 (ix)
	ld	a,h
	xor	a, -24 (ix)
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;kectrs16.c:311: A[2+5*j] = B[2+5*j]^(B[4+5*j]&(65535-B[3+5*j]));
	ld	a,#<(_A)
	add	a, -7 (ix)
	ld	-27 (ix),a
	ld	a,#>(_A)
	adc	a, -6 (ix)
	ld	-26 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-23 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-22 (ix),a
	ld	a,-1 (ix)
	add	a, #0x04
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	ld	-19 (ix),l
	ld	-18 (ix),h
	ld	a,#<(_B)
	add	a, -19 (ix)
	ld	-9 (ix),a
	ld	a,#>(_B)
	adc	a, -18 (ix)
	ld	-8 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-7 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-6 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,#0x00
	ld	b,#0x00
	ld	a,#0xFF
	sub	a, c
	ld	-31 (ix),a
	ld	a,#0xFF
	sbc	a, h
	ld	-30 (ix),a
	ld	a,#0x00
	sbc	a, l
	ld	-29 (ix),a
	ld	a,#0x00
	sbc	a, b
	ld	-28 (ix),a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	bc,#0x0000
	ld	a,-31 (ix)
	and	a, l
	ld	-31 (ix),a
	ld	a,-30 (ix)
	and	a, h
	ld	-30 (ix),a
	ld	a,-29 (ix)
	and	a, c
	ld	-29 (ix),a
	ld	a,-28 (ix)
	and	a, b
	ld	-28 (ix),a
	ld	c,-23 (ix)
	ld	b,-22 (ix)
	ld	hl,#0x0000
	ld	a,c
	xor	a, -31 (ix)
	ld	c,a
	ld	a,b
	xor	a, -30 (ix)
	ld	b,a
	ld	a,l
	xor	a, -29 (ix)
	ld	a,h
	xor	a, -28 (ix)
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;kectrs16.c:312: A[3+5*j] = B[3+5*j]^(B[0+5*j]&(65535-B[4+5*j]));
	ld	a,#<(_A)
	add	a, -13 (ix)
	ld	-31 (ix),a
	ld	a,#>(_A)
	adc	a, -12 (ix)
	ld	-30 (ix),a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a,(hl)
	ld	-27 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-26 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a,(hl)
	ld	-23 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-22 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,#0x00
	ld	b,#0x00
	ld	a,#0xFF
	sub	a, c
	ld	-35 (ix),a
	ld	a,#0xFF
	sbc	a, h
	ld	-34 (ix),a
	ld	a,#0x00
	sbc	a, l
	ld	-33 (ix),a
	ld	a,#0x00
	sbc	a, b
	ld	-32 (ix),a
	ld	l,-23 (ix)
	ld	h,-22 (ix)
	ld	bc,#0x0000
	ld	a,-35 (ix)
	and	a, l
	ld	-35 (ix),a
	ld	a,-34 (ix)
	and	a, h
	ld	-34 (ix),a
	ld	a,-33 (ix)
	and	a, c
	ld	-33 (ix),a
	ld	a,-32 (ix)
	and	a, b
	ld	-32 (ix),a
	ld	c,-27 (ix)
	ld	b,-26 (ix)
	ld	hl,#0x0000
	ld	a,c
	xor	a, -35 (ix)
	ld	c,a
	ld	a,b
	xor	a, -34 (ix)
	ld	b,a
	ld	a,l
	xor	a, -33 (ix)
	ld	a,h
	xor	a, -32 (ix)
	ld	l,-31 (ix)
	ld	h,-30 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
;kectrs16.c:313: A[4+5*j] = B[4+5*j]^(B[1+5*j]&(65535-B[0+5*j]));
	ld	a,#<(_A)
	add	a, -19 (ix)
	ld	-35 (ix),a
	ld	a,#>(_A)
	adc	a, -18 (ix)
	ld	-34 (ix),a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a,(hl)
	ld	-31 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-30 (ix),a
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	a,(hl)
	ld	-27 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-26 (ix),a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,#0x00
	ld	b,#0x00
	ld	a,#0xFF
	sub	a, c
	ld	-23 (ix),a
	ld	a,#0xFF
	sbc	a, h
	ld	-22 (ix),a
	ld	a,#0x00
	sbc	a, l
	ld	-21 (ix),a
	ld	a,#0x00
	sbc	a, b
	ld	-20 (ix),a
	ld	l,-27 (ix)
	ld	h,-26 (ix)
	ld	bc,#0x0000
	ld	a,l
	and	a, -23 (ix)
	ld	-27 (ix),a
	ld	a,h
	and	a, -22 (ix)
	ld	-26 (ix),a
	ld	a,c
	and	a, -21 (ix)
	ld	-25 (ix),a
	ld	a,b
	and	a, -20 (ix)
	ld	-24 (ix),a
	ld	c,-31 (ix)
	ld	b,-30 (ix)
	ld	hl,#0x0000
	ld	a,c
	xor	a, -27 (ix)
	ld	c,a
	ld	a,b
	xor	a, -26 (ix)
	ld	b,a
	ld	a,l
	xor	a, -25 (ix)
	ld	a,h
	xor	a, -24 (ix)
	pop	hl
	push	hl
	ld	(hl),c
	inc	hl
	ld	(hl),b
;kectrs16.c:308: for( j=0; j<5; j++ ){
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
;kectrs16.c:317: void KRotTest(){
;	---------------------------------
; Function KRotTest
; ---------------------------------
_KRotTest_start::
_KRotTest:
;kectrs16.c:342: __endasm;
	ld de,#0x0
	00001$:
	ld hl,#_A
	add hl,de
	ld a,(hl)
	rlca
	rlca
	ld (hl),a
; test and end of loop
	inc de
	ld a,e
	sub a, #0x19
	ld a,d
	rla
	ccf
	rra
	sbc a, #0x80
	jr C,00001$
	ret
	ret
_KRotTest_end::
;kectrs16.c:345: void KRounds(){
;	---------------------------------
; Function KRounds
; ---------------------------------
_KRounds_start::
_KRounds:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-59
	add	hl,sp
	ld	sp,hl
;kectrs16.c:348: char title[]="Round ";
	ld	hl,#0x0030
	add	hl,sp
	ld	c,l
	ld	b,h
	ld	(hl),#0x52
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl),#0x6F
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl),#0x75
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl),#0x6E
	ld	hl,#0x0004
	add	hl,bc
	ld	(hl),#0x64
	ld	hl,#0x0005
	add	hl,bc
	ld	(hl),#0x20
	ld	hl,#0x0006
	add	hl,bc
	ld	(hl),#0x00
;kectrs16.c:351: unsigned short RC[24] = { 0x0000000000000001&0xFFFF,
	ld	hl,#0x0000
	add	hl,sp
	ld	e,l
	ld	d,h
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl),#0x82
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x0004
	add	hl,de
	ld	(hl),#0x8A
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x0006
	add	hl,de
	ld	(hl),#0x00
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),#0x8B
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x000A
	add	hl,de
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x000C
	add	hl,de
	ld	(hl),#0x81
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x000E
	add	hl,de
	ld	(hl),#0x09
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x0010
	add	hl,de
	ld	(hl),#0x8A
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0012
	add	hl,de
	ld	(hl),#0x88
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0014
	add	hl,de
	ld	(hl),#0x09
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x0016
	add	hl,de
	ld	(hl),#0x0A
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0018
	add	hl,de
	ld	(hl),#0x8B
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x001A
	add	hl,de
	ld	(hl),#0x8B
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x001C
	add	hl,de
	ld	(hl),#0x89
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x001E
	add	hl,de
	ld	(hl),#0x03
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x0020
	add	hl,de
	ld	(hl),#0x02
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x0022
	add	hl,de
	ld	(hl),#0x80
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0024
	add	hl,de
	ld	(hl),#0x0A
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x0026
	add	hl,de
	ld	(hl),#0x0A
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x0028
	add	hl,de
	ld	(hl),#0x81
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x002A
	add	hl,de
	ld	(hl),#0x80
	inc	hl
	ld	(hl),#0x80
	ld	hl,#0x002C
	add	hl,de
	ld	(hl),#0x01
	inc	hl
	ld	(hl),#0x00
	ld	hl,#0x002E
	add	hl,de
	ld	(hl),#0x08
	inc	hl
	ld	(hl),#0x80
;kectrs16.c:375: for( j=0; j< K_ROUNDS; j++ ){
	ld	-2 (ix),c
	ld	-1 (ix),b
	ld	-4 (ix),#0x00
	ld	-3 (ix),#0x00
00111$:
;kectrs16.c:376: KThetaStep();
	push	de
	call	_KThetaStep
	call	_KRhoPiStep
	call	_KKhiStep
	pop	de
;kectrs16.c:392: A[0] ^= RC[j];
	ld	bc, (#_A + 0)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	add	hl, hl
	add	hl,de
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,c
	xor	a, l
	ld	c,a
	ld	a,b
	xor	a, h
	ld	b,a
	ld	(_A), bc
;kectrs16.c:396: print_str( title ); print_char(j+1);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	de
	push	hl
	call	_print_str
	pop	af
	pop	de
	ld	h,-4 (ix)
	inc	h
	push	de
	push	hl
	inc	sp
	call	_print_char
	inc	sp
	pop	de
;kectrs16.c:398: for( i=0; i<K_LANES; i++ ){
	ld	bc,#0x0000
00109$:
;kectrs16.c:399: if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
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
;kectrs16.c:400: print_short( A[i] );
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	a,l
	add	a, #<(_A)
	ld	l,a
	ld	a,h
	adc	a, #>(_A)
	ld	h,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	bc
	push	de
	push	hl
	call	_print_short
	pop	af
	pop	de
	pop	bc
;kectrs16.c:398: for( i=0; i<K_LANES; i++ ){
	inc	bc
	ld	a,c
	sub	a, #0x19
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00109$
;kectrs16.c:402: print_crlf();
	push	de
	call	_print_crlf
	pop	de
;kectrs16.c:375: for( j=0; j< K_ROUNDS; j++ ){
	inc	-4 (ix)
	jr	NZ,00143$
	inc	-3 (ix)
00143$:
	ld	a,-4 (ix)
	sub	a, #0x14
	ld	a,-3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00111$
	ld	sp,ix
	pop	ix
	ret
_KRounds_end::
;kectrs16.c:419: void print_crlf(){
;	---------------------------------
; Function print_crlf
; ---------------------------------
_print_crlf_start::
_print_crlf:
;kectrs16.c:423: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
;kectrs16.c:424: return;
	ret
_print_crlf_end::
;kectrs16.c:428: void print_char(unsigned char c ){
;	---------------------------------
; Function print_char
; ---------------------------------
_print_char_start::
_print_char:
;kectrs16.c:429: if( c<10 ){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x0A
	jr	NC,00102$
;kectrs16.c:433: __endasm;
	ld a,#0x20
	call 0x33
00102$:
;kectrs16.c:435: if( c<100 ){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x64
	jr	NC,00104$
;kectrs16.c:439: __endasm;
	ld a,#0x20
	call 0x33
00104$:
;kectrs16.c:454: __endasm;
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
;kectrs16.c:455: return;
	ret
_print_char_end::
;kectrs16.c:458: void print_short(unsigned short c ){
;	---------------------------------
; Function print_short
; ---------------------------------
_print_short_start::
_print_short:
;kectrs16.c:473: __endasm;
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
;kectrs16.c:474: return;
	ret
_print_short_end::
;kectrs16.c:479: void print_str( unsigned char *s ){
;	---------------------------------
; Function print_str
; ---------------------------------
_print_str_start::
_print_str:
;kectrs16.c:489: __endasm;
	ld iy,#0x02
	add iy,sp
	ld l,0(iy)
	ld h,1(iy)
	xor a,a
	ld (#0x409c),a
	call #0x28a7
;kectrs16.c:490: return;
	ret
_print_str_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
