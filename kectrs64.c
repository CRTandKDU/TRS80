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
// Lane size in bytes: 1, 2, 4 or 8. In this implementation: 8 as 2*4B
#define K_LANESIZE 4
// Number of rounds 12+2log(K_LANESIZE*8). In this implementation 24.
#define K_ROUNDS   24

// State is 5*5 lane size long.
unsigned long A[2*K_LANES*K_LANESIZE];
unsigned long C[2*5];
unsigned long D[2*5];
unsigned long B[2*K_LANES*K_LANESIZE];
unsigned char pB[K_LANES]; 
//= { 0, 10, 20, 5, 15, 16, 1, 11, 21, 6, 7, 17, 2, 12, 22, 23, 8, 18, 3, 13, 14, 24, 9, 19, 4 };
// Rotation matrix r is modulo the lane size in bits. 
unsigned char r[K_LANES];
/*   = { */
/*     0, 1, 62, 28, 27, */
/*     36, 44, 6, 55, 20, */
/*     3, 10, 43, 25, 39, */
/*     41, 45, 15, 21, 8, */
/*     18, 2, 61, 56, 14, */
/* }; */
// Constants are truncated to lane size. In this implementation, 8b (RC&0xff).
unsigned long RC[2*24]; 

#ifdef __TRS80__
/** String buffer for TRS 80 display */
unsigned char buf[8];
void print_crlf();
void print_char(unsigned char c );
void print_short(unsigned short c );
void print_title();
#endif
void KRotTest();
void KThetaStep();
void KRhoPiStep();
void KKhiStep();
void KRounds();

void main(){
  short i;
  unsigned long  u, v;
  // iota constant
  RC[0]=1;
  RC[1]=0;
  RC[2]=32898;
  RC[3]=0;
  RC[4]=32906;
  RC[5]=2147483648;
  RC[6]=2147516416;
  RC[7]=2147483648;
  RC[8]=32907;
  RC[9]=0;
  RC[10]=2147483649;
  RC[11]=0;
  RC[12]=2147516545;
  RC[13]=2147483648;
  RC[14]=32777;
  RC[15]=2147483648;
  RC[16]=138;
  RC[17]=0;
  RC[18]=136;
  RC[19]=0;
  RC[20]=2147516425;
  RC[21]=0;
  RC[22]=2147483658;
  RC[23]=0;
  RC[24]=2147516555;
  RC[25]=0;
  RC[26]=139;
  RC[27]=2147483648;
  RC[28]=32905;
  RC[29]=2147483648;
  RC[30]=32771;
  RC[31]=2147483648;
  RC[32]=32770;
  RC[33]=2147483648;
  RC[34]=128;
  RC[35]=2147483648;
  RC[36]=32778;
  RC[37]=0;
  RC[38]=2147483658;
  RC[39]=2147483648;
  RC[40]=2147516545;
  RC[41]=2147483648;
  RC[42]=32896;
  RC[43]=2147483648;
  RC[44]=2147483649;
  RC[45]=0;
  RC[46]=2147516424;
  RC[47]=2147483648;
  // rho pi constants
  r[0]=0;
  r[1]=1;
  r[2]=62;
  r[3]=28;
  r[4]=27;
  r[5]=36;
  r[6]=44;
  r[7]=6;
  r[8]=55;
  r[9]=20;
  r[10]=3;
  r[11]=10;
  r[12]=43;
  r[13]=25;
  r[14]=39;
  r[15]=41;
  r[16]=45;
  r[17]=15;
  r[18]=21;
  r[19]=8;
  r[20]=18;
  r[21]=2;
  r[22]=61;
  r[23]=56;
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
  for( i=0; i<K_LANES; i++ ) { A[2*i] = 0; A[2*i+1] = 0; }
  A[0]=123456L; A[2]=234567L; A[4]=345678L; A[6]=456789L; A[8]=567890L;
#ifdef __TRS80__
  /* Display resulting state */
  for( i=0; i<K_LANES; i++ ){
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
    u = A[2*i]; v = A[2*i+1];
    print_short( (unsigned short) (u%65536) ); 
    print_short( (unsigned short) (u>>16) );
    print_short( (unsigned short) (v%65536) ); 
    print_short( (unsigned short) (v>>16) );
  }
  print_crlf();
#else
  printf( "Size of lane: %d\n", 2*sizeof( unsigned long ) );
  for( i=0; i<K_LANES; i++ ){
    if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n");
    u = A[2*i]; v = A[2*i+1];
    printf( "(%5u, %5u, %5u %5u) ", 
	    (unsigned int) (u%65536), (unsigned int) (u>>16),
	    (unsigned int) (v%65536), (unsigned int) (v>>16)
	    );
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
    u = A[2*i]; v = A[2*i+1];
    printf( "(%5u, %5u, %5u %5u) ", 
	    (unsigned int) (u%65536), (unsigned int) (u>>16),
	    (unsigned int) (v%65536), (unsigned int) (v>>16)
	    );
  }
#endif
}

/** Rotate left n bits A[k] in-place
 */
unsigned char  rot64( unsigned char k, unsigned char n ){
  __asm
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
    __endasm;
	return n;
	k;
}

void KThetaStep(){
  short i, j;
  for( i=0; i<5; i++ ){
    C[2*i]=(unsigned long) A[2*i]^A[2*i+2*5]^A[2*i+2*10]^A[2*i+2*15]^A[2*i+2*20];
    C[2*i+1]=(unsigned long) A[2*i+1]^A[2*i+2*5+1]^A[2*i+2*10+1]^A[2*i+2*15+1]^A[2*i+2*20+1];
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
  ld ix,#(_D+0)			; Offset 0
  ld hl,#(_C+32)		; Offset 8*i
  ld de,#(_C+15)		; Offset 8i+7
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
  __endasm;
  for( i=0; i<5; i++ )
    for( j=0; j<5; j++ ){
      A[2*i+j*10] = A[2*i+j*10]^D[2*i];
      A[2*i+1+j*10] = A[2*i+1+j*10]^D[2*i+1];
    }

}

void KRPStep1(short i){
  unsigned char rr, rq;
  unsigned char a0, a1, a2, a3, a4, a5, a6, a7;

  if( 0==r[i] ) return;

  rr = (unsigned char)(r[i]%8); // 0 <= rr <= 7
  rq = (unsigned char)(r[i]>>3);// 0 <= rq <= 7
  a0 = (unsigned char)(A[2*i]&0xff);
  a1 = (unsigned char)((A[2*i]>>8)&0xff);
  a2 = (unsigned char)((A[2*i]>>16)&0xff);
  a3 = (unsigned char)((A[2*i]>>24)&0xff);
  a4 = (unsigned char)(A[2*i+1]&0xff);
  a5 = (unsigned char)((A[2*i+1]>>8)&0xff);
  a6 = (unsigned char)((A[2*i+1]>>16)&0xff);
  a7 = (unsigned char)((A[2*i+1]>>24)&0xff);
  if( 1==rq ){
    A[2*i]= (unsigned long) a7;
    A[2*i]+=(unsigned long) a0<<8;
    A[2*i]+=(unsigned long) a1<<16; 
    A[2*i]+=(unsigned long) a2<<24;
    A[2*i+1]= (unsigned long) a3;
    A[2*i+1]+=(unsigned long) a4<<8;
    A[2*i+1]+=(unsigned long) a5<<16; 
    A[2*i+1]+=(unsigned long) a6<<24;
  }
  if( 2==rq ){
    A[2*i]= (unsigned long)   a6;
    A[2*i]+=(unsigned long)   a7<<8;
    A[2*i]+=(unsigned long)   a0<<16; 
    A[2*i]+=(unsigned long)   a1<<24;
    A[2*i+1]= (unsigned long) a2;
    A[2*i+1]+=(unsigned long) a3<<8;
    A[2*i+1]+=(unsigned long) a4<<16; 
    A[2*i+1]+=(unsigned long) a5<<24;
  }
  if( 3==rq ){
    A[2*i]= (unsigned long)   a5;
    A[2*i]+=(unsigned long)   a6<<8;
    A[2*i]+=(unsigned long)   a7<<16; 
    A[2*i]+=(unsigned long)   a0<<24;
    A[2*i+1]= (unsigned long) a1;
    A[2*i+1]+=(unsigned long) a2<<8;
    A[2*i+1]+=(unsigned long) a3<<16; 
    A[2*i+1]+=(unsigned long) a4<<24;
  }
  if( 4==rq ){
    A[2*i]= (unsigned long)   a4;
    A[2*i]+=(unsigned long)   a5<<8;
    A[2*i]+=(unsigned long)   a6<<16; 
    A[2*i]+=(unsigned long)   a7<<24;
    A[2*i+1]= (unsigned long) a0;
    A[2*i+1]+=(unsigned long) a1<<8;
    A[2*i+1]+=(unsigned long) a2<<16; 
    A[2*i+1]+=(unsigned long) a3<<24;
  }
  if( 5==rq ){
    A[2*i]= (unsigned long)   a3;
    A[2*i]+=(unsigned long)   a4<<8;
    A[2*i]+=(unsigned long)   a5<<16; 
    A[2*i]+=(unsigned long)   a6<<24;
    A[2*i+1]= (unsigned long) a7;
    A[2*i+1]+=(unsigned long) a0<<8;
    A[2*i+1]+=(unsigned long) a1<<16; 
    A[2*i+1]+=(unsigned long) a2<<24;
  }
  if( 6==rq ){
    A[2*i]= (unsigned long)   a2;
    A[2*i]+=(unsigned long)   a3<<8;
    A[2*i]+=(unsigned long)   a4<<16; 
    A[2*i]+=(unsigned long)   a5<<24;
    A[2*i+1]= (unsigned long) a6;
    A[2*i+1]+=(unsigned long) a7<<8;
    A[2*i+1]+=(unsigned long) a0<<16; 
    A[2*i+1]+=(unsigned long) a1<<24;
  }
  if( 7==rq ){
    A[2*i]= (unsigned long)   a1;
    A[2*i]+=(unsigned long)   a2<<8;
    A[2*i]+=(unsigned long)   a3<<16; 
    A[2*i]+=(unsigned long)   a4<<24;
    A[2*i+1]= (unsigned long) a5;
    A[2*i+1]+=(unsigned long) a6<<8;
    A[2*i+1]+=(unsigned long) a7<<16; 
    A[2*i+1]+=(unsigned long) a0<<24;
  }

  if( 0!=rr ){
    rr=rot64( 2*i, rr );
  }
}

void KRhoPiStep(){
  short i;
  for( i=0; i<K_LANES; i++ ){
    KRPStep1( i );
    B[2*pB[i]]   = A[2*i];
    B[2*pB[i]+1] = A[2*i+1];
  }
}

void KKhiStep(){
  short j;
  for( j=0; j<5; j++ ){
    A[0+2*5*j] = B[0+2*5*j]^(B[4+2*5*j]&(4294967295-B[2+2*5*j]));
    A[2+2*5*j] = B[2+2*5*j]^(B[6+2*5*j]&(4294967295-B[4+2*5*j]));
    A[4+2*5*j] = B[4+2*5*j]^(B[8+2*5*j]&(4294967295-B[6+2*5*j]));
    A[6+2*5*j] = B[6+2*5*j]^(B[0+2*5*j]&(4294967295-B[8+2*5*j]));
    A[8+2*5*j] = B[8+2*5*j]^(B[2+2*5*j]&(4294967295-B[0+2*5*j]));
    A[1+2*5*j] = B[1+2*5*j]^(B[5+2*5*j]&(4294967295-B[3+2*5*j]));
    A[3+2*5*j] = B[3+2*5*j]^(B[7+2*5*j]&(4294967295-B[5+2*5*j]));
    A[5+2*5*j] = B[5+2*5*j]^(B[9+2*5*j]&(4294967295-B[7+2*5*j]));
    A[7+2*5*j] = B[7+2*5*j]^(B[1+2*5*j]&(4294967295-B[9+2*5*j]));
    A[9+2*5*j] = B[9+2*5*j]^(B[3+2*5*j]&(4294967295-B[1+2*5*j]));
  }
}


void KRounds(){
  short i, j;
  unsigned long u, v;
  for( j=0; j< K_ROUNDS; j++ ){
    KThetaStep();
    
    /* printf("Round, Theta: %d\n",j+1); */
    /* for( i=0; i<K_LANES; i++ ){ */
    /*   if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n"); */
    /*   u = A[2*i]; v = A[2*i+1]; */
    /*   printf( "(%5u, %5u, %5u %5u) ",  */
    /* 	      (unsigned int) (u%65536), (unsigned int) (u>>16), */
    /* 	      (unsigned int) (v%65536), (unsigned int) (v>>16) */
    /* 	      ); */

    /* } */
    /* printf("\n===\n"); */
    KRhoPiStep();
    
    /* printf("Round, RhoPi B : %d\n",j+1); */
    /* for( i=0; i<K_LANES; i++ ){ */
    /*   if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n"); */
    /*   u = B[2*i]; v = B[2*i+1]; */
    /*   printf( "(%5u, %5u, %5u %5u) ",  */
    /* 	      (unsigned int) (u%65536), (unsigned int) (u>>16), */
    /* 	      (unsigned int) (v%65536), (unsigned int) (v>>16) */
    /* 	      ); */
    /* } */
    /* printf("\n===\n"); */
    KKhiStep();
    
    // iota step
    A[0] ^= RC[2*j];
    A[1] ^= RC[2*j+1];
#ifdef __TRS80__
    /* for( i=0; i<5; i++ ){ print_short( C[i] ); }; print_crlf(); */
    /* for( i=0; i<5; i++ ){ print_short( D[i] ); }; print_crlf(); */
    print_title();
    print_char(j+1);
    if( j==K_ROUNDS-1 ){
    /* Display resulting state */
    for( i=0; i<K_LANES; i++ ){
      if( 0==i || 5==i || 10==i || 15==i || 20==i ) print_crlf();
      u = A[2*i]; v = A[2*i+1];
      print_short( (unsigned short) (u%65536) ); 
      print_short( (unsigned short) (u>>16) );
      print_short( (unsigned short) (v%65536) ); 
      print_short( (unsigned short) (v>>16) );
    }
    }
    print_crlf();
#else
    printf("Round: %d\n",j+1);
    /* for( i=0; i<5; i++ ) printf( "(%5u, %5u, %5u, %5u) ", */
    /* 				 (unsigned int)(C[2*i]%65536), */
    /* 				 (unsigned int)(C[2*i]>>16), */
    /* 				 (unsigned int)(C[2*i+1]%65536), */
    /* 				 (unsigned int)(C[2*i+1]>>16) */
    /* 				 ); */
    /* printf("\n"); */
    /* for( i=0; i<5; i++ ) printf( "(%5u, %5u, %5u, %5u) ", */
    /* 				 (unsigned int)(D[2*i]%65536), */
    /* 				 (unsigned int)(D[2*i]>>16), */
    /* 				 (unsigned int)(D[2*i+1]%65536), */
    /* 				 (unsigned int)(D[2*i+1]>>16) */
    /* 				 ); */
    /* printf("\n"); */
    for( i=0; i<K_LANES; i++ ){
      if( 0==i || 5==i || 10==i || 15==i || 20==i ) printf("\n");
      u = A[2*i]; v = A[2*i+1];
      printf( "(%5u, %5u, %5u %5u) ", 
	      (unsigned int) (u%65536), (unsigned int) (u>>16),
	      (unsigned int) (v%65536), (unsigned int) (v>>16)
	      );
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
