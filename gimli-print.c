#ifdef _TRS80
void state_print(){
  __asm
    ld hl, #0x409c
    ld a,#0x0
    ld (hl),a
    ld a,#0x0d
    call 0x33

    ld iy,#_state
    ld hl, #_cy+0
    ld a, #0x03
    ld (hl),a

    00004$:
    ld b, #0x04
    00005$:
    ld a, 3 (iy)
    srl a
    srl a
    srl a
    srl a
    ld e,a
    ld d,#0x00
    ld hl,#_hex+0
    add hl,de
    ld a,(hl)
    call 0x33
    ld a, 3 (iy)
    and a, #0x0F
    ld e, a
    ld d,#0x00
    ld hl,#_hex+0
    add hl, de
    ld a,(hl)
    call 0x33

    ld a, 2 (iy)
    srl a
    srl a
    srl a
    srl a
    ld e, a
    ld d, #0x00
    ld hl,#_hex+0
    add hl, de
    ld a,(hl)
    call 0x33
    ld a, 2 (iy)
    and a, #0x0F
    ld e, a
    ld d, #0x00
    ld hl,#_hex+0
    add hl, de
    ld a,(hl)
    call 0x33

    ld a, 1 (iy)
    srl a
    srl a
    srl a
    srl a
    ld e, a
    ld d, #0x00
    ld hl,#_hex+0
    add hl, de
    ld a,(hl)
    call 0x33
    ld a, 1 (iy)
    and a, #0x0F
    ld e, a
    ld d, #0x00
    ld hl,#_hex+0
    add hl, de
    ld a,(hl)
    call 0x33

    ld a, 0 (iy)
    srl a
    srl a
    srl a
    srl a
    ld e, a
    ld d, #0x00
    ld hl,#_hex+0
    add hl, de
    ld a,(hl)
    call 0x33
    ld a, 0 (iy)
    and a, #0x0F
    ld e, a
    ld d, #0x00
    ld hl,#_hex+0
    add hl, de
    ld a,(hl)
    call 0x33

    ld a,#0x20
    call 0x33
    call 0x33
    inc iy
    inc iy
    inc iy
    inc iy
    dec b
    jp NZ,00005$
    ld a,#0x0d
    call 0x33
    ld hl,#_cy+0
    dec (hl)
    jp NZ,00004$
  __endasm;
  return;
}
#endif
