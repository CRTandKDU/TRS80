SDCC_FLAGS = -mz80 -D__TRS80__ --no-std-crt0 --code-loc 0x4c00 --data-loc 0x6e00
CASSETTES = kectrs8.cas kectrs16.cas kectrs32.cas kectrs64.cas

all: $(CASSETTES)

%.ihx : %.c
	sdcc $(SDCC_FLAGS)  -o $@ $<

$(CASSETTES): %.cas:%.ihx
	python ihx2cas.py -n KECCAK -o $@ $<

clean:
	rm $(CASSETTES)
