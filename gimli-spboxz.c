/** @file gimli-spboxz.c
    @brief SP-box internals, computes column z

    Computes z:
      u = u & v; u = (unsigned long) u << 3; v = v ^ u; z = v ^z;
    Uses:
      carry _cy, D, E; u A; v B;
    Proceeds byte by byte (loop unrolled).
 */
void spbox_z(){
  __asm
    ld hl,#_cy
    ld a,#0x00
    ld (hl),a
    ld d, a
    ld e, a

    ld hl,#_u+0
    ld a,(hl)
    ld hl,#_v+0
    ld b,(hl)
    and b
    ld hl,#_cy
    sla a
    rl (hl)
    sla a
    rl d
    sla a
    rl e
    xor b
    ld hl,#_z+0
    xor (hl)
    ld (hl),a
    
    ld hl,#_u+1
    ld a,(hl)
    ld hl,#_v+1
    ld b,(hl)
    and b
    ld hl,#_cy
    rr (hl)
    rl a
    rl (hl)
    rr d
    rl a
    rl d
    rr e
    rl a
    rl e
    xor b
    ld hl,#_z+1
    xor (hl)
    ld (hl),a
    
    ld hl,#_u+2
    ld a,(hl)
    ld hl,#_v+2
    ld b,(hl)
    and b
    ld hl,#_cy
    rr (hl)
    rl a
    rl (hl)
    rr d
    rl a
    rl d
    rr e
    rl a
    rl e
    xor b
    ld hl,#_z+2
    xor (hl)
    ld (hl),a
    
    ld hl,#_u+3
    ld a,(hl)
    ld hl,#_v+3
    ld b,(hl)
    and b
    ld hl,#_cy
    rr (hl)
    rl a
    rl (hl)
    rr d
    rl a
    rl d
    rr e
    rl a
    rl e
    xor b
    ld hl,#_z+3
    xor (hl)
    ld (hl),a
    
  __endasm;
}
