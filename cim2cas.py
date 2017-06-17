#!/usr/bin/python
# -*- coding: iso-8859-15 -*-

from optparse import OptionParser

CHUNK = 64

if __name__ == "__main__":
    usage = "usage: %prog [options] file.cim"
    parser = OptionParser(usage=usage)
    parser.add_option( "-o", dest="cass",  help="Cassette file name", metavar="CASS", default='out.cas' )
    parser.add_option( "-n", dest="name",  help="Name of program", metavar="NAME", default='MYPRGM' )
    parser.add_option( "-l", dest="location",  help="ORG", metavar="ORG", default='43FF' )
    parser.add_option("-v", action="store_true", dest="verbose")
    (options, args) = parser.parse_args()
    if 1!=len(args):
        exit( "Missing input .ihx file!" )

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

    allbytes = open( args[0], "rb" ).read()
    (nchunk,lastchunk) = (len( allbytes ) / CHUNK, len(allbytes) % CHUNK)
    print len( allbytes ), "bytes read.", nchunk, lastchunk
    (lsb,msb) = (int(options.location,16) % 256, int(options.location,16) >> 8)
    print "ORG", hex(msb), hex(lsb)
    (orglsb,orgmsb) = (lsb,msb)

    for block in range( nchunk ):
        print "LOC %d" % block, hex(msb), hex(lsb)
        # Checksum includes address
        cs = (lsb+msb)%256
        cassdata =  chr(60) # 3CH data header
        cassdata += chr(CHUNK) # chunk size
        cassdata += chr(lsb)+chr(msb) #address for this chunk
        for b in allbytes[ CHUNK*block : CHUNK*(block+1) ]:
            cs = (cs + ord(b)) % 256
            cassdata += b
        cassdata += chr(cs)
        g.write( cassdata )
        loc = lsb + 256*msb + CHUNK
        (lsb,msb) = (loc % 256, loc >> 8)

    # Last chunk
    print "LOC last", hex(msb), hex(lsb)
    cs = (lsb+msb)%256
    cassdata =  chr(60) # 3CH data header
    cassdata += chr(lastchunk) # chunk size
    cassdata += chr(lsb)+chr(msb) #address for this chunk
    for b in allbytes[ CHUNK*nchunk :  ]:
        cs = (cs + ord(b)) % 256
        cassdata += b
    cassdata += chr(cs)
    g.write( cassdata )
        
    # End of cassette file
    g.write( chr(120) )
    # Start address
    g.write( chr(orglsb) + chr(orgmsb) )
    g.close()
    
