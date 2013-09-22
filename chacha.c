/** An experimental implementation of Chacha for the TRS80 Model I
 * \author jmc
 * \file chacha.c
 * \version 1.0
 * \date 2013.8.11
 * \brief  ChaCha is a stream cipher -- [[http://cr.yp.to/chacha/chacha-20080128.pdf]]
 */

/** Optimize for space by rolling in rounds. */
#define __OPTSPACE__
/* #define __TRS80__ */

/** The state is 64 bytes long.

With initial state:
<table>
<tr><td>constant</td><td>constant</td><td>constant</td><td>constant</td></tr>
<tr><td>key</td><td>key</td><td>key</td><td>key</td></tr>
<tr><td>key</td><td>key</td><td>key</td><td>key</td></tr>
<tr><td>input</td><td>input</td><td>input</td><td>input</td></tr>
</table>
*/ 
unsigned char x[64];
/** Intermediate calculations */
unsigned char t_a, t_b;

#ifdef __TRS80__
/** String buffer for TRS 80 display */
unsigned char buf[8];
void print_crlf();
void print_char(unsigned char c );
#endif

void PLUS4( unsigned char i, unsigned char j );

#ifdef __OPTSPACE__
void qr( unsigned char a,
	 unsigned char b,
	 unsigned char c,
	 unsigned char d );
#endif

#define SR4(u)  (unsigned char)((u)>>4)
#define SL4(u)  (unsigned char)((u)<<4)
#define SR1(u)  (unsigned char)((u)>>1)
#define SL7(u)  (unsigned char)((u)<<7)
#define xor(u,v)       ((u)^(v))

#define XOR4(i,j) \
  x[4*i]  =xor(x[4*i],x[4*j]);\
  x[4*i+1]=xor(x[4*i+1],x[4*j+1]);\
  x[4*i+2]=xor(x[4*i+2],x[4*j+2]);\
  x[4*i+3]=xor(x[4*i+3],x[4*j+3]);

#define ROT8(i)      t_a=x[4*i+3];x[4*i+3]=x[4*i+2];x[4*i+2]=x[4*i+1];x[4*i+1]=x[4*i];x[4*i]=t_a;

#define ROT16(i)     t_a=x[4*i+2];t_b=x[4*i+3];x[4*i+2]=x[4*i];x[4*i+3]=x[4*i+1];x[4*i]=t_a;x[4*i+1]=t_b;

#define ROT4(i) \
  t_a     = SR4(x[4*i+3]);\
  x[4*i+3]=(SL4(x[4*i+3]))|(SR4(x[4*i+2]));	\
  x[4*i+2]=(SL4(x[4*i+2]))|(SR4(x[4*i+1]));	\
  x[4*i+1]=(SL4(x[4*i+1]))|(SR4(x[4*i])); \
  x[4*i]  =(SL4(x[4*i]))  |(t_a);

#define ROT7(i) \
  t_a     = SR1(x[4*i+3]);\
  x[4*i+3]=(SL7(x[4*i+3]))|(SR1(x[4*i+2]));	\
  x[4*i+2]=(SL7(x[4*i+2]))|(SR1(x[4*i+1]));	\
  x[4*i+1]=(SL7(x[4*i+1]))|(SR1(x[4*i])); \
  x[4*i]  =(SL7(x[4*i]))  |(t_a);

#define ROT12(i)     ROT4(i);ROT8(i);

#define QUARTERROUND(a,b,c,d)  \
  PLUS4(a,b); XOR4(d,a); ROT16(d); \
  PLUS4(c,d); XOR4(b,c); ROT12(b); \
  PLUS4(a,b); XOR4(d,a); ROT8(d);  \
  PLUS4(c,d); XOR4(b,c); ROT7(b);


void main(){
  unsigned char i;
  /* Zero state */
  for( i=0; i<64; i++ ) x[i]=0;
  /* Fills in constants */
  i=0;
  x[i++]='e';
  x[i++]='x';
  x[i++]='p';
  x[i++]='a';
  x[i++]='n';
  x[i++]='d';
  x[i++]=' ';
  x[i++]='3';
  x[i++]='2';
  x[i++]='-';
  x[i++]='b';
  x[i++]='y';
  x[i++]='t';
  x[i++]='e';
  x[i++]=' ';
  x[i++]='k';
  /* Nonce */
  i=48;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;
  x[i++]=0;

  /* 4 rounds of 8 quarter-rounds */
  for( i=0; i<8; i+=2 ){
#ifdef __OPTSPACE__
    qr( 0, 4, 8,12);
    qr( 1, 5, 9,13);
    qr( 2, 6,10,14);
    qr( 3, 7,11,15);
    qr( 0, 5,10,15);
    qr( 1, 6,11,12);
    qr( 2, 7, 8,13);
    qr( 3, 4, 9,14);
#else
    /* Unroll loop */
    QUARTERROUND( 0, 4, 8,12);
    QUARTERROUND( 1, 5, 9,13);
    QUARTERROUND( 2, 6,10,14);
    QUARTERROUND( 3, 7,11,15);
    QUARTERROUND( 0, 5,10,15);
    QUARTERROUND( 1, 6,11,12);
    QUARTERROUND( 2, 7, 8,13);
    QUARTERROUND( 3, 4, 9,14);
#endif
  }

#ifdef __TRS80__
  /* Display resulting state */
  for( i=0; i<64; i++ ){
    if( 0==i%8 ) print_crlf();
    print_char( x[i] );
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
/** Output a line feed. */
void print_crlf(){
  __asm
    ld		a,#0x0d		; CR
    call	0x33		; Print it
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
    ld		hl,#_buf + 0	; buffer for ASCII conversion
    call	#0x0fbd		; ACC to ASCII string
    xor		a
    ld		(#0x409c),a	; video=0
    call	#0x28a7		; print string at cursor
    ld		a,#0x20		; space=0x20h
    call	0x33		; print it
  __endasm;
  return;
}
#endif

/** Add two 4b integers at index i and j in state mod 2^32, result in first arg. */
void PLUS4( unsigned char i, unsigned char j ){
  unsigned int carry = 0;
  unsigned char k;
  for( k=0; k<4; k++ ){
    carry += x[4*i+k]+x[4*j+k];
    x[4*i+k]=carry%256;
    carry>>=8;
  }
}

#ifdef __OPTSPACE__
void qr( unsigned char a,
	 unsigned char b,
	 unsigned char c,
	 unsigned char d ){
  QUARTERROUND(a,b,c,d);
}
#endif
