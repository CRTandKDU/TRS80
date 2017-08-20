/** @file gimli-spboxy.c
    @brief SP-box internals, computes column y

    Computes y:
      v = y; y = u | z; y = (unsigned long)(y << 1); y = y ^ u; y = y ^ v;
    Uses:
      y A; v C; carry D; u B;
    Proceeds byte by byte (loop unrolled).
 */
void spbox_y(){
__asm
  ld d,#0x00
  ld hl,#_y+0
  ld c,(hl)
  ld hl,#_v+0
  ld (hl),c

  ld hl,#_u+0
  ld b,(hl)

  ld hl,#_z+0
  ld a,(hl)
  or b
  sla a
  rl d
  xor b
  xor c

  ld hl,#_y+0
  ld (hl),a

  ld hl,#_y+1
  ld c,(hl)
  ld hl,#_v+1
  ld (hl),c

  ld hl,#_u+1
  ld b,(hl)

  ld hl,#_z+1
  ld a,(hl)
  or b
  rr d
  rl a
  rl d
  xor b
  xor c

  ld hl,#_y+1
  ld (hl),a

  ld hl,#_y+2
  ld c,(hl)
  ld hl,#_v+2
  ld (hl),c

  ld hl,#_u+2
  ld b,(hl)

  ld hl,#_z+2
  ld a,(hl)
  or b
  rr d
  rl a
  rl d
  xor b
  xor c

  ld hl,#_y+2
  ld (hl),a
 

  ld hl,#_y+3
  ld c,(hl)
  ld hl,#_v+3
  ld (hl),c

  ld hl,#_u+3
  ld b,(hl)

  ld hl,#_z+3
  ld a,(hl)
  or b
  rr d
  rl a
  rl d
  xor b
  xor c

  ld hl,#_y+3
  ld (hl),a

  __endasm;
 return;
}
