/** An experimental implementation of elliptic curve25519 for the TRS80 Model I
 * \author jmc
 * \file ec25519.c
 * \version 1.0
 * \date 2013.8.18
 * \brief  curve25519 is an elliptic curve for fast Diffie-Hellman  -- [[http://cr.yp.to/papers.html#curve25519]]
 */

#define __OPTSPACE__
/* Define these in the sdcc command line, e.g. sdcc -D__TRS80__ */
/* #define __METRICS__ */
/* #define __TRS80__ 1 */

#ifdef __METRICS__
#include <stdio.h>
#endif

#define __MIN(x,y) ((x)<(y)?(x):(y))
#define __DIGITS   32

#define lda(r)     ldr(a,(r))
#define ldb(r)     ldr(b,(r))
#define ldt(t,r)   ldr((t),(r));(t)[32]=0
#define mult(t,x,y)  lda((x));ldb((y));modmul();ldr((t),t33)
#define square(t,x)  lda((x));ldb((x));modmul();ldr((t),t33)

/* Elliptic curves point coordinates global variables */
unsigned char xn[32];
unsigned char zn[32];
unsigned char xm[32];
unsigned char zm[32];
/* Elliptic curves local variables in addition and doubling formulas */
unsigned char tx2[33], tz2[33], txz[33];
/* Internal 32B "registers" used by modular multipliation */
unsigned char t33[33];
unsigned char a[32];
unsigned char b[32];
unsigned char c[64];
/* Internal 32B "registers" used by modular inversion */
unsigned char z9[32];
unsigned char z11[32];
unsigned char z2_5_0[32];
unsigned char z2_10_0[32];
unsigned char z2_20_0[32];
unsigned char z2_50_0[32];
unsigned char z2_100_0[32];

/* Constants */
unsigned char P32[32];  /* = {237, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 127}; */
unsigned char A32[32];  /* = {6, 109, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; */
/* This instance form Bernstein's "Cryptography in NaCl" paper */
unsigned char sk[32]; /* = { 0x77,0x07,0x6d,0x0a,0x73,0x18,0xa5,0x7d, */
		     /* 	 0x3c,0x16,0xc1,0x72,0x51,0xb2,0x66,0x45, */
		     /* 	 0xdf,0x4c,0x2f,0x87,0xeb,0xc0,0x99,0x2a, */
		     /* 	 0xb1,0x77,0xfb,0xa5,0x1d,0xb9,0x2c,0x2a }; */


#ifdef __METRICS__
unsigned long mcycles = 0L;
unsigned long macycles = 0L;
unsigned long maddcycles = 0L;
unsigned long msubcycles = 0L;
#endif

void modmul();
void modadd( unsigned char *v );
void modsub( unsigned char *u, unsigned char *v );
void ldr( unsigned char *d, unsigned char *r );
void ecc_double( unsigned char *u, unsigned char *v );
void ecc_add( unsigned char *x_n, unsigned char *z_n,
	      unsigned char *x_m, unsigned char *z_m,
	      unsigned char *x_d, unsigned char *z_d );
void ecc_seqsmult( unsigned char *key );
void recip(unsigned char *out, unsigned char *z);

#ifdef __TRS80__
/* TRS 80 specifics */

/** String buffer for TRS 80 display */
unsigned char sbuf[25]; 

void print_crlf();
void print_cls();
void print_sbuf();
void print_char(unsigned char c );
void print_gfx(unsigned char c );
#endif

void main(){
  unsigned char i;
#ifdef __TRS80__
  /* TRS 80 specifics */
  i=0;
  sbuf[i++]=67;
  sbuf[i++]= 117;
  sbuf[i++]= 114;
  sbuf[i++]= 118;
  sbuf[i++]= 101;
  sbuf[i++]= 50;
  sbuf[i++]= 53;
  sbuf[i++]= 53;
  sbuf[i++]= 49;
  sbuf[i++]= 57;
  sbuf[i++]= 32;
  sbuf[i++]= 83;
  sbuf[i++]= 99;
  sbuf[i++]= 97;
  sbuf[i++]= 108;
  sbuf[i++]= 97;
  sbuf[i++]= 114;
  sbuf[i++]= 32;
  sbuf[i++]= 77;
  sbuf[i++]= 117;
  sbuf[i++]= 108;
  sbuf[i++]= 116;
  sbuf[i++]= 46;
  sbuf[i++]= 32;
  sbuf[i++]=0;
  __asm
        push    hl
        push    de
        call	0x1c9		; CLS
	ld     hl,#15415
	ld     a,#140
	ld     (hl),a
	pop    de
        pop    hl
  __endasm;
  print_sbuf( );
#endif
  /* Constants A=486662 and P=2^255-19 */
  for( i=0; i<32; i++ ){
    A32[i]=0; P32[i]=255;
  }
  P32[0]=237; P32[31]=127;
  A32[0]=6; A32[1]=109; A32[2]=7;

  /* Secret key */
  i = 0;
  sk[i++]=0x77;
  sk[i++]=0x07;
  sk[i++]=0x6d;
  sk[i++]=0x0a;
  sk[i++]=0x73;
  sk[i++]=0x18;
  sk[i++]=0xa5;
  sk[i++]=0x7d;

  sk[i++]=0x3c;
  sk[i++]=0x16;
  sk[i++]=0xc1;
  sk[i++]=0x72;
  sk[i++]=0x51;
  sk[i++]=0xb2;
  sk[i++]=0x66;
  sk[i++]=0x45;

  sk[i++]=0xdf;
  sk[i++]=0x4c;
  sk[i++]=0x2f;
  sk[i++]=0x87;
  sk[i++]=0xeb;
  sk[i++]=0xc0;
  sk[i++]=0x99;
  sk[i++]=0x2a;

  sk[i++]=0xb1;
  sk[i++]=0x77;
  sk[i++]=0xfb;
  sk[i++]=0xa5;
  sk[i++]=0x1d;
  sk[i++]=0xb9;
  sk[i++]=0x2c;
  sk[i++]=0x2a;

  sk[0]  &= 248;
  sk[31] &= 127;
  sk[31] |= 64;

  ecc_seqsmult( sk );
#ifdef __TRS80__
  i = 0;
  sbuf[i++]=77;
  sbuf[i++]= 79;
  sbuf[i++]= 68;
  sbuf[i++]= 85;
  sbuf[i++]= 76;
  sbuf[i++]= 65;
  sbuf[i++]= 82;
  sbuf[i++]= 32;
  sbuf[i++]= 73;
  sbuf[i++]= 78;
  sbuf[i++]= 86;
  sbuf[i++]= 69;
  sbuf[i++]= 82;
  sbuf[i++]= 83;
  sbuf[i++]= 73;
  sbuf[i++]= 79;
  sbuf[i++]= 78;
  sbuf[i++]= 32;
  sbuf[i++]= 79;
  sbuf[i++]= 70;
  sbuf[i++]= 32;
  sbuf[i++]= 90;
  sbuf[i++]= 32;
  sbuf[i++]= 32;
  sbuf[i++]= 0;
  print_sbuf( );
  print_crlf();
#endif
#ifdef __METRICS__
  printf( "              \tMMUL\tMADD\tMSUB\tMULADD\n" );
  printf( "\ECCTRS: smult\t%ld\t%ld\t%ld\t%ld\n", 
	  mcycles, maddcycles, msubcycles, macycles );
#endif
  recip( zn, zm );
  mult( xn, zn, xm );
#ifdef __METRICS__
  printf( "\ECCTRS: recip\t%ld\t%ld\t%ld\t%ld\n", 
	  mcycles, maddcycles, msubcycles, macycles );
#endif

#ifdef __TRS80__
  i = 0;
  sbuf[i++]='P';
  sbuf[i++]='u';
  sbuf[i++]='b';
  sbuf[i++]='l';
  sbuf[i++]='i';
  sbuf[i++]='c';
  sbuf[i++]=' ';
  sbuf[i++]='K';
  sbuf[i++]='e';
  sbuf[i++]='y';
  sbuf[i++]=':';
  sbuf[i++]=0;
  print_sbuf( );
  /* Display public key */
  for( i=0; i<32; i++ ){
    if( 0==i%8 ) print_crlf();
    print_char( xn[i] );
  }
  /* Jump back to BASIC */
  __asm
    ld		a,#0x0d		; CR
    call	0x33		; Print it
    ld		hl,#0x6cc	; BASIC command line
    jp		(hl)
  __endasm;
#endif
}

#ifdef __TRS80__
/* TRS 80 functions and utilities */

/** Output a line feed. */
void print_crlf(){
  __asm
    ld		a,#0x0d		; CR
    call	0x33		; Print it
  __endasm;
  return;
}

/** Output a garphics character. */
void print_gfx( unsigned char gc ){
  gc;
  __asm
    ld          iy,#2
    add         iy,sp           ; first arg is at sp+2
    ld          a,0(iy)         ; arg c in hl
    call	0x33		; Print it
  __endasm;
  return;
}

/** Clear screen. */
void print_cls(){
  __asm
    call	0x1c9		; CLS
  __endasm;
  return;
}


/** Convert byte arg to ASCII string, print it and print space. */
void print_char(unsigned char c ){
  c;
  __asm
    ld          iy,#2
    add         iy,sp           ; first arg is at sp+2
    ld          l,0(iy)         ; arg c in hl
    ld          h,#0
    call	#0x0a9a		; move HL to ACC
    ld		hl,#_sbuf + 0	; buffer for ASCII conversion
    call	#0x0fbd		; ACC to ASCII string
    xor		a
    ld		(#0x409c),a	; video=0
    call	#0x28a7		; print string at cursor
    ld		a,#0x20		; space=0x20h
    call	0x33		; print it
  __endasm;
  return;
}

void print_sbuf(){
  __asm
    ld		hl,#_sbuf + 0	; buffer for ASCII message
    xor		a
    ld		(#0x409c),a	; video=0
    call	#0x28a7		; print string at cursor
    ret
  __endasm;
  sbuf;
}
#endif

/** Compares 32B u and v, returning -1, 1, or 0. Max 15974 T */
char cmp32( unsigned char *u, unsigned char *v ){
  unsigned char i, j;
  for( j=0; j<32; j++ ){
    i = 31-j;
    if( u[i]<v[i] ) return -1;
    if( u[i]>v[i] ) return  1;
  }
  return 0;
}

/** Condition u>v : 32B u = 32B u - 32B v. 

HAC Algorithm 14.9
*/
void asm_sub3232_32( unsigned char *u, unsigned char *v ){
  __asm
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	push	hl
	push	de
	ld	e,4(ix)
	ld	d,5(ix)
	ld	l,6(ix)
	ld	h,7(ix)
        ld	b,#32
	or	a
00001$:	ld	a,(de)
	sbc	a,(hl)
	ld	(de),a
	inc	hl
	inc	de
	djnz	00001$
	pop	de
	pop	hl
        pop     af
	ld	sp,ix
	pop	ix
	ret
  __endasm;
  u; v;
}

/** Adds 1B k to 32B u returning 33B t. Max 10157 T */
void add0132_33( unsigned char *t, unsigned char k, unsigned char *u ){
  unsigned int carry;
  unsigned char i;
  carry = 0;
  for( i=0; i<32; i++ ){
    if( 0==i ){ carry += k; }
    carry += u[i];
    t[i]  = (carry%256);
    carry >>= 8;
  }
  /* Note: overwriting last byte. Here last carry should be 0. */
  t[32] = (unsigned char)carry;
  return;
}

/** Adds 2B k to 32B u returning 33B t.  Max 14189 T*/
void add0232_33( unsigned char *t, unsigned int k, unsigned char *u ){
  unsigned int carry;
  unsigned char i;
  carry = 0;
  for( i=0; i<32; i++ ){
    if( 0==i ){ carry += (k%256); }
    if( 1==i ){ carry += ((k>>8)%256); }
    carry += u[i];
    t[i]  = (carry%256);
    carry >>= 8;
  }
  /* Note: overwriting last byte. */
  t[32] = (unsigned char)carry;
  return;
}

/** Accumulates 32B u into 33B t. 10876 T */
void add3332_33( unsigned char *t, unsigned char *u ){
  unsigned int carry;
  unsigned char i;
  carry = 0;
  for( i=0; i<32; i++ ){
    carry += t[i]+u[i];
    t[i]  = (carry%256);
    carry >>= 8;
  }
  t[32] += (unsigned char)carry;
  return;
}


/** Multiply 32B u by 4 returning 33B t. 11292 T */
void mul4_33( unsigned char *t, unsigned char *u ){
  unsigned int carry;
  unsigned char i;
  carry = 0;
  for( i=0; i<32; i++ ){
    carry += (unsigned int)4*u[i];
    t[i] = (carry%256);
    carry >>= 8;
  }
  t[32]=(unsigned char)carry;
  return;
}

/** Multiply 32B u by 38 returning 33B t. 11292 T */
void mul38_33( unsigned char *t, unsigned char *u ){
  unsigned int carry;
  unsigned char i;
  carry = 0;

  for( i=0; i<32; i++ ){
    carry += 38*u[i]; /* sdcc optimizes to x>>5+x>>2+x>>1 */

    t[i] = (carry%256);
    carry >>= 8;
  }
  t[32]=(unsigned char)carry;
  return;
}

/** Reduces 33B t modulo Q=2P=2^256-38 returning reduced t. */
void reduce25519( unsigned char *t ){

  unsigned int  t2;
  unsigned int  t1;
  /* Second pass t2 = msb 8b * 38 */
  t2 = (unsigned int)38*t[32];
  /* t33 = msb 8b (t33) * 38 + lsb 256b (t33) */
  add0232_33( t, t2, t );
  if( 0!= t[32] ){
    /* Conditional third pass */
    t1 = (unsigned int)38*t[32];
    /* Should not carry to 32th byte: needs assertions. */
    /* add0132_33( t, t1, t ); */
    add0232_33( t, t1, t );
  }
  /* Check for P32 < t33 < 2^256 */
  if( 1==cmp32( t, P32 ) ){
    asm_sub3232_32( t, P32 );
  }
  return;
}

/** Reduces 64B (c) modulo P32=2^255-19 into 32B + 1B t33. Est. 52331 T */
void mod25519(){
  /* t33 = msb 256b (c) * 38 */
  mul38_33( t33, c+32 );
  /* t33 += lsb 256b (c) */
  add3332_33( t33, c );
  reduce25519( t33 );
  return;
}

/** \brief Multiply two bytes and add 16b result to 32b long.

Based on the MLEBYE subroutine in William Barden Jr.'s book, pp. 112 et sq.
Maximum of 657 T-cycles (57 assembly lines).

\param u multiplicand
\param v multiplicand
\param w current value of long accumulator
\return long value cumulated with product of multiplicands
*/
long muladd( unsigned long w, unsigned char u, unsigned char v ){
#ifdef __METRICS__
  macycles++;
#endif
  __asm
	push	ix
	ld	ix,#0
	add	ix,sp
	push	bc
        ld	l,9(ix)
	ld	h,8(ix)
	ld	c,l
	ld	b,#0
	ld	l,b
	add	hl,hl
	jr	NC,00001$
	add	hl,bc
00001$:
	add	hl,hl
	jr	NC,00002$
	add	hl,bc
00002$:
	add	hl,hl
	jr	NC,00003$
	add	hl,bc
00003$:
	add	hl,hl
	jr	NC,00004$
	add	hl,bc
00004$:
	add	hl,hl
	jr	NC,00005$
	add	hl,bc
00005$:
	add	hl,hl
	jr	NC,00006$
	add	hl,bc
00006$:
	add	hl,hl
	jr	NC,00007$
	add	hl,bc
00007$:
	add	hl,hl
	jr	NC,00008$
	add	hl,bc
00008$:        
        pop	bc
	ld	de,#0x0000
	ld	a,4 (ix)
	add	a, l
	ld	l,a
	ld	a,5 (ix)
	adc	a, h
	ld	h,a
	ld	a,6 (ix)
	adc	a, e
	ld	e,a
	ld	a,7 (ix)
	adc	a, d
	ld	d,a
	ld	sp,ix
	pop	ix
	ret
  __endasm;
    u; v; return w;
}


/* 32B by 32B Comba multiplication. */
void comba_32(){
  unsigned long w;
  unsigned char ix, iy, tx, ty, iz;
  unsigned int c0, c1, c2;
  c1 = 0; c2 = 0; c0 = 0;
  for( ix=0; ix<63; ix++ ){
    w = 0L;
    ty = __MIN(__DIGITS-1,ix);
    tx = ix-ty;
    iy = __MIN(__DIGITS-tx,ty+1);
    for( iz=0; iz<iy; iz++ ){
      /* w += (unsigned long)a[tx+iz]*b[ty-iz]; */
      w = muladd( w, a[tx+iz], b[ty-iz] );
    }
    /* Handle the 3 bytes carry */
    c0 += (w%256);
    c1 += ((w>>8)%256);
    c2 += ((w>>16)%256);
    if( c0>=256 ){
      c1 += (c0>>8);
      c0  = (c0%256);
    }
    if( c1>=256 ){
      c2 += (c1>>8);
      c1  = (c1%256);
    }
    /* Issue if c2>=256 not checked here! */
    /* Assign and propagate */
    c[ix] = c0;
    c0 = c1; c1 = c2; c2 = 0;
  }
  c[63]=c0;
  return;
}

/** Modular multiplication 32B a * 32B b = 32B t33 */
void modmul(){
#ifdef __METRICS__
  mcycles++;
#endif
  comba_32();
  mod25519();
}

/* Elliptic curve25519 section. */

/** Fills 32B d with 32B r to init modular multiplication */
void ldr( unsigned char *d, unsigned char *r ){
  unsigned char i;
  for( i=0; i<32; i++ ) d[i]=r[i];
}

/** Modular addition 32B t33 * 32B v = 32B t33. */
void modadd(  unsigned char *v ){
#ifdef __METRICS__
  maddcycles++;
#endif
  add3332_33( t33, v );
  reduce25519( t33 );
  return;
}

/** Modular subtraction abs(32B u - 32B v) = 32B t33. 

Note that both args u, v are < P, and that we are interested only in the
abs value of the difference as we'll square it immediately after.
*/
void modsub( unsigned char *u, unsigned char *v ){
#ifdef __METRICS__
  msubcycles++;
#endif
  if( 1==cmp32( u, v ) ){
    ldr( t33, u );
    asm_sub3232_32( t33, v );
  }
  else{
    ldr( t33, v );
    asm_sub3232_32( t33, u );
  }
  return;
}


/** Elliptic curve doubling in XZ coordinates for Montgomery curves.

    See also: [[http://www.hyperelliptic.org/EFD/g1p/auto-montgom-xz.html]]
 */
void ecc_double( unsigned char *x, unsigned char *z ){
  /* Calculations are mod P */
  /* tx2 = x^2, tz2 = z^2  */
  lda( z ); ldb( z ); modmul(); ldr( tz2, t33 );
  lda( x ); ldb( x ); modmul(); ldr( tx2, t33 ); 
  /* txz = tx*tz */
  lda( x ); ldb( z ); modmul(); ldt( txz, t33 );
  /* xn = (x^2-z^2)^2 */
  modsub( tz2, tx2 );
  lda( t33 ); ldb( t33 ); modmul(); 
  /* Won't need x */
  ldr( x, t33 ); 

  /* t33 = A*x*z */
  lda( txz ); ldb( A32 ); modmul();
  /* t33 += x^2 + z^2 */
  t33[32]=0; modadd( tx2 ); modadd( tz2 );
  /* t33 *= x*z */
  lda( t33 ); ldb( txz ); modmul();
  /* t33 *= 4 */
  mul4_33( t33, t33 );
  reduce25519( t33 );
  /* Results are in xn and zn */
  ldr(z,t33);
}

/** Elliptic curve addition in XZ coordinates for Montgomery curves.

    See also: [[http://www.hyperelliptic.org/EFD/g1p/auto-montgom-xz.html]]
 */
void ecc_add( unsigned char *x_n, unsigned char *z_n,
	      unsigned char *x_m, unsigned char *z_m,
	      unsigned char *x_d, unsigned char *z_d ){
  /* (xm*xn-zm*zn)^2 */
  lda( x_m ); ldb( x_n ); modmul(); ldr( tx2, t33 );
  lda( z_m ); ldb( z_n ); modmul(); ldr( tz2, t33 );
  modsub( tx2, tz2 );
  lda( t33 ); ldb( t33 ); modmul(); 
  /* 4*zd*(xm*xn-zm*zn)^2 and save intermediate in txz */
  lda( t33 ); ldb( z_d ); modmul();
  mul4_33( t33, t33 );
  reduce25519( t33 );
  ldr( txz, t33 );

  /* (xm*zn-zm*xn)^2 */
  lda( x_m ); ldb( z_n ); modmul(); ldr( tx2, t33 );
  lda( z_m ); ldb( x_n ); modmul(); ldr( tz2, t33 );
  modsub( tx2, tz2 );
  lda( t33 ); ldb( t33 ); modmul(); 
  /* 4*xd*(xm*xn-zm*zn)^2  */
  lda( t33 ); ldb( x_d ); modmul();
  mul4_33( t33, t33 );
  reduce25519( t33 );
  
  ldr( x_n, txz ); ldr( z_n, t33 );
}

/** Scalar multiplication on elliptic curve. Sequential implementation. */
void ecc_seqsmult( unsigned char *key ){
  char i, j;
  unsigned char k, val;
  unsigned char base[32] = {9};
  unsigned char one[32] = {1};
  /* n=m+1 */
  ldr( xm, base ); ldr( zm, one );
  ldr( xn, base ); ldr( zn, one );
  ecc_double( xn, zn );
#ifdef __TRS80__
  print_gfx( 140 );
#endif
  /* Loop on LTR binary representation of k. */
  for( j=31; 0==key[j]; j-- )
    ;
  /* First non 0 byte from left */
  k = key[j];
  for( i=7; 0==( (k>>i)&1 ); i-- )
    ;
  for( --i; i>=0; i-- ){
    val = (k>>i)&1;
    if( 1==val ){
      ecc_add( xm, zm, xn, zn, base, one );
      ecc_double( xn, zn );
    }
    else{
      ecc_add( xn, zn, xm, zm, base, one );
      ecc_double( xm, zm );
    }
  }
  /* Rest of key LTR bytes */
  for( --j; j>=0; j-- ){
#ifdef __TRS80__
    print_gfx( 140 );
#endif
    k = key[j];
    for( i=7; i>=0; i-- ){
#ifdef __TRS80__
      if( 1==(i%2) ){
	print_gfx( 8 );
	print_gfx( 128 );
      }
      else{
	print_gfx( 8 );
	print_gfx( 140 );
      }
#endif
      val = (k>>i)&1;
      if( 1==val ){
	ecc_add( xm, zm, xn, zn, base, one );
	ecc_double( xn, zn );
      }
      else{
	ecc_add( xn, zn, xm, zm, base, one );
	ecc_double( xm, zm );
      }
    }
  }
#ifdef __TRS80__
  print_crlf();
#endif
}

/** Inverse by Fermat exponentiation.

Directly pasted from NaCl scalar multiplication "ref" implementation.
*/
void recip(unsigned char *out, unsigned char *z)
{
/* 32B registers for modular inverse */
  /* unsigned char t0[32]; */
  /* unsigned char t1[32]; */
  unsigned char *t0, *t1, *z2;
  char i;
  
  t0 = tx2; t1 = tz2; z2 = txz;
  /* 2 */ square(z2,z);
  /* 4 */ square(t1,z2);
  /* 8 */ square(t0,t1);
  /* 9 */ mult(z9,t0,z);
  /* 11 */ mult(z11,z9,z2);
  /* 22 */ square(t0,z11);
  /* 2^5 - 2^0 = 31 */ mult(z2_5_0,t0,z9);
  /* 2^6 - 2^1 */ square(t0,z2_5_0);
  /* 2^7 - 2^2 */ square(t1,t0);
  /* 2^8 - 2^3 */ square(t0,t1);
  /* 2^9 - 2^4 */ square(t1,t0);
  /* 2^10 - 2^5 */ square(t0,t1);
  /* 2^10 - 2^0 */ mult(z2_10_0,t0,z2_5_0);
  /* 2^11 - 2^1 */ square(t0,z2_10_0);
  /* 2^12 - 2^2 */ square(t1,t0);
  /* 2^20 - 2^10 */ for (i = 2;i < 10;i += 2) { square(t0,t1); square(t1,t0); }
  /* 2^20 - 2^0 */ mult(z2_20_0,t1,z2_10_0);
  /* 2^21 - 2^1 */ square(t0,z2_20_0);
  /* 2^22 - 2^2 */ square(t1,t0);
  /* 2^40 - 2^20 */ for (i = 2;i < 20;i += 2) { square(t0,t1); square(t1,t0); }
  /* 2^40 - 2^0 */ mult(t0,t1,z2_20_0); // 45 iterations
  /* 2^41 - 2^1 */ square(t1,t0);
  /* 2^42 - 2^2 */ square(t0,t1);
  /* 2^50 - 2^10 */ for (i = 2;i < 10;i += 2) { square(t1,t0); square(t0,t1); }
  /* 2^50 - 2^0 */ mult(z2_50_0,t0,z2_10_0); // 56
  /* 2^51 - 2^1 */ square(t0,z2_50_0);
  /* 2^52 - 2^2 */ square(t1,t0);
  /* 2^100 - 2^50 */ for (i = 2;i < 50;i += 2) { square(t0,t1); square(t1,t0); }
  /* 2^100 - 2^0 */ mult(z2_100_0,t1,z2_50_0); // 107
  /* 2^101 - 2^1 */ square(t1,z2_100_0);
  /* 2^102 - 2^2 */ square(t0,t1); // 109
  /* 2^200 - 2^100 */ for (i = 2;i < 100;i += 2) { square(t1,t0); square(t0,t1); }
  /* 2^200 - 2^0 */ mult(t1,t0,z2_100_0); // 208
  /* 2^201 - 2^1 */ square(t0,t1);
  /* 2^202 - 2^2 */ square(t1,t0);
  /* 2^250 - 2^50 */ for (i = 2;i < 50;i += 2) { square(t0,t1); square(t1,t0); }
  /* 2^250 - 2^0 */ mult(t0,t1,z2_50_0); // 259
  /* 2^251 - 2^1 */ square(t1,t0);
  /* 2^252 - 2^2 */ square(t0,t1);
  /* 2^253 - 2^3 */ square(t1,t0);
  /* 2^254 - 2^4 */ square(t0,t1);
  /* 2^255 - 2^5 */ square(t1,t0);
  /* 2^255 - 21 */ mult(out,t1,z11);
}
