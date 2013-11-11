#!/usr/bin/python
# -*- coding: iso-8859-15 -*-

from optparse import OptionParser

def ihx_bytecount( line ):
    return int( line[1:3], 16 )

def ihx_address( line ):
    return ( int(line[3:5],16), int(line[5:7],16) )

def ihx_addtype( line ):
    return int( line[7:9], 16 )

def ihx_data( line ):
    return line[9:2*ihx_bytecount(line)+9]

def ihx_checksum( line ):
    return int( line[2*ihx_bytecount(line)+9:], 16 )

if __name__ == "__main__":
    usage = "usage: %prog [options] file.ihx"
    parser = OptionParser(usage=usage)
    parser.add_option( "-o", dest="cass",  help="Cassette file name", metavar="CASS", default='out.cas' )
    parser.add_option( "-n", dest="name",  help="Name of program", metavar="NAME", default='MYPRGM' )
    parser.add_option("-v", action="store_true", dest="verbose")
    (options, args) = parser.parse_args()
    if 1!=len(args):
        exit( "Missing input .ihx file!" )
    
    lc = 0
    f = open( args[0], "r" )
    g = open( options.cass, "wb" )
    # Cassette leader
    header = ''
    for i in range(256):
        header += chr(0)
    header += chr(165)
    # Header 55H indicates system format
    header += chr(85)
    g.write( header )

    # Name of program, 6 chars exactly
    prgmname = (options.name[:6]+"XXXXXX")[:6]
    g.write( prgmname )
    casslc = 0
    for line in f:
        lc += 1
        # Use sdcc --no-std-crt0 for TRS80
        if 0 == ihx_addtype(line) :
            casslc += 1
            ihxdata = ihx_data(line)
            (lsb,msb)=ihx_address(line)
            # First address stored as the transfer address
            if 1==casslc:
                (tlsb,tmsb)=(lsb,msb)
            # Checksum includes address
            cs = (lsb+msb)%256
            cassdata =  chr(60) # 3CH data header
            bc = ihx_bytecount(line)
            cassdata += chr( bc )
            # Note reverse order from .ihx
            cassdata += chr(msb)+chr(lsb)
            for i in range( 0, len(ihxdata), 2 ):
                hexchar = ihxdata[i:i+2]
                intchar = int(hexchar,16)
                cs = (cs+intchar)%256
                cassdata += chr(intchar)
            cassdata += chr(cs)
            g.write( cassdata )
        if options.verbose:
            print "%3d %2d %10s %1d %3d %s" % (lc, ihx_bytecount(line), ihx_address(line), ihx_addtype( line ), ihx_checksum(line), ihx_data(line) )
    f.close()
    # End of cassette file
    g.write( chr(120) )
    # Start address
    g.write( chr(tmsb)+chr(tlsb) )
    g.close()
    print "\t", lc, "lines read."
    print "\t", casslc, "blocks written."
