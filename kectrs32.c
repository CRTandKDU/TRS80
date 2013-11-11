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
// Lane size in bytes: 1, 2, 4 or 8. In this implementation: 4
#define K_LANESIZE 4
// Number of rounds 12+2log(K_LANESIZE*8). In this implementation 22.
#define K_ROUNDS   22

// State is 5*5 lane size long.
unsigned long A[K_LANES*K_LANESIZE];

unsigned long C[5];
unsigned long D[5];
unsigned long B[K_LANES*K_LANESIZE];
unsigned char pB[K_LANES]; //= { 0, 10, 20, 5, 15, 16, 1, 11, 21, 6, 7, 17, 2, 12, 22, 23, 8, 18, 3, 13, 14, 24, 9, 19, 4 };
// Rotation matrix r is modulo the lane size in bits. 
unsigned char r[K_LANES];
/*   = { */
/*     0%32, 1%32, 62%32, 28%32, 27%32, */
/*     36%32, 44%32, 6%32, 55%32, 20%32, */
/*     3%32, 10%32, 43%32, 25%32, 39%32, */
/*     41%32, 45%32, 15%32, 21%32, 8%32, */
/*     18%32, 2%32, 61%32, 56%32, 14%32, */
/* }; */
// Constants are truncated to lane size. In this implementation, 8b (RC&0xff).
unsigned long RC[24]; 
/* = { 0x0000000000000001&0xFFFFFFFF, */
			   /* 0x0000000000008082&0xFFFFFFFF, */
			   /* 0x800000000000808A&0xFFFFFFFF, */
			   /* 0x8000000080008000&0xFFFFFFFF, */
			   /* 0x000000000000808B&0xFFFFFFFF, */
			   /* 0x0000000080000001&0xFFFFFFFF, */
			   /* 0x8000000080008081&0xFFFFFFFF, */
			   /* 0x8000000000008009&0xFFFFFFFF, */
			   /* 0x000000000000008A&0xFFFFFFFF, */
			   /* 0x0000000000000088&0xFFFFFFFF, */
			   /* 0x0000000080008009&0xFFFFFFFF, */
			   /* 0x000000008000000A&0xFFFFFFFF, */
			   /* 0x000000008000808B&0xFFFFFFFF, */
			   /* 0x800000000000008B&0xFFFFFFFF, */
			   /* 0x8000000000008089&0xFFFFFFFF, */
			   /* 0x8000000000008003&0xFFFFFFFF, */
			   /* 0x8000000000008002&0xFFFFFFFF, */
			   /* 0x8000000000000080&0xFFFFFFFF, */
			   /* 0x000000000000800A&0xFFFFFFFF, */
			   /* 0x800000008000000A&0xFFFFFFFF, */
			   /* 0x8000000080008081&0xFFFFFFFF, */
			   /* 0x8000000000008080&0xFFFFFFFF, */
			   /* 0x0000000080000001&0xFFFFFFFF, */
			   /* 0x8000000080008008&0xFFFFFFFF}; */

#ifdef __TRS80__
/** String buffer for TRS 80 display */
unsigned char buf[8];
void print_crlf();
void print_char(unsigned char c );
void print_short(unsigned short c );
void print_str( unsigned char *s );
#endif
void KRotTest();
void KThetaStep();
void KRhoPiStep();
void KKhiStep();
void KRounds();

void main(){
  short i;
  RC[0]=1;
  RC[1]=32898;
  RC[2]=32906;
  RC[3]=2147516416;
  RC[4]=32907;
  RC[5]=2147483649;
  RC[6]=2147516545;
  RC[7]=32777;
  RC[8]=138;
  RC[9]=136;
  RC[10]=2147516425;
  RC[11]=2147483658;
  RC[12]=2147516555;
  RC[13]=139;
  RC[14]=32905;
  RC[15]=32771;
  RC[16]=32770;
  RC[17]=128;
  RC[18]=32778;
  RC[19]=2147483658;
  RC[20]=2147516545;
  RC[21]=32896;
  RC[22]=2147483649;
  RC[23]=2147516424;

  r[0]=0;
  r[1]=1;
  r[2]=30;
  r[3]=28;
  r[4]=27;
  r[5]=4;
  r[6]=12;
  r[7]=6;
  r[8]=23;
  r[9]=20;
  r[10]=3;
  r[11]=10;
  r[12]=11;
  r[13]=25;
  r[14]=7;
  r[15]=9;
  r[16]=13;
  r[17]=15;
  r[18]=21;
  r[19]=8;
  r[20]=18;
  r[21]=2;
  r[22]=29;
  r[23]=24;
  r[24]=14;

  pB[0]=0;
  pB[1]=10;
  pB[2]=20;
  pB[3]=5;
  pB[4]=15;
  pB[5]=16;
  pB[6]=1;
  pB[7]=11;
  pB[8]=21;
  pB[9]=6;
  pB[10]=7;
  pB[11]=17;
  pB[12]=2;
  pB[13]=12;
  pB[14]=22;
  pB[15]=23;
  pB[16]=8;
  pB[17]=18;
  pB[18]=3;
  pB[19]=13;
  pB[20]=14;
  pB[21]=24;
  pB[22]=9;
  pB[23]=19;
  pB[24]=4;

  // Set up and display state
  for( i=0; i<K_LANES; i++ ) A[i] = 0;
  A[0]=123456L; A[1]=234567L; A[2]=345678L; A[3]=456789L; A[4]=567890L;
#ifdef __TRS80__
  /* Display resulting state */
  for( i=0; i<K_LANES; i++ ){
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
    print_short( (unsigned short)(A[i]%65536) ); 
    print_short( (unsigned short) (A[i]>>16) );
  }
  print_crlf();
#else
  printf( "Size of lane: %d\n", sizeof( unsigned long ) );
  for( i=0; i<K_LANES; i++ ){
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n");
    printf( "(%5u, %5u) ", (unsigned int) (A[i]%65536), (unsigned int) (A[i]>>16) );
  }
  printf("\n");
#endif

  KRounds();

#ifdef __TRS80__
  /* Display resulting state */
  /* for( i=0; i<K_LANES; i++ ){ */
  /*   if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf(); */
  /*   print_short( A[i] ); */
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
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n");
    printf( "(%5u, %5u) ", (unsigned int) (A[i]%65536), (unsigned int) (A[i]>>16) );
  }
#endif
}


/* unsigned char rot( unsigned char x, unsigned char n ){ */
/*   x; n; */
/*   __asm */
/* 	ld	d,#0x00 */
/* 00001$: */
/* 	ld	hl,#3 */
/* 	add	hl,sp */
/* 	ld	a,d */
/* 	sub	a, (hl) */
/* 	jr	NC,00002$ */
/* 	push	de */
/* 	ld	iy,#4 */
/* 	add	iy,sp */
/* 	push	iy */
/* 	pop	de */
/* 	ld	a,(de) */
/* 	rlca */
/* 	ld	(de),a */
/* 	pop	de */
/* 	inc	d */
/* 	jr	00001$ */
/* 00002$: */
/* 	nop */
/* __endasm; */
/* 	  return x; */
/* } */

/* /\** Left rotate a 16b unsigned by n bits, with 0<n<8 */
/*  *\/ */
/* unsigned short rot16( unsigned short x, unsigned char n ){ */
/*   n; */
/*   __asm */
/*     push ix */
/*     ld ix,#0x0 */
/*     add ix,sp */
/*     ld d,#0x00 */
/* 00001$: */
/*     ld a,d */
/*       sub a, 6(ix) */
/*       jr NC,00002$ */
/*       ld a,5(ix) */
/*       rlca */
/*       ld a,4(ix) */
/*       rla */
/*       ld 4(ix),a */
/*       ld a,5(ix) */
/*       rla */
/*       ld 5(ix),a */
/*       inc d */
/*       jr 00001$ */
/* 00002$: */
/*   pop ix */
/*     __endasm; */
/*   return x; */
/* } */

/** Left rotate a 32b unsigned by n bits, with 0<n<8
 */
unsigned long rot32( unsigned long x, unsigned char n ){
  n;
  __asm
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
    __endasm;
  return x;
}

void KThetaStep(){
  short i, j;
  for( i=0; i<5; i++ ){
    C[i]=(unsigned long) A[i]^A[i+5]^A[i+10]^A[i+15]^A[i+20];
  }
  /* D[0] = C[4]^rot(C[1],1); */
  /* D[1] = C[0]^rot(C[2],1); */
  /* D[2] = C[1]^rot(C[3],1); */
  /* D[3] = C[2]^rot(C[4],1); */
  /* D[4] = C[3]^rot(C[0],1); */
__asm
  push de
  push ix
  ;; D[0]
  ld ix,#(_D+0)			; Offset 4*i
  ld hl,#(_C+16)		; Offset 4*i
  ld de,#(_C+7)			; Offset 4i+3
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
  ld ix,#(_D+4)			; Offset 4*i
  ld hl,#(_C+0)		; Offset 4*i
  ld de,#(_C+11)			; Offset 4i+3
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
  ld ix,#(_D+8)		; Offset 4*i
  ld hl,#(_C+4)		; Offset 4*i
  ld de,#(_C+15)	; Offset 4i+3
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
  ld ix,#(_D+12)	; Offset 4*i
  ld hl,#(_C+8)		; Offset 4*i
  ld de,#(_C+19)	; Offset 4i+3
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
  ld ix,#(_D+16)	; Offset 4*i
  ld hl,#(_C+12)	; Offset 4*i
  ld de,#(_C+3)	; Offset 4i+3
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
  __endasm;
  for( i=0; i<5; i++ )
    for( j=0; j<5; j++ ){
      A[i+j*5] = A[i+j*5]^D[i];
    }

}

void KRPStep1(short i){
  unsigned char rr, rq;
  unsigned char a0, a1, a2, a3;

  if( 0==r[i] ) return;

  rr = (unsigned char)(r[i]%8);
  rq = (unsigned char)(r[i]>>3);
  a0 = (unsigned char)(A[i]&0xff);
  a1 = (unsigned char)((A[i]>>8)&0xff);
  a2 = (unsigned char)((A[i]>>16)&0xff);
  a3 = (unsigned char)((A[i]>>24)&0xff);
  if( 1==rq ){
    A[i]= (unsigned long) a3;
    A[i]+=(unsigned long) a0<<8;
    A[i]+=(unsigned long) a1<<16; 
    A[i]+=(unsigned long) a2<<24;
  }
  if( 2==rq ){
    A[i]= (unsigned long) a2;
    A[i]+=(unsigned long) a3<<8;
    A[i]+=(unsigned long) a0<<16; 
    A[i]+=(unsigned long) a1<<24;
  }
  if( 3==rq ){
    A[i]= (unsigned long) a1;
    A[i]+=(unsigned long) a2<<8;
    A[i]+=(unsigned long) a3<<16; 
    A[i]+=(unsigned long) a0<<24;
  }
  if( 0!=rr ){
    A[i]=rot32( A[i], rr );
  }
}

void KRhoPiStep(){
  short i;
  for( i=0; i<K_LANES; i++ ){
    KRPStep1( i );
    B[pB[i]] = A[i];
  }
}

void KKhiStep(){
  short j;
  for( j=0; j<5; j++ ){
    A[0+5*j] = B[0+5*j]^(B[2+5*j]&(4294967295-B[1+5*j]));
    A[1+5*j] = B[1+5*j]^(B[3+5*j]&(4294967295-B[2+5*j]));
    A[2+5*j] = B[2+5*j]^(B[4+5*j]&(4294967295-B[3+5*j]));
    A[3+5*j] = B[3+5*j]^(B[0+5*j]&(4294967295-B[4+5*j]));
    A[4+5*j] = B[4+5*j]^(B[1+5*j]&(4294967295-B[0+5*j]));
  }
}


void KRounds(){
  short i, j;
#ifdef __TRS80__
  char title[]="Round ";
#endif
  for( j=0; j< K_ROUNDS; j++ ){
    KThetaStep();
    
    /* printf("Round, Theta: %d\n",j+1); */
    /* for( i=0; i<K_LANES; i++ ){ */
    /*   if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n"); */
    /*   printf( "(%5u, %5u) ", (unsigned int) (A[i]%65536), (unsigned int) (A[i]>>16) ); */
    /* } */
    /* printf("\n===\n"); */
    KRhoPiStep();
    
    /* printf("Round, RhoPi B : %d\n",j+1); */
    /* for( i=0; i<K_LANES; i++ ){ */
    /*   if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n"); */
    /*   printf( "(%5u, %5u) ", (unsigned int) (B[i]%65536), (unsigned int) (B[i]>>16) ); */
    /* } */
    /* printf("\n===\n"); */
    KKhiStep();
    
    // iota step
    A[0] ^= RC[j];
#ifdef __TRS80__
    /* for( i=0; i<5; i++ ){ print_short( C[i] ); }; print_crlf(); */
    /* for( i=0; i<5; i++ ){ print_short( D[i] ); }; print_crlf(); */
    print_str( title ); 
    print_char(j+1);
    /* Display resulting state */
    for( i=0; i<K_LANES; i++ ){
      if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
      print_short( (unsigned short)( A[i]%65536 ) );
      print_short( (unsigned short)( A[i]>>16 ) );
    }
    print_crlf();
#else
    printf("Round: %d\n",j+1);
    /* for( i=0; i<5; i++ ) printf( "(%5u, %5u) ",  */
    /* 				 (unsigned int)(C[i]%65536),  */
    /* 				 (unsigned int)(C[i]>>16) );  */
    /* printf("\n"); */
    /* for( i=0; i<5; i++ ) printf( "(%5u, %5u) ",  */
    /* 				 (unsigned int)(D[i]%65536),  */
    /* 				 (unsigned int)(D[i]>>16) );  */
    /* printf("\n"); */
    for( i=0; i<K_LANES; i++ ){
      if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n");
      printf( "(%5u, %5u) ", (unsigned int) (A[i]%65536), (unsigned int) (A[i]>>16) );
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

void print_short(unsigned short c ){
  c;
  __asm
	ld      iy,#0x02
	add     iy,sp           ; first arg is at sp+2
	ld      l,0(iy)         ; arg c in hl
	ld      h,1(iy)
	call	#0x0a9a		; move HL to ACC
	ld	hl,#_buf + 0	; buffer for ASCII conversion
	call	#0x0fbd		; ACC to ASCII string
	xor	a,a
	ld	(#0x409c),a	; video=0
	call	#0x28a7		; print string at cursor
	ld	a,#0x20		; space=0x20h
	call	0x33		; print it
  __endasm;
  return;
}


/** Print string at cursor. */
void print_str( unsigned char *s ){
  s;
__asm
  ld iy,#0x02
  add iy,sp
  ld l,0(iy)
  ld h,1(iy)
  xor a,a
  ld (#0x409c),a
  call #0x28a7
  __endasm;
  return;
}
#endif
