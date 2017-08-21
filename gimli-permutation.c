/* Build with: */
/*   sdcc -mz80 -D_TRS80 --no-std-crt0 --code-loc 0x7704 --data-loc 0x7f9c gimli-permutation.c */
/*   python ihx2cas.py -n ROTATE -o rotate.cas gimli-permutation.ihx */

#ifndef _TRS80
#include <stdio.h>
#endif

unsigned long x, y, z, u, v;
/* Carry bytes in SP-box */
char cy = 0;
char hexc;
char hex[16] = { 0x30, 0x31, 0x32, 0x33,
		 0x34, 0x35, 0x36, 0x37,
		 0x38, 0x39, 0x41, 0x42,
		 0x43, 0x44, 0x45, 0x46 };
unsigned long state[12] = {0};

/* Forward declarations */
void spbox_x();
void spbox_y();
void spbox_z();
void spbox_zerocy();
void spbox_rotate( char );
void state_print();

void main( void ){
  int round;
  char col;
#ifdef _TRS80
  hex[0]=0x30; hex[1]=0x31; hex[2]=0x32; hex[3]=0x33;
  hex[4]=0x34; hex[5]=0x35; hex[6]=0x36; hex[7]=0x37;
  hex[8]=0x38; hex[9]=0x39; hex[10]=0x41; hex[11]=0x42;
  hex[12]=0x43; hex[13]=0x44; hex[14]=0x45; hex[15]=0x46;

  for( round=0; round<12; round++ ){
    state[round] = (unsigned long)0;
  }
#endif
  for( round=24; round > 0; round-- ){
    for( col=0; col<4; col++ ){
      /* Zero buffer for carry bits */
      spbox_zerocy();
      /* Rotate in place and load col */
      spbox_rotate( col );
      x = state[col]; y = state[col+4]; z = state[col+8];
      /* Compute x */
      /* u = x; v = (unsigned long) z << 1; x = y & z; x = (unsigned long) x << 2; x = x ^ v; x = x ^ u; */
      spbox_x();
      /* Compute y */
      /* v = y; y = u | z; y = (unsigned long) y << 1; y = y ^ u; y = y ^ v; */
      spbox_y();
      /* Compute z */
      /* u = u & v; u = (unsigned long) u << 3; v = v ^ u; z = v ^z; */
      /* Store col */
      spbox_z();
      state[col] = z; state[col+4] = y; state[col+8] = x;
    }
    /* Small swap */
    if( 0 == (round&3) ){
      x = state[0]; state[0] = state[1]; state[1] = x;
      x = state[2]; state[2] = state[3]; state[3] = x;
    }
    /* Big swap */
    if( 2 == (round&3) ){
      x = state[0]; state[0] = state[2]; state[2] = x;
      x = state[1]; state[1] = state[3]; state[3] = x;
    }
    /* Injection */
    if( 0 == (round&3) ){
      state[0] = state[0] ^ ((unsigned long) 0x9e377900 | (unsigned long)round);
    }
#ifndef _TRS80
    state_print();
#endif
  }
#ifdef _TRS80
  state_print();
  /* Jump back to BASIC */
  __asm
    ld		a,#0x0d		; CR
    call	0x33		; Print it
    ld		hl,#0x6cc	; BASIC command line
    jp		(hl)
  __endasm;
#endif
}

void spbox_zerocy(){
  cy = 0;
}

/** Rotates in column, left by 24 and by 9, in place
 */
void spbox_rotate( char col ){
  /* char *p, c; */
  /* Rotate x left by 24b in place: as 3 x 8b */
  __asm
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
    ld a,(de)
    push de
    pop hl
    inc hl
    ld c,#0x03
    ld b,#0x00
    ldir
    ld (de),a;
  __endasm;
  /* Rotate y left by 9b in place: as 1b + 8b */
  /* p = (char *)(state+col+4); */
  /* c = p[3]; p[3]=c; */
  /* Check in gen asm which register pair got `p' and push it first */
  __asm
  	ld	l,4 (ix)
  	ld	a,4 (ix)
  	rla
  	sbc	a, a
  	ld	h,a
  	add	hl, hl
  	add	hl, hl
  	ld	de,#_state
  	add	hl,de
        ld bc, #0x10
        add hl,bc
  	ld	e, l
  	ld	d, h
    inc de
    inc de
    push de
    pop hl
    inc de
    ld a,(de)
    ld c,#0x03
    ld b,#0x00
    lddr
    ld (de), a
  /* __asm */
    push de
    pop iy
    ld a,3 (iy)
    rl a
    rl 0 (iy)
    rl 1 (iy)
    rl 2 (iy)
    rl 3 (iy)
    pop ix
    __endasm;
  return;
}

#include "gimli-spboxx.c"
#include "gimli-spboxy.c"
#include "gimli-spboxz.c"
#include "gimli-print.c"

#ifndef _TRS80
void state_print_org(){
  char row, col;
  int h, l;
  for( row = 0; row < 3; row++ ){
    for( col = 0; col < 4; col++ ){
      h = (int) (state[ col+4*row ] >> 16);
      l = (int) ((state[ col+4*row ]<<16) >> 16); 
      printf( "%04x%04x\t", h, l );
    }
    printf( "\n" );
  }
  printf( "\n" );
}

void state_print(){
  char row, col, c;
  char *p;
  int i, b;
  for( i=0; i<10; i++ ){
    hex[i] = i + 48;
  }
  for( i=0; i <6; i++ ){
    hex[i+10] = i + 65;
  }
  
  for( row = 0; row < 3; row++ ){
    for( col = 0; col < 4; col++ ){
      p = (char *) (state + col + row + row + row + row);
      for( b=3; b>=0; b-- ){
	c =  hex[ ( (*(p+b))>> 4  & 0x0F ) ];
	printf( "%c", c );
	c =  hex[ ( *(p+b) & 0x0F ) ];
	printf( "%c", c );
      }
      printf( "\t" );
    }
    printf( "\n" );
  }
  printf( "\n" );
}
#endif

