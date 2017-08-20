#ifdef _TRS80
void state_print(){
  /* hex[] = { 0x30, 0x31, 0x32, 0x33, */
  /* 	    0x34, 0x35, 0x36, 0x37, */
  /* 	    0x38, 0x39, 0x41, 0x42, */
  /* 	    0x43, 0x44, 0x45, 0x46 }; */
  int i;
  for( i=0; i<10; i++ ){
    hex[i] = i + 48;
  }
  for( i=0; i <6; i++ ){
    hex[i+10] = i + 65;
  }
  __asm
    ld hl, #0x409c
    ld a,#0x0
    ld (hl),a
    call 0x01c9
    ld iy,#_state
  __endasm;
  for( i=0; i<12; i++ ){
    __asm
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
  __endasm;
    if( 3 == (i%4) ){
      __asm
	ld a,#0x0d
	call 0x32a
	__endasm;
    }
  }
    return;
}
#endif
