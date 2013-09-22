  sdcc -mz80 -D__TRS80__ --no-std-crt0 --code-loc 0x4A00 --data-loc 0x5f00 chacha.c
  python ihx2cas.py -n CHACHA -o chacha.cas chacha.ihx

 sdcc -mz80 -D__TRS80__ --no-std-crt0 --code-loc 0x4A00 --data-loc 0x6900 ec25519.c
 python ihx2cas.py -n ECCTRS -o ecctrs.cas ec25519.ihx