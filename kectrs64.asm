;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Sat Nov 09 12:49:33 2013
;--------------------------------------------------------
	.module kectrs64
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _KRPStep1
	.globl _rot64
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
	.globl _print_title
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_A::
	.ds 800
_C::
	.ds 40
_D::
	.ds 40
_B::
	.ds 800
_pB::
	.ds 25
_r::
	.ds 25
_RC::
	.ds 192
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
;kectrs64.c:53: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
;kectrs64.c:57: RC[0]=1;
	ld	hl,#0x0001
	ld	(_RC), hl
;kectrs64.c:58: RC[1]=0;
	ld	hl,#0x0000
	ld	(_RC + 2),hl
	ld	((_RC + 0x0004)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0004) + 2), hl
;kectrs64.c:59: RC[2]=32898;
	ld	hl,#0x8082
	ld	((_RC + 0x0008)), hl
;kectrs64.c:60: RC[3]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x0008) + 2),hl
	ld	((_RC + 0x000c)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x000c) + 2), hl
;kectrs64.c:61: RC[4]=32906;
	ld	hl,#0x808A
	ld	((_RC + 0x0010)), hl
;kectrs64.c:62: RC[5]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x0010) + 2),hl
	ld	((_RC + 0x0014)), hl
;kectrs64.c:63: RC[6]=2147516416;
	ld	hl,#0x8000
	ld	((_RC + 0x0014) + 2),hl
	ld	((_RC + 0x0018)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0018) + 2), hl
;kectrs64.c:64: RC[7]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x001c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x001c) + 2), hl
;kectrs64.c:65: RC[8]=32907;
	ld	hl,#0x808B
	ld	((_RC + 0x0020)), hl
;kectrs64.c:66: RC[9]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x0020) + 2),hl
	ld	((_RC + 0x0024)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0024) + 2), hl
;kectrs64.c:67: RC[10]=2147483649;
	ld	hl,#0x0001
	ld	((_RC + 0x0028)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0028) + 2), hl
;kectrs64.c:68: RC[11]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x002c)),hl
	ld	((_RC + 0x002c) + 2), hl
;kectrs64.c:69: RC[12]=2147516545;
	ld	hl,#0x8081
	ld	((_RC + 0x0030)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0030) + 2), hl
;kectrs64.c:70: RC[13]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x0034)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0034) + 2), hl
;kectrs64.c:71: RC[14]=32777;
	ld	hl,#0x8009
	ld	((_RC + 0x0038)), hl
;kectrs64.c:72: RC[15]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x0038) + 2),hl
	ld	((_RC + 0x003c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x003c) + 2), hl
;kectrs64.c:73: RC[16]=138;
	ld	hl,#0x008A
	ld	((_RC + 0x0040)), hl
;kectrs64.c:74: RC[17]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x0040) + 2),hl
	ld	((_RC + 0x0044)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0044) + 2), hl
;kectrs64.c:75: RC[18]=136;
	ld	hl,#0x0088
	ld	((_RC + 0x0048)), hl
;kectrs64.c:76: RC[19]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x0048) + 2),hl
	ld	((_RC + 0x004c)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x004c) + 2), hl
;kectrs64.c:77: RC[20]=2147516425;
	ld	hl,#0x8009
	ld	((_RC + 0x0050)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0050) + 2), hl
;kectrs64.c:78: RC[21]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x0054)),hl
	ld	((_RC + 0x0054) + 2), hl
;kectrs64.c:79: RC[22]=2147483658;
	ld	hl,#0x000A
	ld	((_RC + 0x0058)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0058) + 2), hl
;kectrs64.c:80: RC[23]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x005c)),hl
	ld	((_RC + 0x005c) + 2), hl
;kectrs64.c:81: RC[24]=2147516555;
	ld	hl,#0x808B
	ld	((_RC + 0x0060)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0060) + 2), hl
;kectrs64.c:82: RC[25]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x0064)),hl
	ld	((_RC + 0x0064) + 2), hl
;kectrs64.c:83: RC[26]=139;
	ld	hl,#0x008B
	ld	((_RC + 0x0068)), hl
;kectrs64.c:84: RC[27]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x0068) + 2),hl
	ld	((_RC + 0x006c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x006c) + 2), hl
;kectrs64.c:85: RC[28]=32905;
	ld	hl,#0x8089
	ld	((_RC + 0x0070)), hl
;kectrs64.c:86: RC[29]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x0070) + 2),hl
	ld	((_RC + 0x0074)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0074) + 2), hl
;kectrs64.c:87: RC[30]=32771;
	ld	hl,#0x8003
	ld	((_RC + 0x0078)), hl
;kectrs64.c:88: RC[31]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x0078) + 2),hl
	ld	((_RC + 0x007c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x007c) + 2), hl
;kectrs64.c:89: RC[32]=32770;
	ld	hl,#0x8002
	ld	((_RC + 0x0080)), hl
;kectrs64.c:90: RC[33]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x0080) + 2),hl
	ld	((_RC + 0x0084)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0084) + 2), hl
;kectrs64.c:91: RC[34]=128;
	ld	hl,#0x0080
	ld	((_RC + 0x0088)), hl
;kectrs64.c:92: RC[35]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x0088) + 2),hl
	ld	((_RC + 0x008c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x008c) + 2), hl
;kectrs64.c:93: RC[36]=32778;
	ld	hl,#0x800A
	ld	((_RC + 0x0090)), hl
;kectrs64.c:94: RC[37]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x0090) + 2),hl
	ld	((_RC + 0x0094)), hl
	ld	hl,#0x0000
	ld	((_RC + 0x0094) + 2), hl
;kectrs64.c:95: RC[38]=2147483658;
	ld	hl,#0x000A
	ld	((_RC + 0x0098)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x0098) + 2), hl
;kectrs64.c:96: RC[39]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x009c)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x009c) + 2), hl
;kectrs64.c:97: RC[40]=2147516545;
	ld	hl,#0x8081
	ld	((_RC + 0x00a0)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x00a0) + 2), hl
;kectrs64.c:98: RC[41]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x00a4)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x00a4) + 2), hl
;kectrs64.c:99: RC[42]=32896;
	ld	hl,#0x8080
	ld	((_RC + 0x00a8)), hl
;kectrs64.c:100: RC[43]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x00a8) + 2),hl
	ld	((_RC + 0x00ac)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x00ac) + 2), hl
;kectrs64.c:101: RC[44]=2147483649;
	ld	hl,#0x0001
	ld	((_RC + 0x00b0)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x00b0) + 2), hl
;kectrs64.c:102: RC[45]=0;
	ld	hl,#0x0000
	ld	((_RC + 0x00b4)),hl
	ld	((_RC + 0x00b4) + 2), hl
;kectrs64.c:103: RC[46]=2147516424;
	ld	hl,#0x8008
	ld	((_RC + 0x00b8)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x00b8) + 2), hl
;kectrs64.c:104: RC[47]=2147483648;
	ld	hl,#0x0000
	ld	((_RC + 0x00bc)), hl
	ld	hl,#0x8000
	ld	((_RC + 0x00bc) + 2), hl
;kectrs64.c:106: r[0]=0;
	ld	hl,#_r
	ld	(hl),#0x00
;kectrs64.c:107: r[1]=1;
	inc	hl
	ld	(hl),#0x01
;kectrs64.c:108: r[2]=62;
	ld	hl,#_r + 2
	ld	(hl),#0x3E
;kectrs64.c:109: r[3]=28;
	ld	hl,#_r + 3
	ld	(hl),#0x1C
;kectrs64.c:110: r[4]=27;
	ld	hl,#_r + 4
	ld	(hl),#0x1B
;kectrs64.c:111: r[5]=36;
	ld	hl,#_r + 5
	ld	(hl),#0x24
;kectrs64.c:112: r[6]=44;
	ld	hl,#_r + 6
	ld	(hl),#0x2C
;kectrs64.c:113: r[7]=6;
	ld	hl,#_r + 7
	ld	(hl),#0x06
;kectrs64.c:114: r[8]=55;
	ld	hl,#_r + 8
	ld	(hl),#0x37
;kectrs64.c:115: r[9]=20;
	ld	hl,#_r + 9
	ld	(hl),#0x14
;kectrs64.c:116: r[10]=3;
	ld	hl,#_r + 10
	ld	(hl),#0x03
;kectrs64.c:117: r[11]=10;
	ld	hl,#_r + 11
	ld	(hl),#0x0A
;kectrs64.c:118: r[12]=43;
	ld	hl,#_r + 12
	ld	(hl),#0x2B
;kectrs64.c:119: r[13]=25;
	ld	hl,#_r + 13
	ld	(hl),#0x19
;kectrs64.c:120: r[14]=39;
	ld	hl,#_r + 14
	ld	(hl),#0x27
;kectrs64.c:121: r[15]=41;
	ld	hl,#_r + 15
	ld	(hl),#0x29
;kectrs64.c:122: r[16]=45;
	ld	hl,#_r + 16
	ld	(hl),#0x2D
;kectrs64.c:123: r[17]=15;
	ld	hl,#_r + 17
	ld	(hl),#0x0F
;kectrs64.c:124: r[18]=21;
	ld	hl,#_r + 18
	ld	(hl),#0x15
;kectrs64.c:125: r[19]=8;
	ld	hl,#_r + 19
	ld	(hl),#0x08
;kectrs64.c:126: r[20]=18;
	ld	hl,#_r + 20
	ld	(hl),#0x12
;kectrs64.c:127: r[21]=2;
	ld	hl,#_r + 21
	ld	(hl),#0x02
;kectrs64.c:128: r[22]=61;
	ld	hl,#_r + 22
	ld	(hl),#0x3D
;kectrs64.c:129: r[23]=56;
	ld	hl,#_r + 23
	ld	(hl),#0x38
;kectrs64.c:130: r[24]=14;
	ld	hl,#_r + 24
	ld	(hl),#0x0E
;kectrs64.c:132: pB[0]=0;
	ld	hl,#_pB
	ld	(hl),#0x00
;kectrs64.c:133: pB[1]=10;
	inc	hl
	ld	(hl),#0x0A
;kectrs64.c:134: pB[2]=20;
	ld	hl,#_pB + 2
	ld	(hl),#0x14
;kectrs64.c:135: pB[3]=5;
	ld	hl,#_pB + 3
	ld	(hl),#0x05
;kectrs64.c:136: pB[4]=15;
	ld	hl,#_pB + 4
	ld	(hl),#0x0F
;kectrs64.c:137: pB[5]=16;
	ld	hl,#_pB + 5
	ld	(hl),#0x10
;kectrs64.c:138: pB[6]=1;
	ld	hl,#_pB + 6
	ld	(hl),#0x01
;kectrs64.c:139: pB[7]=11;
	ld	hl,#_pB + 7
	ld	(hl),#0x0B
;kectrs64.c:140: pB[8]=21;
	ld	hl,#_pB + 8
	ld	(hl),#0x15
;kectrs64.c:141: pB[9]=6;
	ld	hl,#_pB + 9
	ld	(hl),#0x06
;kectrs64.c:142: pB[10]=7;
	ld	hl,#_pB + 10
	ld	(hl),#0x07
;kectrs64.c:143: pB[11]=17;
	ld	hl,#_pB + 11
	ld	(hl),#0x11
;kectrs64.c:144: pB[12]=2;
	ld	hl,#_pB + 12
	ld	(hl),#0x02
;kectrs64.c:145: pB[13]=12;
	ld	hl,#_pB + 13
	ld	(hl),#0x0C
;kectrs64.c:146: pB[14]=22;
	ld	hl,#_pB + 14
	ld	(hl),#0x16
;kectrs64.c:147: pB[15]=23;
	ld	hl,#_pB + 15
	ld	(hl),#0x17
;kectrs64.c:148: pB[16]=8;
	ld	hl,#_pB + 16
	ld	(hl),#0x08
;kectrs64.c:149: pB[17]=18;
	ld	hl,#_pB + 17
	ld	(hl),#0x12
;kectrs64.c:150: pB[18]=3;
	ld	hl,#_pB + 18
	ld	(hl),#0x03
;kectrs64.c:151: pB[19]=13;
	ld	hl,#_pB + 19
	ld	(hl),#0x0D
;kectrs64.c:152: pB[20]=14;
	ld	hl,#_pB + 20
	ld	(hl),#0x0E
;kectrs64.c:153: pB[21]=24;
	ld	hl,#_pB + 21
	ld	(hl),#0x18
;kectrs64.c:154: pB[22]=9;
	ld	hl,#_pB + 22
	ld	(hl),#0x09
;kectrs64.c:155: pB[23]=19;
	ld	hl,#_pB + 23
	ld	(hl),#0x13
;kectrs64.c:156: pB[24]=4;
	ld	hl,#_pB + 24
	ld	(hl),#0x04
;kectrs64.c:159: for( i=0; i<K_LANES; i++ ) { A[2*i] = 0; A[2*i+1] = 0; }
	ld	de,#0x0000
00109$:
	ld	a,e
	add	a, a
	ld	c,a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	l,a
	ld	a,#>(_A)
	adc	a, h
	ld	h,a
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	a,c
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
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
;kectrs64.c:160: A[0]=123456L; A[2]=234567L; A[4]=345678L; A[6]=456789L; A[8]=567890L;
	ld	hl,#0xE240
	ld	(_A), hl
	ld	hl,#0x0001
	ld	(_A + 2), hl
	ld	hl,#0x9447
	ld	((_A + 0x0008)), hl
	ld	hl,#0x0003
	ld	((_A + 0x0008) + 2), hl
	ld	hl,#0x464E
	ld	((_A + 0x0010)), hl
	ld	hl,#0x0005
	ld	((_A + 0x0010) + 2), hl
	ld	hl,#0xF855
	ld	((_A + 0x0018)), hl
	ld	hl,#0x0006
	ld	((_A + 0x0018) + 2), hl
	ld	hl,#0xAA52
	ld	((_A + 0x0020)), hl
	ld	hl,#0x0008
	ld	((_A + 0x0020) + 2), hl
;kectrs64.c:163: for( i=0; i<K_LANES; i++ ){
	ld	bc,#0x0000
00111$:
;kectrs64.c:164: if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
	ld	a,b
	or	a,c
	jr	Z,00102$
	ld	a,c
	sub	a,#0x05
	jr	NZ,00141$
	or	a,b
	jr	Z,00102$
00141$:
	ld	a,c
	sub	a,#0x0A
	jr	NZ,00142$
	or	a,b
	jr	Z,00102$
00142$:
	ld	a,c
	sub	a,#0x0F
	jr	NZ,00143$
	or	a,b
	jr	Z,00102$
00143$:
	ld	a,c
	sub	a,#0x14
	jr	NZ,00103$
	or	a,b
	jr	NZ,00103$
00102$:
	push	bc
	call	_print_crlf
	pop	bc
00103$:
;kectrs64.c:165: u = A[2*i]; v = A[2*i+1];
	ld	a,c
	add	a, a
	ld	e,a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	l,a
	ld	a,#>(_A)
	adc	a, h
	ld	d,a
	push	de
	push	bc
	ld	e, l
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
	pop	de
	ld	a,e
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	de,#_A
	add	hl,de
	push	bc
	ex	de,hl
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	bc
;kectrs64.c:166: print_short( (unsigned short) (u%65536) ); 
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	bc
	push	hl
	call	_print_short
	pop	af
	pop	bc
;kectrs64.c:167: print_short( (unsigned short) (u>>16) );
	push	af
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d,-2 (ix)
	ld	e,-1 (ix)
	pop	af
	ld	a,#0x10
00146$:
	srl	e
	rr	d
	rr	h
	rr	l
	dec	a
	jr	NZ,00146$
	push	bc
	push	hl
	call	_print_short
	pop	af
	pop	bc
;kectrs64.c:168: print_short( (unsigned short) (v%65536) ); 
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	bc
	push	hl
	call	_print_short
	pop	af
	pop	bc
;kectrs64.c:169: print_short( (unsigned short) (v>>16) );
	push	af
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d,-6 (ix)
	ld	e,-5 (ix)
	pop	af
	ld	a,#0x10
00148$:
	srl	e
	rr	d
	rr	h
	rr	l
	dec	a
	jr	NZ,00148$
	push	bc
	push	hl
	call	_print_short
	pop	af
	pop	bc
;kectrs64.c:163: for( i=0; i<K_LANES; i++ ){
	inc	bc
	ld	a,c
	sub	a, #0x19
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00111$
;kectrs64.c:171: print_crlf();
	call	_print_crlf
;kectrs64.c:185: KRounds();
	call	_KRounds
;kectrs64.c:199: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
	ld hl,#0x6cc ; BASIC command line
	jp (hl)
	ld	sp,ix
	pop	ix
	ret
_main_end::
;kectrs64.c:215: unsigned char  rot64( unsigned char k, unsigned char n ){
;	---------------------------------
; Function rot64
; ---------------------------------
_rot64_start::
_rot64:
;kectrs64.c:281: __endasm;
	ld iy,#0
	add iy,sp
	push bc
	push de
	ld d,#0
	00001$:
	ld a,d
	sub a,3(iy)
	jp NC,00002$
	ld hl,#(_A)
	ld bc,#4
	ld a,2(iy)
	or a
	00004$:
	jr Z,00003$
	add hl,bc
	dec a
	jr 00004$
	00003$:
	push hl
	ld bc,#7
	add hl,bc
	ld a,(hl)
	rlca
	pop hl
	ld a,(hl)
	rla
	ld (hl),a
	inc hl
	ld a,(hl)
	rla
	ld (hl),a
	inc hl
	ld a,(hl)
	rla
	ld (hl),a
	inc hl
	ld a,(hl)
	rla
	ld (hl),a
	inc hl
	ld a,(hl)
	rla
	ld (hl),a
	inc hl
	ld a,(hl)
	rla
	ld (hl),a
	inc hl
	ld a,(hl)
	rla
	ld (hl),a
	inc hl
	ld a,(hl)
	rla
	ld (hl),a
	inc hl
	inc d
	jp 00001$
	00002$:
	pop de
	pop bc
;kectrs64.c:282: return n;
	ld	iy,#3
	add	iy,sp
	ld	l,0 (iy)
;kectrs64.c:283: k;
	ret
_rot64_end::
;kectrs64.c:286: void KThetaStep(){
;	---------------------------------
; Function KThetaStep
; ---------------------------------
_KThetaStep_start::
_KThetaStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-23
	add	hl,sp
	ld	sp,hl
;kectrs64.c:288: for( i=0; i<5; i++ ){
	ld	de,#0x0000
00104$:
;kectrs64.c:289: C[2*i]=(unsigned long) A[2*i]^A[2*i+2*5]^A[2*i+2*10]^A[2*i+2*15]^A[2*i+2*20];
	ld	a,e
	add	a, a
	ld	-1 (ix), a
	ld	l, a
	ld	a,-1 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_C)
	add	a, l
	ld	-3 (ix),a
	ld	a,#>(_C)
	adc	a, h
	ld	-2 (ix),a
	ld	bc,#_A
	add	hl,bc
	push	de
	ex	de,hl
	ld	hl, #0x0012
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
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
	ld	a,-7 (ix)
	xor	a, c
	ld	-7 (ix),a
	ld	a,-6 (ix)
	xor	a, b
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, l
	ld	-5 (ix),a
	ld	a,-4 (ix)
	xor	a, h
	ld	-4 (ix),a
	ld	a,-1 (ix)
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
	ld	a,-7 (ix)
	xor	a, c
	ld	-7 (ix),a
	ld	a,-6 (ix)
	xor	a, b
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, l
	ld	-5 (ix),a
	ld	a,-4 (ix)
	xor	a, h
	ld	-4 (ix),a
	ld	a,-1 (ix)
	add	a, #0x1E
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
	ld	a,-7 (ix)
	xor	a, c
	ld	-7 (ix),a
	ld	a,-6 (ix)
	xor	a, b
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, l
	ld	-5 (ix),a
	ld	a,-4 (ix)
	xor	a, h
	ld	-4 (ix),a
	ld	a,-1 (ix)
	add	a, #0x28
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
	ld	a,-7 (ix)
	xor	a, c
	ld	-7 (ix),a
	ld	a,-6 (ix)
	xor	a, b
	ld	-6 (ix),a
	ld	a,-5 (ix)
	xor	a, l
	ld	-5 (ix),a
	ld	a,-4 (ix)
	xor	a, h
	ld	-4 (ix),a
	push	de
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0012
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	de
;kectrs64.c:290: C[2*i+1]=(unsigned long) A[2*i+1]^A[2*i+2*5+1]^A[2*i+2*10+1]^A[2*i+2*15+1]^A[2*i+2*20+1];
	ld	a,-1 (ix)
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_C)
	add	a, l
	ld	-7 (ix),a
	ld	a,#>(_C)
	adc	a, h
	ld	-6 (ix),a
	ld	bc,#_A
	add	hl,bc
	push	de
	ex	de,hl
	ld	hl, #0x000E
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
	add	a, #0x0B
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
	ld	a,-11 (ix)
	xor	a, c
	ld	-11 (ix),a
	ld	a,-10 (ix)
	xor	a, b
	ld	-10 (ix),a
	ld	a,-9 (ix)
	xor	a, l
	ld	-9 (ix),a
	ld	a,-8 (ix)
	xor	a, h
	ld	-8 (ix),a
	ld	a,-1 (ix)
	add	a, #0x15
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
	ld	a,-11 (ix)
	xor	a, c
	ld	-11 (ix),a
	ld	a,-10 (ix)
	xor	a, b
	ld	-10 (ix),a
	ld	a,-9 (ix)
	xor	a, l
	ld	-9 (ix),a
	ld	a,-8 (ix)
	xor	a, h
	ld	-8 (ix),a
	ld	a,-1 (ix)
	add	a, #0x1F
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
	ld	a,-11 (ix)
	xor	a, c
	ld	-11 (ix),a
	ld	a,-10 (ix)
	xor	a, b
	ld	-10 (ix),a
	ld	a,-9 (ix)
	xor	a, l
	ld	-9 (ix),a
	ld	a,-8 (ix)
	xor	a, h
	ld	-8 (ix),a
	ld	a,-1 (ix)
	add	a, #0x29
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
	ld	a,-11 (ix)
	xor	a, c
	ld	-11 (ix),a
	ld	a,-10 (ix)
	xor	a, b
	ld	-10 (ix),a
	ld	a,-9 (ix)
	xor	a, l
	ld	-9 (ix),a
	ld	a,-8 (ix)
	xor	a, h
	ld	-8 (ix),a
	push	de
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	ld	hl, #0x000E
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	de
;kectrs64.c:288: for( i=0; i<5; i++ ){
	inc	de
	ld	a,e
	sub	a, #0x05
	ld	a,d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00104$
;kectrs64.c:431: __endasm;
	push de
	push ix
;; D[0]
	ld ix,#(_D+0) ; Offset 0
	ld hl,#(_C+32) ; Offset 8*i
	ld de,#(_C+15) ; Offset 8i+7
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
;; D[1]
	ld ix,#(_D+8)
	ld hl,#(_C+0)
	ld de,#(_C+23)
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
;; D[2]
	ld ix,#(_D+16)
	ld hl,#(_C+8)
	ld de,#(_C+31)
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
;; D[3]
	ld ix,#(_D+24)
	ld hl,#(_C+16)
	ld de,#(_C+39)
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
	call 00001$
;; D[4]
	ld ix,#(_D+32)
	ld hl,#(_C+24)
	ld de,#(_C+7)
	ld a,(de)
	rlca
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	dec de
	call 00001$
	call 00001$
	call 00001$
	call 00001$
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
;kectrs64.c:432: for( i=0; i<5; i++ )
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
;kectrs64.c:433: for( j=0; j<5; j++ ){
00114$:
	ld	hl,#0x0000
	ex	(sp), hl
00106$:
;kectrs64.c:434: A[2*i+j*10] = A[2*i+j*10]^D[2*i];
	ld	a,-21 (ix)
	add	a, a
	ld	-11 (ix),a
	ld	a,-23 (ix)
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ld	-7 (ix),a
	ld	a,-11 (ix)
	add	a, -7 (ix)
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,#<(_A)
	add	a, l
	ld	-3 (ix),a
	ld	a,#>(_A)
	adc	a, h
	ld	-2 (ix),a
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0008
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	l,-11 (ix)
	ld	a,-11 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	de,#_D
	add	hl,de
	ex	de,hl
	ld	hl, #0x0004
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a,-19 (ix)
	xor	a, -15 (ix)
	ld	-19 (ix),a
	ld	a,-18 (ix)
	xor	a, -14 (ix)
	ld	-18 (ix),a
	ld	a,-17 (ix)
	xor	a, -13 (ix)
	ld	-17 (ix),a
	ld	a,-16 (ix)
	xor	a, -12 (ix)
	ld	-16 (ix),a
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:435: A[2*i+1+j*10] = A[2*i+1+j*10]^D[2*i+1];
	ld	a,-11 (ix)
	inc	a
	ld	-19 (ix), a
	add	a, -7 (ix)
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,l
	add	a, #<(_A)
	ld	-15 (ix),a
	ld	a,h
	adc	a, #>(_A)
	ld	-14 (ix),a
	ld	e,-15 (ix)
	ld	d,-14 (ix)
	ld	hl, #0x000C
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	l,-19 (ix)
	ld	a,-19 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	de,#_D
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	h,(hl)
	ld	a,-11 (ix)
	xor	a, e
	ld	-19 (ix),a
	ld	a,-10 (ix)
	xor	a, d
	ld	-18 (ix),a
	ld	a,-9 (ix)
	xor	a, c
	ld	-17 (ix),a
	ld	a,-8 (ix)
	xor	a, h
	ld	-16 (ix),a
	ld	e,-15 (ix)
	ld	d,-14 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:433: for( j=0; j<5; j++ ){
	inc	-23 (ix)
	jr	NZ,00130$
	inc	-22 (ix)
00130$:
	ld	a,-23 (ix)
	sub	a, #0x05
	ld	a,-22 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00106$
;kectrs64.c:432: for( i=0; i<5; i++ )
	inc	-21 (ix)
	jr	NZ,00131$
	inc	-20 (ix)
00131$:
	ld	a,-21 (ix)
	sub	a, #0x05
	ld	a,-20 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00114$
	ld	sp,ix
	pop	ix
	ret
_KThetaStep_end::
;kectrs64.c:440: void KRPStep1(short i){
;	---------------------------------
; Function KRPStep1
; ---------------------------------
_KRPStep1_start::
_KRPStep1:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-125
	add	hl,sp
	ld	sp,hl
;kectrs64.c:444: if( 0==r[i] ) return;
	ld	hl,#_r
	ld	e,4 (ix)
	ld	d,5 (ix)
	add	hl,de
	ld	a,(hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z,00119$
;kectrs64.c:446: rr = (unsigned char)(r[i]%8); // 0 <= rr <= 7
	ld	a,-1 (ix)
	and	a, #0x07
	ld	-117 (ix),a
;kectrs64.c:447: rq = (unsigned char)(r[i]>>3);// 0 <= rq <= 7
	ld	a,-1 (ix)
	rrca
	rrca
	rrca
	and	a,#0x1F
	ld	-118 (ix),a
;kectrs64.c:448: a0 = (unsigned char)(A[2*i]&0xff);
	ld	a,4 (ix)
	ld	-1 (ix),a
	sla	-1 (ix)
	ld	a,-1 (ix)
	ld	-3 (ix),a
	ld	a,-1 (ix)
	rla
	sbc	a, a
	ld	-2 (ix),a
	ld	a,#0x02+1
	jr	00149$
00148$:
	sla	-3 (ix)
	rl	-2 (ix)
00149$:
	dec	a
	jr	NZ,00148$
	ld	a,#<(_A)
	add	a, -3 (ix)
	ld	-3 (ix),a
	ld	a,#>(_A)
	adc	a, -2 (ix)
	ld	-2 (ix),a
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0076
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a,-7 (ix)
	ld	-11 (ix),a
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	a,-11 (ix)
	ld	-119 (ix),a
;kectrs64.c:449: a1 = (unsigned char)((A[2*i]>>8)&0xff);
	push	af
	ld	a,-7 (ix)
	ld	-11 (ix),a
	ld	a,-6 (ix)
	ld	-10 (ix),a
	ld	a,-5 (ix)
	ld	-9 (ix),a
	ld	a,-4 (ix)
	ld	-8 (ix),a
	pop	af
	ld	b,#0x08
00150$:
	srl	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	djnz	00150$
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	a,-11 (ix)
	ld	-120 (ix),a
;kectrs64.c:450: a2 = (unsigned char)((A[2*i]>>16)&0xff);
	push	af
	ld	a,-7 (ix)
	ld	-11 (ix),a
	ld	a,-6 (ix)
	ld	-10 (ix),a
	ld	a,-5 (ix)
	ld	-9 (ix),a
	ld	a,-4 (ix)
	ld	-8 (ix),a
	pop	af
	ld	b,#0x10
00152$:
	srl	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	djnz	00152$
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	a,-11 (ix)
	ld	-121 (ix),a
;kectrs64.c:451: a3 = (unsigned char)((A[2*i]>>24)&0xff);
	push	af
	ld	a,-7 (ix)
	ld	-11 (ix),a
	ld	a,-6 (ix)
	ld	-10 (ix),a
	ld	a,-5 (ix)
	ld	-9 (ix),a
	ld	a,-4 (ix)
	ld	-8 (ix),a
	pop	af
	ld	b,#0x18
00154$:
	srl	-8 (ix)
	rr	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	djnz	00154$
	ld	-10 (ix),#0x00
	ld	-9 (ix),#0x00
	ld	-8 (ix),#0x00
	ld	a,-11 (ix)
	ld	-122 (ix),a
;kectrs64.c:452: a4 = (unsigned char)(A[2*i+1]&0xff);
	ld	a,-1 (ix)
	inc	a
	ld	-11 (ix), a
	ld	-11 (ix), a
	rla
	sbc	a, a
	ld	-10 (ix),a
	ld	a,-11 (ix)
	ld	-11 (ix),a
	ld	a,-10 (ix)
	ld	-10 (ix),a
	ld	a,#0x02+1
	jr	00157$
00156$:
	sla	-11 (ix)
	rl	-10 (ix)
00157$:
	dec	a
	jr	NZ,00156$
	ld	a,#<(_A)
	add	a, -11 (ix)
	ld	-11 (ix),a
	ld	a,#>(_A)
	adc	a, -10 (ix)
	ld	-10 (ix),a
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0076
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a,-7 (ix)
	ld	-15 (ix),a
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
	ld	a,-15 (ix)
	ld	-123 (ix),a
;kectrs64.c:453: a5 = (unsigned char)((A[2*i+1]>>8)&0xff);
	push	af
	ld	a,-7 (ix)
	ld	-15 (ix),a
	ld	a,-6 (ix)
	ld	-14 (ix),a
	ld	a,-5 (ix)
	ld	-13 (ix),a
	ld	a,-4 (ix)
	ld	-12 (ix),a
	pop	af
	ld	b,#0x08
00158$:
	srl	-12 (ix)
	rr	-13 (ix)
	rr	-14 (ix)
	rr	-15 (ix)
	djnz	00158$
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
	ld	a,-15 (ix)
	ld	-124 (ix),a
;kectrs64.c:454: a6 = (unsigned char)((A[2*i+1]>>16)&0xff);
	push	af
	ld	a,-7 (ix)
	ld	-15 (ix),a
	ld	a,-6 (ix)
	ld	-14 (ix),a
	ld	a,-5 (ix)
	ld	-13 (ix),a
	ld	a,-4 (ix)
	ld	-12 (ix),a
	pop	af
	ld	b,#0x10
00160$:
	srl	-12 (ix)
	rr	-13 (ix)
	rr	-14 (ix)
	rr	-15 (ix)
	djnz	00160$
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
	ld	a,-15 (ix)
	ld	-125 (ix),a
;kectrs64.c:455: a7 = (unsigned char)((A[2*i+1]>>24)&0xff);
	push	af
	ld	a,-7 (ix)
	ld	-15 (ix),a
	ld	a,-6 (ix)
	ld	-14 (ix),a
	ld	a,-5 (ix)
	ld	-13 (ix),a
	ld	a,-4 (ix)
	ld	-12 (ix),a
	pop	af
	ld	b,#0x18
00162$:
	srl	-12 (ix)
	rr	-13 (ix)
	rr	-14 (ix)
	rr	-15 (ix)
	djnz	00162$
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
	ld	a,-15 (ix)
;kectrs64.c:457: A[2*i]= (unsigned long) a7;
	ld	-116 (ix), a
	ld	-15 (ix),a
	ld	-14 (ix),#0x00
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
;kectrs64.c:458: A[2*i]+=(unsigned long) a0<<8;
	ld	a,-119 (ix)
	ld	-7 (ix),a
	ld	-6 (ix),#0x00
	ld	-5 (ix),#0x00
	ld	-4 (ix),#0x00
;kectrs64.c:459: A[2*i]+=(unsigned long) a1<<16; 
	ld	a,-120 (ix)
	ld	-19 (ix),a
	ld	-18 (ix),#0x00
	ld	-17 (ix),#0x00
	ld	-16 (ix),#0x00
;kectrs64.c:460: A[2*i]+=(unsigned long) a2<<24;
	ld	a,-121 (ix)
	ld	-23 (ix),a
	ld	-22 (ix),#0x00
	ld	-21 (ix),#0x00
	ld	-20 (ix),#0x00
;kectrs64.c:461: A[2*i+1]= (unsigned long) a3;
	ld	a,-122 (ix)
	ld	-27 (ix),a
	ld	-26 (ix),#0x00
	ld	-25 (ix),#0x00
	ld	-24 (ix),#0x00
;kectrs64.c:462: A[2*i+1]+=(unsigned long) a4<<8;
	ld	a,-123 (ix)
	ld	-31 (ix),a
	ld	-30 (ix),#0x00
	ld	-29 (ix),#0x00
	ld	-28 (ix),#0x00
;kectrs64.c:463: A[2*i+1]+=(unsigned long) a5<<16; 
	ld	a,-124 (ix)
	ld	-35 (ix),a
	ld	-34 (ix),#0x00
	ld	-33 (ix),#0x00
	ld	-32 (ix),#0x00
;kectrs64.c:464: A[2*i+1]+=(unsigned long) a6<<24;
	ld	a,-125 (ix)
	ld	-39 (ix),a
	ld	-38 (ix),#0x00
	ld	-37 (ix),#0x00
	ld	-36 (ix),#0x00
;kectrs64.c:458: A[2*i]+=(unsigned long) a0<<8;
	push	af
	ld	a,-7 (ix)
	ld	-43 (ix),a
	ld	a,-6 (ix)
	ld	-42 (ix),a
	ld	a,-5 (ix)
	ld	-41 (ix),a
	ld	a,-4 (ix)
	ld	-40 (ix),a
	pop	af
	ld	b,#0x08
00164$:
	sla	-43 (ix)
	rl	-42 (ix)
	rl	-41 (ix)
	rl	-40 (ix)
	djnz	00164$
;kectrs64.c:459: A[2*i]+=(unsigned long) a1<<16; 
	push	af
	ld	a,-19 (ix)
	ld	-47 (ix),a
	ld	a,-18 (ix)
	ld	-46 (ix),a
	ld	a,-17 (ix)
	ld	-45 (ix),a
	ld	a,-16 (ix)
	ld	-44 (ix),a
	pop	af
	ld	b,#0x10
00166$:
	sla	-47 (ix)
	rl	-46 (ix)
	rl	-45 (ix)
	rl	-44 (ix)
	djnz	00166$
;kectrs64.c:460: A[2*i]+=(unsigned long) a2<<24;
	push	af
	ld	a,-23 (ix)
	ld	-51 (ix),a
	ld	a,-22 (ix)
	ld	-50 (ix),a
	ld	a,-21 (ix)
	ld	-49 (ix),a
	ld	a,-20 (ix)
	ld	-48 (ix),a
	pop	af
	ld	b,#0x18
00168$:
	sla	-51 (ix)
	rl	-50 (ix)
	rl	-49 (ix)
	rl	-48 (ix)
	djnz	00168$
;kectrs64.c:462: A[2*i+1]+=(unsigned long) a4<<8;
	push	af
	ld	a,-31 (ix)
	ld	-55 (ix),a
	ld	a,-30 (ix)
	ld	-54 (ix),a
	ld	a,-29 (ix)
	ld	-53 (ix),a
	ld	a,-28 (ix)
	ld	-52 (ix),a
	pop	af
	ld	b,#0x08
00170$:
	sla	-55 (ix)
	rl	-54 (ix)
	rl	-53 (ix)
	rl	-52 (ix)
	djnz	00170$
;kectrs64.c:463: A[2*i+1]+=(unsigned long) a5<<16; 
	push	af
	ld	a,-35 (ix)
	ld	-59 (ix),a
	ld	a,-34 (ix)
	ld	-58 (ix),a
	ld	a,-33 (ix)
	ld	-57 (ix),a
	ld	a,-32 (ix)
	ld	-56 (ix),a
	pop	af
	ld	b,#0x10
00172$:
	sla	-59 (ix)
	rl	-58 (ix)
	rl	-57 (ix)
	rl	-56 (ix)
	djnz	00172$
;kectrs64.c:464: A[2*i+1]+=(unsigned long) a6<<24;
	push	af
	ld	a,-39 (ix)
	ld	-63 (ix),a
	ld	a,-38 (ix)
	ld	-62 (ix),a
	ld	a,-37 (ix)
	ld	-61 (ix),a
	ld	a,-36 (ix)
	ld	-60 (ix),a
	pop	af
	ld	b,#0x18
00174$:
	sla	-63 (ix)
	rl	-62 (ix)
	rl	-61 (ix)
	rl	-60 (ix)
	djnz	00174$
;kectrs64.c:458: A[2*i]+=(unsigned long) a0<<8;
	ld	a,-15 (ix)
	add	a, -43 (ix)
	ld	-43 (ix),a
	ld	a,-14 (ix)
	adc	a, -42 (ix)
	ld	-42 (ix),a
	ld	a,-13 (ix)
	adc	a, -41 (ix)
	ld	-41 (ix),a
	ld	a,-12 (ix)
	adc	a, -40 (ix)
	ld	-40 (ix),a
;kectrs64.c:462: A[2*i+1]+=(unsigned long) a4<<8;
	ld	a,-27 (ix)
	add	a, -55 (ix)
	ld	-55 (ix),a
	ld	a,-26 (ix)
	adc	a, -54 (ix)
	ld	-54 (ix),a
	ld	a,-25 (ix)
	adc	a, -53 (ix)
	ld	-53 (ix),a
	ld	a,-24 (ix)
	adc	a, -52 (ix)
	ld	-52 (ix),a
;kectrs64.c:459: A[2*i]+=(unsigned long) a1<<16; 
	ld	a,-43 (ix)
	add	a, -47 (ix)
	ld	-47 (ix),a
	ld	a,-42 (ix)
	adc	a, -46 (ix)
	ld	-46 (ix),a
	ld	a,-41 (ix)
	adc	a, -45 (ix)
	ld	-45 (ix),a
	ld	a,-40 (ix)
	adc	a, -44 (ix)
	ld	-44 (ix),a
;kectrs64.c:463: A[2*i+1]+=(unsigned long) a5<<16; 
	ld	a,-55 (ix)
	add	a, -59 (ix)
	ld	-59 (ix),a
	ld	a,-54 (ix)
	adc	a, -58 (ix)
	ld	-58 (ix),a
	ld	a,-53 (ix)
	adc	a, -57 (ix)
	ld	-57 (ix),a
	ld	a,-52 (ix)
	adc	a, -56 (ix)
	ld	-56 (ix),a
;kectrs64.c:460: A[2*i]+=(unsigned long) a2<<24;
	ld	a,-47 (ix)
	add	a, -51 (ix)
	ld	-51 (ix),a
	ld	a,-46 (ix)
	adc	a, -50 (ix)
	ld	-50 (ix),a
	ld	a,-45 (ix)
	adc	a, -49 (ix)
	ld	-49 (ix),a
	ld	a,-44 (ix)
	adc	a, -48 (ix)
	ld	-48 (ix),a
;kectrs64.c:464: A[2*i+1]+=(unsigned long) a6<<24;
	ld	a,-59 (ix)
	add	a, -63 (ix)
	ld	-63 (ix),a
	ld	a,-58 (ix)
	adc	a, -62 (ix)
	ld	-62 (ix),a
	ld	a,-57 (ix)
	adc	a, -61 (ix)
	ld	-61 (ix),a
	ld	a,-56 (ix)
	adc	a, -60 (ix)
	ld	-60 (ix),a
;kectrs64.c:456: if( 1==rq ){
	ld	a,-118 (ix)
	dec	a
	jr	NZ,00104$
;kectrs64.c:457: A[2*i]= (unsigned long) a7;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x006E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:458: A[2*i]+=(unsigned long) a0<<8;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0052
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:459: A[2*i]+=(unsigned long) a1<<16; 
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x004E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:460: A[2*i]+=(unsigned long) a2<<24;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x004A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:461: A[2*i+1]= (unsigned long) a3;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0062
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:462: A[2*i+1]+=(unsigned long) a4<<8;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0046
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:463: A[2*i+1]+=(unsigned long) a5<<16; 
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0042
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:464: A[2*i+1]+=(unsigned long) a6<<24;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x003E
	add	hl, sp
	ld	bc, #0x0004
	ldir
00104$:
;kectrs64.c:468: A[2*i]+=(unsigned long)   a7<<8;
	push	af
	ld	a,-15 (ix)
	ld	-67 (ix),a
	ld	a,-14 (ix)
	ld	-66 (ix),a
	ld	a,-13 (ix)
	ld	-65 (ix),a
	ld	a,-12 (ix)
	ld	-64 (ix),a
	pop	af
	ld	b,#0x08
00178$:
	sla	-67 (ix)
	rl	-66 (ix)
	rl	-65 (ix)
	rl	-64 (ix)
	djnz	00178$
;kectrs64.c:469: A[2*i]+=(unsigned long)   a0<<16; 
	push	af
	ld	a,-7 (ix)
	ld	-71 (ix),a
	ld	a,-6 (ix)
	ld	-70 (ix),a
	ld	a,-5 (ix)
	ld	-69 (ix),a
	ld	a,-4 (ix)
	ld	-68 (ix),a
	pop	af
	ld	b,#0x10
00180$:
	sla	-71 (ix)
	rl	-70 (ix)
	rl	-69 (ix)
	rl	-68 (ix)
	djnz	00180$
;kectrs64.c:470: A[2*i]+=(unsigned long)   a1<<24;
	push	af
	ld	a,-19 (ix)
	ld	-75 (ix),a
	ld	a,-18 (ix)
	ld	-74 (ix),a
	ld	a,-17 (ix)
	ld	-73 (ix),a
	ld	a,-16 (ix)
	ld	-72 (ix),a
	pop	af
	ld	b,#0x18
00182$:
	sla	-75 (ix)
	rl	-74 (ix)
	rl	-73 (ix)
	rl	-72 (ix)
	djnz	00182$
;kectrs64.c:472: A[2*i+1]+=(unsigned long) a3<<8;
	push	af
	ld	a,-27 (ix)
	ld	-79 (ix),a
	ld	a,-26 (ix)
	ld	-78 (ix),a
	ld	a,-25 (ix)
	ld	-77 (ix),a
	ld	a,-24 (ix)
	ld	-76 (ix),a
	pop	af
	ld	b,#0x08
00184$:
	sla	-79 (ix)
	rl	-78 (ix)
	rl	-77 (ix)
	rl	-76 (ix)
	djnz	00184$
;kectrs64.c:473: A[2*i+1]+=(unsigned long) a4<<16; 
	push	af
	ld	a,-31 (ix)
	ld	-83 (ix),a
	ld	a,-30 (ix)
	ld	-82 (ix),a
	ld	a,-29 (ix)
	ld	-81 (ix),a
	ld	a,-28 (ix)
	ld	-80 (ix),a
	pop	af
	ld	b,#0x10
00186$:
	sla	-83 (ix)
	rl	-82 (ix)
	rl	-81 (ix)
	rl	-80 (ix)
	djnz	00186$
;kectrs64.c:474: A[2*i+1]+=(unsigned long) a5<<24;
	push	af
	ld	a,-35 (ix)
	ld	-87 (ix),a
	ld	a,-34 (ix)
	ld	-86 (ix),a
	ld	a,-33 (ix)
	ld	-85 (ix),a
	ld	a,-32 (ix)
	ld	-84 (ix),a
	pop	af
	ld	b,#0x18
00188$:
	sla	-87 (ix)
	rl	-86 (ix)
	rl	-85 (ix)
	rl	-84 (ix)
	djnz	00188$
;kectrs64.c:468: A[2*i]+=(unsigned long)   a7<<8;
	ld	a,-39 (ix)
	add	a, -67 (ix)
	ld	-67 (ix),a
	ld	a,-38 (ix)
	adc	a, -66 (ix)
	ld	-66 (ix),a
	ld	a,-37 (ix)
	adc	a, -65 (ix)
	ld	-65 (ix),a
	ld	a,-36 (ix)
	adc	a, -64 (ix)
	ld	-64 (ix),a
;kectrs64.c:472: A[2*i+1]+=(unsigned long) a3<<8;
	ld	a,-23 (ix)
	add	a, -79 (ix)
	ld	-79 (ix),a
	ld	a,-22 (ix)
	adc	a, -78 (ix)
	ld	-78 (ix),a
	ld	a,-21 (ix)
	adc	a, -77 (ix)
	ld	-77 (ix),a
	ld	a,-20 (ix)
	adc	a, -76 (ix)
	ld	-76 (ix),a
;kectrs64.c:469: A[2*i]+=(unsigned long)   a0<<16; 
	ld	a,-67 (ix)
	add	a, -71 (ix)
	ld	-71 (ix),a
	ld	a,-66 (ix)
	adc	a, -70 (ix)
	ld	-70 (ix),a
	ld	a,-65 (ix)
	adc	a, -69 (ix)
	ld	-69 (ix),a
	ld	a,-64 (ix)
	adc	a, -68 (ix)
	ld	-68 (ix),a
;kectrs64.c:473: A[2*i+1]+=(unsigned long) a4<<16; 
	ld	a,-79 (ix)
	add	a, -83 (ix)
	ld	-83 (ix),a
	ld	a,-78 (ix)
	adc	a, -82 (ix)
	ld	-82 (ix),a
	ld	a,-77 (ix)
	adc	a, -81 (ix)
	ld	-81 (ix),a
	ld	a,-76 (ix)
	adc	a, -80 (ix)
	ld	-80 (ix),a
;kectrs64.c:470: A[2*i]+=(unsigned long)   a1<<24;
	ld	a,-71 (ix)
	add	a, -75 (ix)
	ld	-75 (ix),a
	ld	a,-70 (ix)
	adc	a, -74 (ix)
	ld	-74 (ix),a
	ld	a,-69 (ix)
	adc	a, -73 (ix)
	ld	-73 (ix),a
	ld	a,-68 (ix)
	adc	a, -72 (ix)
	ld	-72 (ix),a
;kectrs64.c:474: A[2*i+1]+=(unsigned long) a5<<24;
	ld	a,-83 (ix)
	add	a, -87 (ix)
	ld	-87 (ix),a
	ld	a,-82 (ix)
	adc	a, -86 (ix)
	ld	-86 (ix),a
	ld	a,-81 (ix)
	adc	a, -85 (ix)
	ld	-85 (ix),a
	ld	a,-80 (ix)
	adc	a, -84 (ix)
	ld	-84 (ix),a
;kectrs64.c:466: if( 2==rq ){
	ld	a,-118 (ix)
	sub	a, #0x02
	jr	NZ,00106$
;kectrs64.c:467: A[2*i]= (unsigned long)   a6;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0056
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:468: A[2*i]+=(unsigned long)   a7<<8;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x003A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:469: A[2*i]+=(unsigned long)   a0<<16; 
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0036
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:470: A[2*i]+=(unsigned long)   a1<<24;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0032
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:471: A[2*i+1]= (unsigned long) a2;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0066
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:472: A[2*i+1]+=(unsigned long) a3<<8;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x002E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:473: A[2*i+1]+=(unsigned long) a4<<16; 
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x002A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:474: A[2*i+1]+=(unsigned long) a5<<24;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0026
	add	hl, sp
	ld	bc, #0x0004
	ldir
00106$:
;kectrs64.c:478: A[2*i]+=(unsigned long)   a6<<8;
	push	af
	ld	a,-39 (ix)
	ld	-91 (ix),a
	ld	a,-38 (ix)
	ld	-90 (ix),a
	ld	a,-37 (ix)
	ld	-89 (ix),a
	ld	a,-36 (ix)
	ld	-88 (ix),a
	pop	af
	ld	b,#0x08
00192$:
	sla	-91 (ix)
	rl	-90 (ix)
	rl	-89 (ix)
	rl	-88 (ix)
	djnz	00192$
;kectrs64.c:479: A[2*i]+=(unsigned long)   a7<<16; 
	push	af
	ld	a,-15 (ix)
	ld	-95 (ix),a
	ld	a,-14 (ix)
	ld	-94 (ix),a
	ld	a,-13 (ix)
	ld	-93 (ix),a
	ld	a,-12 (ix)
	ld	-92 (ix),a
	pop	af
	ld	b,#0x10
00194$:
	sla	-95 (ix)
	rl	-94 (ix)
	rl	-93 (ix)
	rl	-92 (ix)
	djnz	00194$
;kectrs64.c:480: A[2*i]+=(unsigned long)   a0<<24;
	push	af
	ld	a,-7 (ix)
	ld	-99 (ix),a
	ld	a,-6 (ix)
	ld	-98 (ix),a
	ld	a,-5 (ix)
	ld	-97 (ix),a
	ld	a,-4 (ix)
	ld	-96 (ix),a
	pop	af
	ld	b,#0x18
00196$:
	sla	-99 (ix)
	rl	-98 (ix)
	rl	-97 (ix)
	rl	-96 (ix)
	djnz	00196$
;kectrs64.c:482: A[2*i+1]+=(unsigned long) a2<<8;
	push	af
	ld	a,-23 (ix)
	ld	-103 (ix),a
	ld	a,-22 (ix)
	ld	-102 (ix),a
	ld	a,-21 (ix)
	ld	-101 (ix),a
	ld	a,-20 (ix)
	ld	-100 (ix),a
	pop	af
	ld	b,#0x08
00198$:
	sla	-103 (ix)
	rl	-102 (ix)
	rl	-101 (ix)
	rl	-100 (ix)
	djnz	00198$
;kectrs64.c:483: A[2*i+1]+=(unsigned long) a3<<16; 
	push	af
	ld	a,-27 (ix)
	ld	-107 (ix),a
	ld	a,-26 (ix)
	ld	-106 (ix),a
	ld	a,-25 (ix)
	ld	-105 (ix),a
	ld	a,-24 (ix)
	ld	-104 (ix),a
	pop	af
	ld	b,#0x10
00200$:
	sla	-107 (ix)
	rl	-106 (ix)
	rl	-105 (ix)
	rl	-104 (ix)
	djnz	00200$
;kectrs64.c:484: A[2*i+1]+=(unsigned long) a4<<24;
	push	af
	ld	a,-31 (ix)
	ld	-111 (ix),a
	ld	a,-30 (ix)
	ld	-110 (ix),a
	ld	a,-29 (ix)
	ld	-109 (ix),a
	ld	a,-28 (ix)
	ld	-108 (ix),a
	pop	af
	ld	b,#0x18
00202$:
	sla	-111 (ix)
	rl	-110 (ix)
	rl	-109 (ix)
	rl	-108 (ix)
	djnz	00202$
;kectrs64.c:478: A[2*i]+=(unsigned long)   a6<<8;
	ld	a,-35 (ix)
	add	a, -91 (ix)
	ld	-91 (ix),a
	ld	a,-34 (ix)
	adc	a, -90 (ix)
	ld	-90 (ix),a
	ld	a,-33 (ix)
	adc	a, -89 (ix)
	ld	-89 (ix),a
	ld	a,-32 (ix)
	adc	a, -88 (ix)
	ld	-88 (ix),a
;kectrs64.c:482: A[2*i+1]+=(unsigned long) a2<<8;
	ld	a,-19 (ix)
	add	a, -103 (ix)
	ld	-103 (ix),a
	ld	a,-18 (ix)
	adc	a, -102 (ix)
	ld	-102 (ix),a
	ld	a,-17 (ix)
	adc	a, -101 (ix)
	ld	-101 (ix),a
	ld	a,-16 (ix)
	adc	a, -100 (ix)
	ld	-100 (ix),a
;kectrs64.c:479: A[2*i]+=(unsigned long)   a7<<16; 
	ld	a,-91 (ix)
	add	a, -95 (ix)
	ld	-95 (ix),a
	ld	a,-90 (ix)
	adc	a, -94 (ix)
	ld	-94 (ix),a
	ld	a,-89 (ix)
	adc	a, -93 (ix)
	ld	-93 (ix),a
	ld	a,-88 (ix)
	adc	a, -92 (ix)
	ld	-92 (ix),a
;kectrs64.c:483: A[2*i+1]+=(unsigned long) a3<<16; 
	ld	a,-103 (ix)
	add	a, -107 (ix)
	ld	-107 (ix),a
	ld	a,-102 (ix)
	adc	a, -106 (ix)
	ld	-106 (ix),a
	ld	a,-101 (ix)
	adc	a, -105 (ix)
	ld	-105 (ix),a
	ld	a,-100 (ix)
	adc	a, -104 (ix)
	ld	-104 (ix),a
;kectrs64.c:480: A[2*i]+=(unsigned long)   a0<<24;
	ld	a,-95 (ix)
	add	a, -99 (ix)
	ld	-99 (ix),a
	ld	a,-94 (ix)
	adc	a, -98 (ix)
	ld	-98 (ix),a
	ld	a,-93 (ix)
	adc	a, -97 (ix)
	ld	-97 (ix),a
	ld	a,-92 (ix)
	adc	a, -96 (ix)
	ld	-96 (ix),a
;kectrs64.c:484: A[2*i+1]+=(unsigned long) a4<<24;
	ld	a,-107 (ix)
	add	a, -111 (ix)
	ld	-111 (ix),a
	ld	a,-106 (ix)
	adc	a, -110 (ix)
	ld	-110 (ix),a
	ld	a,-105 (ix)
	adc	a, -109 (ix)
	ld	-109 (ix),a
	ld	a,-104 (ix)
	adc	a, -108 (ix)
	ld	-108 (ix),a
;kectrs64.c:476: if( 3==rq ){
	ld	a,-118 (ix)
	sub	a, #0x03
	jr	NZ,00108$
;kectrs64.c:477: A[2*i]= (unsigned long)   a5;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x005A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:478: A[2*i]+=(unsigned long)   a6<<8;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0022
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:479: A[2*i]+=(unsigned long)   a7<<16; 
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x001E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:480: A[2*i]+=(unsigned long)   a0<<24;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x001A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:481: A[2*i+1]= (unsigned long) a1;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x006A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:482: A[2*i+1]+=(unsigned long) a2<<8;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0016
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:483: A[2*i+1]+=(unsigned long) a3<<16; 
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0012
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:484: A[2*i+1]+=(unsigned long) a4<<24;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x000E
	add	hl, sp
	ld	bc, #0x0004
	ldir
00108$:
;kectrs64.c:486: if( 4==rq ){
	ld	a,-118 (ix)
	sub	a, #0x04
	jp	NZ,00110$
;kectrs64.c:487: A[2*i]= (unsigned long)   a4;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x005E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:488: A[2*i]+=(unsigned long)   a5<<8;
	push	af
	ld	l,-35 (ix)
	ld	h,-34 (ix)
	ld	e,-33 (ix)
	ld	d,-32 (ix)
	pop	af
	ld	b,#0x08
00208$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00208$
	ld	a,-31 (ix)
	add	a, l
	ld	c,a
	ld	a,-30 (ix)
	adc	a, h
	ld	b,a
	ld	a,-29 (ix)
	adc	a, e
	ld	e,a
	ld	a,-28 (ix)
	adc	a, d
	ld	d,a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;kectrs64.c:489: A[2*i]+=(unsigned long)   a6<<16; 
	push	af
	ld	a,-39 (ix)
	ld	-31 (ix),a
	ld	a,-38 (ix)
	ld	-30 (ix),a
	ld	a,-37 (ix)
	ld	-29 (ix),a
	ld	a,-36 (ix)
	ld	-28 (ix),a
	pop	af
	ld	a,#0x10
00210$:
	sla	-31 (ix)
	rl	-30 (ix)
	rl	-29 (ix)
	rl	-28 (ix)
	dec	a
	jr	NZ,00210$
	ld	a,c
	add	a, -31 (ix)
	ld	-31 (ix),a
	ld	a,b
	adc	a, -30 (ix)
	ld	-30 (ix),a
	ld	a,e
	adc	a, -29 (ix)
	ld	-29 (ix),a
	ld	a,d
	adc	a, -28 (ix)
	ld	-28 (ix),a
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x005E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:490: A[2*i]+=(unsigned long)   a7<<24;
	push	af
	ld	a,-15 (ix)
	ld	-115 (ix),a
	ld	a,-14 (ix)
	ld	-114 (ix),a
	ld	a,-13 (ix)
	ld	-113 (ix),a
	ld	a,-12 (ix)
	ld	-112 (ix),a
	pop	af
	ld	b,#0x18
00212$:
	sla	-115 (ix)
	rl	-114 (ix)
	rl	-113 (ix)
	rl	-112 (ix)
	djnz	00212$
	ld	a,-31 (ix)
	add	a, -115 (ix)
	ld	-115 (ix),a
	ld	a,-30 (ix)
	adc	a, -114 (ix)
	ld	-114 (ix),a
	ld	a,-29 (ix)
	adc	a, -113 (ix)
	ld	-113 (ix),a
	ld	a,-28 (ix)
	adc	a, -112 (ix)
	ld	-112 (ix),a
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:491: A[2*i+1]= (unsigned long) a0;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0076
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:492: A[2*i+1]+=(unsigned long) a1<<8;
	push	af
	ld	l,-19 (ix)
	ld	h,-18 (ix)
	ld	e,-17 (ix)
	ld	d,-16 (ix)
	pop	af
	ld	b,#0x08
00214$:
	add	hl, hl
	rl	e
	rl	d
	djnz	00214$
	ld	a,-7 (ix)
	add	a, l
	ld	c,a
	ld	a,-6 (ix)
	adc	a, h
	ld	b,a
	ld	a,-5 (ix)
	adc	a, e
	ld	e,a
	ld	a,-4 (ix)
	adc	a, d
	ld	d,a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl),c
	inc	hl
	ld	(hl),b
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
;kectrs64.c:493: A[2*i+1]+=(unsigned long) a2<<16; 
	push	af
	ld	a,-23 (ix)
	ld	-115 (ix),a
	ld	a,-22 (ix)
	ld	-114 (ix),a
	ld	a,-21 (ix)
	ld	-113 (ix),a
	ld	a,-20 (ix)
	ld	-112 (ix),a
	pop	af
	ld	a,#0x10
00216$:
	sla	-115 (ix)
	rl	-114 (ix)
	rl	-113 (ix)
	rl	-112 (ix)
	dec	a
	jr	NZ,00216$
	ld	a,c
	add	a, -115 (ix)
	ld	-115 (ix),a
	ld	a,b
	adc	a, -114 (ix)
	ld	-114 (ix),a
	ld	a,e
	adc	a, -113 (ix)
	ld	-113 (ix),a
	ld	a,d
	adc	a, -112 (ix)
	ld	-112 (ix),a
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:494: A[2*i+1]+=(unsigned long) a3<<24;
	push	af
	ld	a,-27 (ix)
	ld	-31 (ix),a
	ld	a,-26 (ix)
	ld	-30 (ix),a
	ld	a,-25 (ix)
	ld	-29 (ix),a
	ld	a,-24 (ix)
	ld	-28 (ix),a
	pop	af
	ld	b,#0x18
00218$:
	sla	-31 (ix)
	rl	-30 (ix)
	rl	-29 (ix)
	rl	-28 (ix)
	djnz	00218$
	ld	a,-115 (ix)
	add	a, -31 (ix)
	ld	-115 (ix),a
	ld	a,-114 (ix)
	adc	a, -30 (ix)
	ld	-114 (ix),a
	ld	a,-113 (ix)
	adc	a, -29 (ix)
	ld	-113 (ix),a
	ld	a,-112 (ix)
	adc	a, -28 (ix)
	ld	-112 (ix),a
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ld	bc, #0x0004
	ldir
00110$:
;kectrs64.c:496: if( 5==rq ){
	ld	a,-118 (ix)
	sub	a, #0x05
	jr	NZ,00112$
;kectrs64.c:497: A[2*i]= (unsigned long)   a3;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0062
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:498: A[2*i]+=(unsigned long)   a4<<8;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0046
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:499: A[2*i]+=(unsigned long)   a5<<16; 
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0042
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:500: A[2*i]+=(unsigned long)   a6<<24;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x003E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:501: A[2*i+1]= (unsigned long) a7;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x006E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:502: A[2*i+1]+=(unsigned long) a0<<8;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0052
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:503: A[2*i+1]+=(unsigned long) a1<<16; 
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x004E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:504: A[2*i+1]+=(unsigned long) a2<<24;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x004A
	add	hl, sp
	ld	bc, #0x0004
	ldir
00112$:
;kectrs64.c:506: if( 6==rq ){
	ld	a,-118 (ix)
	sub	a, #0x06
	jr	NZ,00114$
;kectrs64.c:507: A[2*i]= (unsigned long)   a2;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0066
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:508: A[2*i]+=(unsigned long)   a3<<8;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x002E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:509: A[2*i]+=(unsigned long)   a4<<16; 
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x002A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:510: A[2*i]+=(unsigned long)   a5<<24;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0026
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:511: A[2*i+1]= (unsigned long) a6;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0056
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:512: A[2*i+1]+=(unsigned long) a7<<8;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x003A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:513: A[2*i+1]+=(unsigned long) a0<<16; 
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0036
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:514: A[2*i+1]+=(unsigned long) a1<<24;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0032
	add	hl, sp
	ld	bc, #0x0004
	ldir
00114$:
;kectrs64.c:516: if( 7==rq ){
	ld	a,-118 (ix)
	sub	a, #0x07
	jr	NZ,00116$
;kectrs64.c:517: A[2*i]= (unsigned long)   a1;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x006A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:518: A[2*i]+=(unsigned long)   a2<<8;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0016
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:519: A[2*i]+=(unsigned long)   a3<<16; 
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x0012
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:520: A[2*i]+=(unsigned long)   a4<<24;
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	hl, #0x000E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:521: A[2*i+1]= (unsigned long) a5;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x005A
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:522: A[2*i+1]+=(unsigned long) a6<<8;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0022
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:523: A[2*i+1]+=(unsigned long) a7<<16; 
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x001E
	add	hl, sp
	ld	bc, #0x0004
	ldir
;kectrs64.c:524: A[2*i+1]+=(unsigned long) a0<<24;
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x001A
	add	hl, sp
	ld	bc, #0x0004
	ldir
00116$:
;kectrs64.c:527: if( 0!=rr ){
	ld	a,-117 (ix)
	or	a, a
	jr	Z,00119$
;kectrs64.c:528: rr=rot64( 2*i, rr );
	ld	h,-117 (ix)
	ld	l,-1 (ix)
	push	hl
	call	_rot64
	pop	af
00119$:
	ld	sp,ix
	pop	ix
	ret
_KRPStep1_end::
;kectrs64.c:532: void KRhoPiStep(){
;	---------------------------------
; Function KRhoPiStep
; ---------------------------------
_KRhoPiStep_start::
_KRhoPiStep:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-7
	add	hl,sp
	ld	sp,hl
;kectrs64.c:534: for( i=0; i<K_LANES; i++ ){
	ld	bc,#0x0000
00102$:
;kectrs64.c:535: KRPStep1( i );
	push	bc
	push	bc
	call	_KRPStep1
	pop	af
	pop	bc
;kectrs64.c:536: B[2*pB[i]]   = A[2*i];
	ld	hl,#_pB
	add	hl,bc
	ex	de,hl
	ld	a,(de)
	add	a, a
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	ld	a,#<(_B)
	add	a, l
	ld	-2 (ix),a
	ld	a,#>(_B)
	adc	a, h
	ld	-1 (ix),a
	ld	a,c
	add	a, a
	ld	-3 (ix), a
	ld	l, a
	ld	a,-3 (ix)
	rla
	sbc	a, a
	ld	h,a
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
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	hl, #0x0004
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	bc
	pop	de
;kectrs64.c:537: B[2*pB[i]+1] = A[2*i+1];
	ld	a,(de)
	add	a, a
	inc	a
	ld	l,a
	ld	h,#0x00
	add	hl, hl
	add	hl, hl
	ld	a,#<(_B)
	add	a, l
	ld	e,a
	ld	a,#>(_B)
	adc	a, h
	ld	d,a
	ld	a,-3 (ix)
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
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
;kectrs64.c:534: for( i=0; i<K_LANES; i++ ){
	inc	bc
	ld	a,c
	sub	a, #0x19
	ld	a,b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00102$
	ld	sp,ix
	pop	ix
	ret
_KRhoPiStep_end::
;kectrs64.c:541: void KKhiStep(){
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
;kectrs64.c:543: for( j=0; j<5; j++ ){
	ld	de,#0x0000
00102$:
;kectrs64.c:544: A[0+2*5*j] = B[0+2*5*j]^(B[4+2*5*j]&(4294967295-B[2+2*5*j]));
	ld	a,e
	ld	c,a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
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
	add	a, #0x04
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
	add	a, #0x02
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
;kectrs64.c:545: A[2+2*5*j] = B[2+2*5*j]^(B[6+2*5*j]&(4294967295-B[4+2*5*j]));
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
	add	a, #0x06
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
;kectrs64.c:546: A[4+2*5*j] = B[4+2*5*j]^(B[8+2*5*j]&(4294967295-B[6+2*5*j]));
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
	add	a, #0x08
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
;kectrs64.c:547: A[6+2*5*j] = B[6+2*5*j]^(B[0+2*5*j]&(4294967295-B[8+2*5*j]));
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
;kectrs64.c:548: A[8+2*5*j] = B[8+2*5*j]^(B[2+2*5*j]&(4294967295-B[0+2*5*j]));
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
;kectrs64.c:549: A[1+2*5*j] = B[1+2*5*j]^(B[5+2*5*j]&(4294967295-B[3+2*5*j]));
	ld	a,-1 (ix)
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_A
	add	hl,bc
	ex	(sp), hl
	ld	hl,#_B
	add	hl,bc
	ld	-29 (ix),l
	ld	-28 (ix),h
	push	de
	ld	e,-29 (ix)
	ld	d,-28 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
	add	a, #0x05
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	-21 (ix),l
	ld	-20 (ix),h
	ld	a,#<(_B)
	add	a, -21 (ix)
	ld	-19 (ix),a
	ld	a,#>(_B)
	adc	a, -20 (ix)
	ld	-18 (ix),a
	push	de
	ld	e,-19 (ix)
	ld	d,-18 (ix)
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
	ld	a,-25 (ix)
	xor	a, c
	ld	-25 (ix),a
	ld	a,-24 (ix)
	xor	a, b
	ld	-24 (ix),a
	ld	a,-23 (ix)
	xor	a, l
	ld	-23 (ix),a
	ld	a,-22 (ix)
	xor	a, h
	ld	-22 (ix),a
	push	de
	ld	e,-33 (ix)
	ld	d,-32 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ld	bc, #0x0004
	ldir
	pop	de
;kectrs64.c:550: A[3+2*5*j] = B[3+2*5*j]^(B[7+2*5*j]&(4294967295-B[5+2*5*j]));
	ld	iy,#_A
	ld	c,-13 (ix)
	ld	b,-12 (ix)
	add	iy, bc
	push	de
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
	add	a, #0x07
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	-25 (ix),l
	ld	-24 (ix),h
	ld	a,#<(_B)
	add	a, -25 (ix)
	ld	-17 (ix),a
	ld	a,#>(_B)
	adc	a, -24 (ix)
	ld	-16 (ix),a
	push	de
	ld	e,-17 (ix)
	ld	d,-16 (ix)
	ld	hl, #0x001A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-19 (ix)
	ld	h,-18 (ix)
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
	and	a, -9 (ix)
	ld	c,a
	ld	a,b
	and	a, -8 (ix)
	ld	b,a
	ld	a,l
	and	a, -7 (ix)
	ld	l,a
	ld	a,h
	and	a, -6 (ix)
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
;kectrs64.c:551: A[5+2*5*j] = B[5+2*5*j]^(B[9+2*5*j]&(4294967295-B[7+2*5*j]));
	ld	iy,#_A
	ld	c,-21 (ix)
	ld	b,-20 (ix)
	add	iy, bc
	push	de
	ld	e,-19 (ix)
	ld	d,-18 (ix)
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-1 (ix)
	add	a, #0x09
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	-21 (ix),l
	ld	-20 (ix),h
	ld	a,#<(_B)
	add	a, -21 (ix)
	ld	-19 (ix),a
	ld	a,#>(_B)
	adc	a, -20 (ix)
	ld	-18 (ix),a
	push	de
	ld	e,-19 (ix)
	ld	d,-18 (ix)
	ld	hl, #0x001A
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
	and	a, -9 (ix)
	ld	c,a
	ld	a,b
	and	a, -8 (ix)
	ld	b,a
	ld	a,l
	and	a, -7 (ix)
	ld	l,a
	ld	a,h
	and	a, -6 (ix)
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
;kectrs64.c:552: A[7+2*5*j] = B[7+2*5*j]^(B[1+2*5*j]&(4294967295-B[9+2*5*j]));
	ld	iy,#_A
	ld	c,-25 (ix)
	ld	b,-24 (ix)
	add	iy, bc
	push	de
	ld	e,-17 (ix)
	ld	d,-16 (ix)
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	e,-29 (ix)
	ld	d,-28 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-19 (ix)
	ld	h,-18 (ix)
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
;kectrs64.c:553: A[9+2*5*j] = B[9+2*5*j]^(B[3+2*5*j]&(4294967295-B[1+2*5*j]));
	ld	iy,#_A
	ld	c,-21 (ix)
	ld	b,-20 (ix)
	add	iy, bc
	push	de
	ld	e,-19 (ix)
	ld	d,-18 (ix)
	ld	hl, #0x0002
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	hl, #0x000A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	l,-29 (ix)
	ld	h,-28 (ix)
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
;kectrs64.c:543: for( j=0; j<5; j++ ){
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
;kectrs64.c:558: void KRounds(){
;	---------------------------------
; Function KRounds
; ---------------------------------
_KRounds_start::
_KRounds:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-17
	add	hl,sp
	ld	sp,hl
;kectrs64.c:561: for( j=0; j< K_ROUNDS; j++ ){
	ld	-13 (ix),#0x00
	ld	-12 (ix),#0x00
00113$:
;kectrs64.c:562: KThetaStep();
	call	_KThetaStep
;kectrs64.c:575: KRhoPiStep();
	call	_KRhoPiStep
;kectrs64.c:587: KKhiStep();
	call	_KKhiStep
;kectrs64.c:590: A[0] ^= RC[2*j];
	ld	de,#_A
	ld	hl, #0x000D
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	e,-13 (ix)
	ld	a,e
	add	a, a
	ld	-5 (ix), a
	ld	l, a
	ld	a,-5 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	bc,#_RC
	add	hl,bc
	push	de
	ex	de,hl
	ld	hl, #0x000A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-9 (ix)
	xor	a, -4 (ix)
	ld	-9 (ix),a
	ld	a,-8 (ix)
	xor	a, -3 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	xor	a, -2 (ix)
	ld	-7 (ix),a
	ld	a,-6 (ix)
	xor	a, -1 (ix)
	ld	-6 (ix),a
	push	de
	ld	de,#_A
	ld	hl, #0x000A
	add	hl, sp
	ld	bc, #0x0004
	ldir
	ld	de,#(_A + 0x0004)
	ld	hl, #0x000A
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-5 (ix)
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	bc,#_RC
	add	hl,bc
	push	de
	ex	de,hl
	ld	hl, #0x000F
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	pop	de
	ld	a,-9 (ix)
	xor	a, -4 (ix)
	ld	-9 (ix),a
	ld	a,-8 (ix)
	xor	a, -3 (ix)
	ld	-8 (ix),a
	ld	a,-7 (ix)
	xor	a, -2 (ix)
	ld	-7 (ix),a
	ld	a,-6 (ix)
	xor	a, -1 (ix)
	ld	-6 (ix),a
	push	de
	ld	de,#(_A + 0x0004)
	ld	hl, #0x000A
	add	hl, sp
	ld	bc, #0x0004
	ldir
	call	_print_title
	pop	de
;kectrs64.c:596: print_char(j+1);
	ld	h,e
	inc	h
	push	hl
	inc	sp
	call	_print_char
	inc	sp
;kectrs64.c:597: if( j==K_ROUNDS-1 ){
	ld	a,-13 (ix)
	sub	a, #0x17
	jp	NZ,00109$
	ld	a,-12 (ix)
	or	a, a
	jp	NZ,00109$
;kectrs64.c:599: for( i=0; i<K_LANES; i++ ){
	ld	-11 (ix),#0x00
	ld	-10 (ix),#0x00
00111$:
;kectrs64.c:600: if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
	ld	a,-10 (ix)
	or	a,-11 (ix)
	jr	Z,00101$
	ld	a,-11 (ix)
	sub	a, #0x05
	jr	NZ,00142$
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00101$
00142$:
	ld	a,-11 (ix)
	sub	a, #0x0A
	jr	NZ,00143$
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00101$
00143$:
	ld	a,-11 (ix)
	sub	a, #0x0F
	jr	NZ,00144$
	ld	a,-10 (ix)
	or	a, a
	jr	Z,00101$
00144$:
	ld	a,-11 (ix)
	sub	a, #0x14
	jr	NZ,00102$
	ld	a,-10 (ix)
	or	a, a
	jr	NZ,00102$
00101$:
	call	_print_crlf
00102$:
;kectrs64.c:601: u = A[2*i]; v = A[2*i+1];
	ld	a,-11 (ix)
	add	a, a
	ld	-9 (ix), a
	ld	l, a
	ld	a,-9 (ix)
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	de,#_A
	add	hl,de
	ex	de,hl
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	a,-9 (ix)
	inc	a
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	de,#_A
	add	hl,de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	inc	hl
	ld	a,(hl)
	dec	hl
	ld	l,(hl)
	ld	h,a
;kectrs64.c:602: print_short( (unsigned short) (u%65536) ); 
	ld	a,-17 (ix)
	ld	-9 (ix),a
	ld	a,-16 (ix)
	ld	-8 (ix),a
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	push	hl
	push	de
	push	bc
	call	_print_short
	pop	af
	pop	de
	pop	hl
;kectrs64.c:603: print_short( (unsigned short) (u>>16) );
	push	af
	ld	a,-17 (ix)
	ld	-9 (ix),a
	ld	a,-16 (ix)
	ld	-8 (ix),a
	ld	a,-15 (ix)
	ld	-7 (ix),a
	ld	a,-14 (ix)
	ld	-6 (ix),a
	pop	af
	ld	b,#0x10
00147$:
	srl	-6 (ix)
	rr	-7 (ix)
	rr	-8 (ix)
	rr	-9 (ix)
	djnz	00147$
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	push	hl
	push	de
	push	bc
	call	_print_short
	pop	af
	pop	de
	pop	hl
;kectrs64.c:604: print_short( (unsigned short) (v%65536) ); 
	ld	-9 (ix),e
	ld	-8 (ix),d
	ld	-7 (ix),#0x00
	ld	-6 (ix),#0x00
	ld	c,-9 (ix)
	ld	b,-8 (ix)
	push	hl
	push	de
	push	bc
	call	_print_short
	pop	af
	pop	de
	pop	hl
;kectrs64.c:605: print_short( (unsigned short) (v>>16) );
	ld	b,#0x10
00149$:
	srl	h
	rr	l
	rr	d
	rr	e
	djnz	00149$
	push	de
	call	_print_short
	pop	af
;kectrs64.c:599: for( i=0; i<K_LANES; i++ ){
	inc	-11 (ix)
	jr	NZ,00151$
	inc	-10 (ix)
00151$:
	ld	a,-11 (ix)
	sub	a, #0x19
	ld	a,-10 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00111$
00109$:
;kectrs64.c:608: print_crlf();
	call	_print_crlf
;kectrs64.c:561: for( j=0; j< K_ROUNDS; j++ ){
	inc	-13 (ix)
	jr	NZ,00152$
	inc	-12 (ix)
00152$:
	ld	a,-13 (ix)
	sub	a, #0x18
	ld	a,-12 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C,00113$
	ld	sp,ix
	pop	ix
	ret
_KRounds_end::
;kectrs64.c:642: void print_crlf(){
;	---------------------------------
; Function print_crlf
; ---------------------------------
_print_crlf_start::
_print_crlf:
;kectrs64.c:646: __endasm;
	ld a,#0x0d ; CR
	call 0x33 ; Print it
;kectrs64.c:647: return;
	ret
_print_crlf_end::
;kectrs64.c:651: void print_char(unsigned char c ){
;	---------------------------------
; Function print_char
; ---------------------------------
_print_char_start::
_print_char:
;kectrs64.c:652: if( c<10 ){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x0A
	jr	NC,00102$
;kectrs64.c:656: __endasm;
	ld a,#0x20
	call 0x33
00102$:
;kectrs64.c:658: if( c<100 ){
	ld	iy,#2
	add	iy,sp
	ld	a,0 (iy)
	sub	a, #0x64
	jr	NC,00104$
;kectrs64.c:662: __endasm;
	ld a,#0x20
	call 0x33
00104$:
;kectrs64.c:677: __endasm;
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
;kectrs64.c:678: return;
	ret
_print_char_end::
;kectrs64.c:681: void print_short(unsigned short c ){
;	---------------------------------
; Function print_short
; ---------------------------------
_print_short_start::
_print_short:
;kectrs64.c:696: __endasm;
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
;kectrs64.c:697: return;
	ret
_print_short_end::
;kectrs64.c:702: void print_title(){
;	---------------------------------
; Function print_title
; ---------------------------------
_print_title_start::
_print_title:
	ld	iy,#-7
	add	iy,sp
	ld	sp,iy
;kectrs64.c:703: char title[]="Round ";
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
;kectrs64.c:709: __endasm;
	ex de,hl
	ld a,#0
	ld (#0x409c),a
	call #0x28a7
;kectrs64.c:710: return;
	pop	af
	pop	af
	pop	af
	inc	sp
	ret
_print_title_end::
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
