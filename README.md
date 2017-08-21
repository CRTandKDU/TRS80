TRS80
=====

Various retrocomputing experiments for the 16K Model 1 TRS-80 with Level II BASIC

Introduction
------------

This repository contains several implementations of modern cryptographic primitives and combinatorial puzzles for the TRS-80. The source code files collected here are in Z80 assembly language, C, Level II BASIC or a mix of all three. 

When feasible a cassette format file is provided, usually with the `.cas` extension, which is compatible with most of the emulators and the actual microcomputer. The cassette files are tested with the following emulators:

+ [xtrs](http://www.tim-mann.org/xtrs.html)
+ [sdltrs](http://sdltrs.sourceforge.net/)

Check the respective sites for installation and documentation.

In order to load the cassette files to an actual system, the excellent program: [PlayCAS](http://home.online.no/~kr-lund/PlayCAS.htm), is required. It transforms a PC into a TRS-80 compatible tape deck and actually *plays* the file as if it were an audio tape, with the TRS-80 audio jacks connected to the earphone and microphone inputs.

A few tools are required to build the cassette files from the source code. The [Small Device C Compiler](http://sdcc.sourceforge.net/) provides a complete suite of tools to build machine code from either C source code or Z80 assembly code (compiler, assembler and linker). 

A script file, `do.bat`, is provided to build the cassette files from source programs. In it the final building step converts from the Intel hexadecimal format, `.ihx` extension, to the cassette format suitable for the TRS-80. This step is performed by an ad hoc Python program, `ihx2cas.py`, which then requires Python version > 2.5 to be installed as well. (Some terse assistance may be invoked with `python ihx2cas.py -h`.)

Cryptographic Experiments
-------------------------

Experimental implementations for the [Chacha stream cipher](http://cr.yp.to/chacha.html) and scalar multiplication on the elliptic curve [Curve25519](http://cr.yp.to/ecdh.html#curve25519-paper) for the TRS-80 are provided respectively as `chacha.cas` and `ecctrs.cas`.

Implementations of several variants of the [Keccak sponge function family](http://keccak.noekeon.org/), and recent winner of the SHA-3 competition are also presented. States of size 200, 400, 800 and 1600 bits only are implemented in respectively `kcktrs8.cas`, `kcktrs16.cas`, `kcktrs32.cas`, and `kcktrs64.cas` cassette files.

These implementations, detailed discussion and experimental results are published in the Cryptology ePrint Archive as [TRS-80 with a grain of salt](http://eprint.iacr.org/2013/546).

### Running GIMLI
Boot the emulator, or better a real Model 1 16K (BASIC Level II), and answer:

**30467**

to the MEMORY SIZE?  question.

Place the `rotate.cas` cassette file in the tape emulator or in the PlayCAS aplication, then at the `>` prompt on the TRS-80 issue the following commands:

    SYSTEM
    *? ROTATE

and after the machine code is loaded, 

    *? /

to start execution of the Gimli permutation on a hard-coded all-null initial state. Refer to the paper for additional usage scenarios.
<p align="center">
<img src="https://github.com/CRTandKDU/TRS80/blob/master/rotate-2.png" width="400"  />
</p>


### Running CHACHA

Place the `chacha.cas` cassette file in the tape emulator or in the PlayCAS application, then at the `>` prompt on the TRS-80 issue the following commands:

    SYSTEM
    *? CHACHA

and after the machine code is loaded, 

    *? /

to start execution of the Chacha cipher on a hard-coded all-null initial state.

A suggestion to branch out this initial version would see adding ability to change the nonce and key used in the cipher state with `POKE` BASIC instructions.

### Running ECCTRS

Place the `ecctrs.cas` cassette file in the tape emulator or in the PlayCAS application, then at the `>` prompt on the TRS-80 issue the following commands:

    SYSTEM
    *? ECCTRS

and after the machine code is loaded, 

    *? /

to start execution of the Curve25519 scalar multiplication used as a test case in the [Cryptology in NaCl](cr.yp.to/highspeed/naclcrypto-20090310.pdf) paper. The secret key is hard-coded but can be changed by *poking* at the appropriate addresses (depending on where the base code address, an argument to `sdcc`, is set). For instance, if the base code segment is at 0x4A00H, the 32 bytes of the secret key are located at 0x4AC1H, 0x4AC7H, 0x4ACCH, 0x4AD1H, ..., 0x4B58H, 0x4B60H. (Note the uneven increment between first and second bytes, and between the penultimate and last bytes.)

### Running KECCAK

All the Keccak cassette files are built with the `make` command. We used GNUWin32 make to run the provided `makefile`.

Once built, place the `kcktrsN.cas` cassette file in the tape emulator or in the PlayCAS application, then at the `>` prompt on the TRS-80 issue the following commands:

    SYSTEM
    *? KECCAK

and after the machine code is loaded, 

    *? /

to start execution of the Keccak block cipher on a hard-coded initial state.

Solving Sudoku
--------------

This is an experimental implementation of Knuth's famous [Dancing Links](http://arxiv.org/abs/cs/0011047) algorithm to solve Sudoku puzzles in Level II BASIC.


The Python script `gensdk.py` both enumerates all solutions for a given grid size and writes out a cassette file, `grid.cas`, of initial matrix data used in the Dancing Links algorithm. The `sudoku.cas` is a Level II BASIC program that starts by reading the grid initial data from the previous cassette and starts enumerating all solutions (for an empty grid).

Although the Python script works for all sizes, including the popular 9x9 puzzle, memory considerations on a 16K TRS-80 restrict usage to 4x4 grids -- 4 rows, 4 columns, 4 blocks, and 16 cells. Even within these constraints load time for the grid initial data is about 6mn 22s; execution however is much faster and the vintage TRS-80 cranks out the first solutions after a few seconds.

Place the `sudoku.cas` cassette file into the (virtual) tape deck, and issue the foloowing command:

    CLOAD

Once the program is correctly loaded, change the cassette file to `grid.cas` and issue the:

    RUN

command.

There is still much work to do based on this backtracking solver, namely a GUI to set a puzzle up with some known values, and a better display of results, intermediary computations and statistics during the search process. (Some sound effects could be nice too, [Leo Christopherson's style](http://leochristopherson.com/).)

Playing 2048
--------------

`GAME2048.cas` is a BASIC implementation of the puzzle game [2048](http://gabrielecirulli.github.io/2048/).  In this version moves are entered with the corresponding arrows; type `Q` to quit.  The goal, defaulting to 16, is displayed in the upper left corner. Number of moves and current scores are shown on the first line.

Info files
--------------

`info.asm` is a command file, tested under LDOS 5.3.1, that prints the summary of nodes in a Texinfo-produced info file passed as an argument in the invocation:

INFO MYFILE/INF

It looks for the `Tag List:` special node at the end of the file and simply parses its entries.

Use z80asm to build.
