/** @file gimli-spboxx.c
    @brief SP-box internals, computes column x

    Computes x
    Globales x, y, and z have been loaded from state[col], [col+4] and [col+8].
    Writes: u, v, x
    Reads: u, v, x, y, z
    Assigns: x, A; z, B; u, C; v, B; carry in 0 (IY), E and D.
    Proceeds byte by byte (loop unrolled).
 */
void spbox_x(){
  __asm
    ld iy,#_cy
    ld e,#0x0
    ld d,#0x0
    ;
    ld hl,#_x+0
    ld c,(hl)
    ld hl,#_u+0
    ld (hl),c
    ;
    ld hl,#_z+0
    ld b,(hl)
    ld a,b
    sla b
    rl 0 (iy)
    ld hl,#_v+0
    ld (hl),b
    ;
    ld hl,#_y+0
    and (hl)
    ;
    sla a
    rl d
    sla a
    rl e
    ;
    xor b
    xor c
    ;      
    ld hl,#_x+0
    ld (hl),a
    
    ld hl,#_x+1
    ld c,(hl)
    ld hl,#_u+1
    ld (hl),c
    ;
    ld hl,#_z+1
    ld b,(hl)
    ld a,b
    rr 0(iy)
    rl b
    rl 0 (iy)
    ld hl,#_v+1
    ld (hl),b
    ;
    ld hl,#_y+1
    and (hl)
    ;
    rr d
    rl a
    rl d
    rr e
    rl a
    rl e
    ;
    xor b
    xor c
    ;      
    ld hl,#_x+1
    ld (hl),a
    
    
    ld hl,#_x+2
    ld c,(hl)
    ld hl,#_u+2
    ld (hl),c
    ;
    ld hl,#_z+2
    ld b,(hl)
    ld a,b
    rr 0(iy)
    rl b
    rl 0 (iy)
    ld hl,#_v+2
    ld (hl),b
    ;
    ld hl,#_y+2
    and (hl)
    ;
    rr d
    rl a
    rl d
    rr e
    rl a
    rl e
    ;
    xor b
    xor c
    ;      
    ld hl,#_x+2
    ld (hl),a

    ld hl,#_x+3
    ld c,(hl)
    ld hl,#_u+3
    ld (hl),c
    ;
    ld hl,#_z+3
    ld b,(hl)
    ld a,b
    rr 0(iy)
    rl b
    rl 0 (iy)
    ld hl,#_v+3
    ld (hl),b
    ;
    ld hl,#_y+3
    and (hl)
    ;
    rr d
    rl a
    rl d
    rr e
    rl a
    rl e
    ;
    xor b
    xor c
    ;      
    ld hl,#_x+3
    ld (hl),a
      
  __endasm;
  return;
}
