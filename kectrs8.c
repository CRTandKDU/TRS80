/** An experimental implementation of Keccak for the TRS80 Model I
 * \author jmc
 * \file kectrs.c
 * \version 1.0
 * \date 2013.10.15
 * \brief  Keccak is a family of hash functions.
 * [[http://keccak.noekeon.org/specs_summary.html]]
 */
#ifndef __TRS_80__
#include <stdio.h>
#endif

// Number of lanes in Keccak
#define K_LANES    25
// Lane size in bytes: 1, 2, 4 or 8. In this implementation: 1
#define K_LANESIZE 1
// Number of rounds 12+2log(K_LANESIZE*8). In this implementation 18.
#define K_ROUNDS   18

// State is 5*5 lane size long.
unsigned char A[K_LANES*K_LANESIZE];

unsigned char C[5];
unsigned char D[5];
unsigned char B[K_LANES*K_LANESIZE];

#ifdef __TRS80__
/** String buffer for TRS 80 display */
unsigned char buf[8];
void print_crlf();
void print_char(unsigned char c );
void print_title();
#endif
void KRotTest();
void KThetaStep();
void KRhoPiStep();
void KKhiStep();
void KRounds();

void main(){
  short i;
  // Set up and display state
  for( i=0; i<K_LANES; i++ ) A[i] = 0;
  A[0]=128; A[1]=2; A[2]=3; A[3]=64; A[4]=255;
#ifdef __TRS80__
  /* Display resulting state */
  for( i=0; i<K_LANES; i++ ){
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
    print_char( A[i] );
  }
  print_crlf();
#else
  for( i=0; i<K_LANES; i++ ){
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n");
    printf( "%3d ", A[i] );
  }
  printf("\n");
#endif

  KRounds();

#ifdef __TRS80__
  /* Display resulting state */
  /* for( i=0; i<K_LANES; i++ ){ */
  /*   if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf(); */
  /*   print_char( A[i] ); */
  /* } */
  /* Jump back to BASIC */
  __asm
    ld		a,#0x0d		; CR
    call	0x33		; Print it
    ld		hl,#0x6cc	; BASIC command line
    jp		(hl)
  __endasm;
#else
  /* Display resulting state */
  for( i=0; i<K_LANES; i++ ){
    if( 0==i%5 ) printf("\n");
    printf("%d ", A[i]);
  }
#endif
}

unsigned char rot( unsigned char x, unsigned char n ){
  x; n;
  __asm
	ld	d,#0x00
00001$:
	ld	hl,#3
	add	hl,sp
	ld	a,d
	sub	a, (hl)
	jr	NC,00002$
	push	de
	ld	iy,#4
	add	iy,sp
	push	iy
	pop	de
	ld	a,(de)
	rlca
	ld	(de),a
	pop	de
	inc	d
	jr	00001$
00002$:
	nop
__endasm;
	  return x;
}


void KThetaStep(){
  short i, j;
  for( i=0; i<5; i++ ){
    C[i]=A[i]^A[i+5]^A[i+10]^A[i+15]^A[i+20];
  }
  /* D[0] = C[4]^rot(C[1],1); */
  /* D[1] = C[0]^rot(C[2],1); */
  /* D[2] = C[1]^rot(C[3],1); */
  /* D[3] = C[2]^rot(C[4],1); */
  /* D[4] = C[3]^rot(C[0],1); */
__asm
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
  __endasm;
  for( i=0; i<5; i++ )
    for( j=0; j<5; j++ ){
      A[i+j*5] = A[i+j*5]^D[i];
    }

}

void KRhoPiStep(){
  short i;
// Rotation matrix r is modulo the lane size in bits. In this implementation: mod 8.
  unsigned char pB[K_LANES] = {
    0, 10, 20, 5, 15, 16, 1, 11, 21, 6, 7, 17, 2, 12, 22, 23, 8, 18, 3, 13, 14, 24, 9, 19, 4
  };
  unsigned char r[K_LANES]  = {
    0%8, 1%8, 62%8, 28%8, 27%8,
    36%8, 44%8, 6%8, 55%8, 20%8,
    3%8, 10%8, 43%8, 25%8, 39%8,
    41%8, 45%8, 15%8, 21%8, 8%8,
    18%8, 2%8, 61%8, 56%8, 14%8
    /* 0, 1, 6, 4, 3, */
    /* 4, 4, 6, 7, 4, */
    /* 3, 2, 3, 1, 7, */
    /* 1, 5, 7, 5, 0, */
    /* 2, 2, 5, 0, 6 */
  };

  for( i=0; i<K_LANES; i++ ){
    if( 0==r[i] ){
      B[pB[i]] = A[i];
    }
    else{
      B[pB[i]] = rot( A[i], r[i] );
    }
  }
}

void KKhiStep(){
  short j;
  for( j=0; j<5; j++ ){
    A[0+5*j] = B[0+5*j]^(B[2+5*j]&(255-B[1+5*j]));
    A[1+5*j] = B[1+5*j]^(B[3+5*j]&(255-B[2+5*j]));
    A[2+5*j] = B[2+5*j]^(B[4+5*j]&(255-B[3+5*j]));
    A[3+5*j] = B[3+5*j]^(B[0+5*j]&(255-B[4+5*j]));
    A[4+5*j] = B[4+5*j]^(B[1+5*j]&(255-B[0+5*j]));
  }
}


void KRounds(){
  short i, j;
// Constants are truncated to lane size. In this implementation, 8b (RC&0xff).
  unsigned char RC[24] = { 0x0000000000000001&0xFF,
			   0x0000000000008082&0xFF,
			   0x800000000000808A&0xFF,
			   0x8000000080008000&0xFF,
			   0x000000000000808B&0xFF,
			   0x0000000080000001&0xFF,
			   0x8000000080008081&0xFF,
			   0x8000000000008009&0xFF,
			   0x000000000000008A&0xFF,
			   0x0000000000000088&0xFF,
			   0x0000000080008009&0xFF,
			   0x000000008000000A&0xFF,
			   0x000000008000808B&0xFF,
			   0x800000000000008B&0xFF,
			   0x8000000000008089&0xFF,
			   0x8000000000008003&0xFF,
			   0x8000000000008002&0xFF,
			   0x8000000000000080&0xFF,
			   0x000000000000800A&0xFF,
			   0x800000008000000A&0xFF,
			   0x8000000080008081&0xFF,
			   0x8000000000008080&0xFF,
			   0x0000000080000001&0xFF,
			   0x8000000080008008&0xFF};
  for( j=0; j< K_ROUNDS; j++ ){
    KThetaStep();
    /* printf("Round, Theta: %d\n",j+1); */
    /* for( i=0; i<K_LANES; i++ ){ */
    /*   if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n"); */
    /*   printf( "%3d ", A[i] ); */
    /* } */
    /* printf("\n===\n"); */
    KRhoPiStep();
    /* printf("Round, RhoPi B : %d\n",j+1); */
    /* for( i=0; i<K_LANES; i++ ){ */
    /*   if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n"); */
    /*   printf( "%3d ", B[i] ); */
    /* } */
    /* printf("\n===\n"); */
    KKhiStep();
    // iota step
    A[0] ^= RC[j];
#ifdef __TRS80__
    /* for( i=0; i<5; i++ ){ print_char( C[i] ); }; print_crlf(); */
    /* for( i=0; i<5; i++ ){ print_char( D[i] ); }; print_crlf(); */
    print_title(); print_char(j+1);
    /* Display resulting state */
    for( i=0; i<K_LANES; i++ ){
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
    print_char( A[i] );
  }
    print_crlf();
#else
    printf("Round: %d\n",j+1);
    /* for( i=0; i<5; i++ ) printf("%3d ",C[i]); printf("\n"); */
    /* for( i=0; i<5; i++ ) printf("%3d ",D[i]); printf("\n"); */
    for( i=0; i<K_LANES; i++ ){
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n");
    printf( "%3d ", A[i] );
    }
    printf("\n===\n");
#endif
  }
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
  if( c<10 ){
__asm
    ld		a,#0x20		
    call	0x33		
  __endasm;
  }
  if( c<100 ){
__asm
    ld		a,#0x20		
    call	0x33		
  __endasm;
  }
  __asm
    ld          iy,#0x02
    add         iy,sp           ; first arg is at sp+2
    ld          l,0(iy)         ; arg c in hl
    ld          h,#0
    call	#0x0a9a		; move HL to ACC
    ld		hl,#_buf + 0	; buffer for ASCII conversion
    call	#0x0fbd		; ACC to ASCII string
    xor		a,a
    ld		(#0x409c),a	; video=0
    call	#0x28a7		; print string at cursor
    ld		a,#0x20		; space=0x20h
    call	0x33		; print it
  __endasm;
  return;
}

/** Print string at cursor. */
void print_title(){
  char title[]="Round ";
__asm
  ex de,hl
  ld a,#0
  ld (#0x409c),a
  call #0x28a7
  __endasm;
  return;
}
#endif
