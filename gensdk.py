#!/usr/bin/python
# -*- coding: iso-8859-15 -*-
#

# Sudoku Solver by Knuth's Dancing Links Algorithù

import sys
global _TRACE

global grid
global ROW, COL
global N
global H
global METRICS

class _METRICS:
    def __init__(self):
        self.count  = 0  # Solutions count
        self.covers = 0  # Coverings count
        self.steps  = 0  # Coverings count

    def display(self):
        print "== Solutions %d" % self.count
        print "== Coverings %d" % self.covers
        print "== Steps     %d" % self.steps

# TRS-80 Level 2 BASIC functions
def bas_data( arr, line_no=1000 ):
    bas_code = "%d DATA " % line_no
    for i in range( 1, len(arr) ):
        bas_code += "%d" % arr[i]
        if 31==i%32:
            print bas_code
            line_no += 10
            bas_code = "%d DATA " % line_no
        else:
            bas_code+=","
    print

def bas_printcas( casfile="grid.cas" ):
    def _printcasbyte( bstr ):
        g.write( header )
        g.write( bstr )
        g.write( trailer )

    g = open( casfile, "wb" )
    # Data Header and Trailer
    header = ''
    for i in range(256):
        header += chr(0)
    header += chr(165) # A5
    trailer = chr(13)  # 0D
    print "Printing %d integers" % (5*len(IU))
    block = 5
    quo = len(IU)/block
    mod = len(IU)%block
    print "%d lines of %d*5 ints, %d remaining" % (quo, block, mod)
    # Print blocks
    for i in range(quo):
        data = ""
        for j in range(block):
            k = block*i
            if block != j+1:
                data  += " %d, %d, %d, %d, %d," % ( IU[k+j], ID[k+j], IL[k+j], IR[k+j], IC[k+j] )
            else:
                data  += " %d, %d, %d, %d, %d" % ( IU[k+j], ID[k+j], IL[k+j], IR[k+j], IC[k+j] )
        print "--> %d: %d bytes" % (i, len(data))
        _printcasbyte( data )
    # Print remaining
    data = ""
    for j in range(mod):
        k = block*quo
        if mod != j+1:
            data  += " %d, %d, %d, %d, %d," % ( IU[k+j], ID[k+j], IL[k+j], IR[k+j], IC[k+j] )
        else:
            data  += " %d, %d, %d, %d, %d" % ( IU[k+j], ID[k+j], IL[k+j], IR[k+j], IC[k+j] )
    print "--> %d: %d bytes" % (i, len(data))
    _printcasbyte( data )
    g.close()


# Utilities
def pprint( arr, beg=0, end=64 ):
    line = ""
    for i in range( len(arr) ):
        if (i%COL < end) and (i%COL >=beg):
            line += "%3d " % arr[i]
        if COL-1 == i%COL:
            print line
            line = ""
    print

# Initialization 0/1 constraint matrix
def enumerate( arr ):
    count = 1
    for i in range( len(arr) ):
        if 0!=arr[i]:
            arr[i]=count
            count += 1
    return count-1

def cross_row( arr, row ):
    ret = []
    for i in range( COL ):
        if arr[ row*COL + i ] > 0 :
            ret += [ arr[ row*COL + i ] ]
    return ret

def cross_col( arr, col ):
    ret = []
    for i in range( ROW+1 ):
        if arr[ col+COL*i ] > 0 :
            ret += [ arr[ col+COL*i ] ]
    return ret

# Solver
def pop( j ):
    METRICS.steps += 2
    IU[ID[j]]=IU[j]
    ID[IU[j]]=ID[j]

def unpop( j ):
    IU[ID[j]]=j
    ID[IU[j]]=j

def cover( c ):
    METRICS.covers += 1
    if _TRACE: print "\tEnter: cover %d" % c
    METRICS.steps += 2
    IL[IR[c]]=IL[c]
    IR[IL[c]]=IR[c]
    i = ID[c]
    while c != i :
        j = IR[i]
        while i != j:
            pop( j )
            IS[IC[j]] -= 1
            j = IR[j]
        i = ID[i]
    if _TRACE: print "\tExit: cover %d" % c

def uncover( c ):
    if _TRACE: print "\tEnter: uncover %d" % c
    i = IU[c]
    while c != i :
        j = IL[i]
        while i != j :
            IS[IC[j]] += 1
            unpop( j )
            j = IL[j]
        i = IU[i]
    IL[IR[c]]=c
    IR[IL[c]]=c
    if _TRACE: print "\tExit: uncover %d" % c

def select():
    if _TRACE: print "\tEnter: select"
    s = N+1
    j = IR[H]
    while H != j :
        if IS[j]<s :
            ret = j
            s = IS[j]
        j=IR[j]
    if _TRACE: print "\tExit: select %d" % ret
    return ret

def display():
    sol = [ 0 for i in range( N*N ) ]
    for y in [ int((x-COL)/4) for x in O ] :
        sol[ y%(N*N) ] = 1 + y/(N*N)
    s = ""
    sep = ""
    for i in range( 4*N + 1 ): sep += "-"
    print sep
    for i in range( len( sol ) ):
        s += "| %1d " % sol[i]
        if N-1 == (i%N) :
            s += "|"
            print s
            s = ""
            if 0 == (i+1)%(SQRN*N) :
                print sep
    print

def search( k, displayp=False ):
    if _TRACE: print "Enter: search %d -- %d %d" % (k,H,IR[H])
    if H == IR[H]:
        METRICS.count += 1
        if _TRACE: print "Found: Solution %d" % METRICS.count
        if displayp:
            METRICS.display()
            display()
            ignore = raw_input( "Continue (x to exit)>" )
            if "x" == ignore: sys.exit(0)
    else:
        c = select();
        cover( c )
        r = ID[c]
        while c != r :
            O[k] = r
            j = IR[r]
            while r != j :
                cover( IC[j] )
                j = IR[j]
            search( k+1, displayp )
            r = O[k]
            c = IC[r]
            j = IL[r]
            while r != j :
                uncover( IC[j] )
                j = IL[j]
            r = ID[r]
        uncover( c )
    if _TRACE: print "Exit: search %d" % k

if __name__ == "__main__":
    (N, SQRN) = (4, 2)
    (ROW, COL) = (N*N*N, 4*N*N)
    grid = [ 0 for i in range( (1+ROW)*COL ) ]
    print "SDK Matrix Generation -- grid size: %d x %d " % ( ROW, COL )
    # Headers
    for j in range( COL ):
        grid[j] = 1
    # Cells
    for j in range( N ):
        for i in range( N*N ):
            grid[ COL + j*COL*N*N + i*COL + i ] = 1
    # Rows
    for k in range(N):
        offset = COL*N*N*k + N*N + k*N
        for i in range(N):
            start = i + i*N*COL + offset
            for j in range( N ):
                grid[ COL + start + j*COL ]  = 1
    # Cols
    for k in range(N):
        offset = N*N + N*N + k*N*N*COL + k*N
        for i in range(N):
            start = i*COL*N + offset
            for j in range(N):
                grid[ COL + start + j + j*COL ] = 1
    # Blocks
    for k in range(N):
        offset = COL*N*N*k + k*N + N*N + N*N + N*N
        for i in range(N):
            start = i*N*COL + offset + SQRN*int(i/SQRN) #(0 if i<2 else 2)
            for j in range( N ):
                grid[ COL + start + j*COL + int(j/SQRN) ]  = 1
    # Renumber and display
    points = enumerate( grid )

    print "SDK Generation -- grid size: %d\n%d points\n" % ( N, points )
    # headings = [ "Cells", "Rows", "Cols", "Blocks" ]
    # for i in range( 4 ):
    #     print headings[i]
    #     pprint( grid, i*N*N, (i+1)*N*N )

    # Knuth's Arrays in Level 2 BASIC
    IU = [ 0 for i in range( points+1 ) ]
    ID = [ 0 for i in range( points+1 ) ]
    IL = [ 0 for i in range( points+1 ) ]
    IR = [ 0 for i in range( points+1 ) ]
    IC = [ 0 for i in range( points+1 ) ]
    IS = [ N for i in range( COL+1 ) ]
    

    O  = [ -1 for i in range( N*N ) ]

    for i in range( ROW+1 ):
        row = cross_row( grid, i )
        rval = row[1:]+row[:1]
        lval = row[-1:]+row[:-1]
        for j in range( len(row) ):
            IR[ row[j] ] = rval[j]
            IL[ row[j] ] = lval[j]
        # print "IR(%d)=%d:IR(%d)=%d:IR(%d)=%d:IR(%d)=%d" % ( row[0], row[1], row[1], row[2], row[2], row[3], row[3], row[0] )
        # print "IL(%d)=%d:IL(%d)=%d:IL(%d)=%d:IL(%d)=%d" % ( row[0], row[3], row[1], row[0], row[2], row[1], row[3], row[2] )

    H = 0
    IR[H]=IR[COL]
    IR[COL]=H
    IL[H]=IL[1]
    IL[1]=H

    for i in range( COL ):
        col = cross_col( grid, i )
        dval = col[1:]+col[:1]
        uval = col[-1:]+col[:-1]
        for j in range( len(col) ):
            ID[ col[j] ] = dval[j]
            IU[ col[j] ] = uval[j]
            IC[ col[j] ] = i+1
        # print "ID(%d)=%d:ID(%d)=%d:ID(%d)=%d:ID(%d)=%d" % ( col[0], col[1], col[1], col[2], col[2], col[3], col[3], col[0] )
        # print "IU(%d)=%d:IU(%d)=%d:IU(%d)=%d:IU(%d)=%d" % ( col[0], col[3], col[1], col[0], col[2], col[1], col[3], col[2] )
        # print "IC(%d)=%d:IC(%d)=%d:IC(%d)=%d:IC(%d)=%d" % ( col[0], i, col[1], i, col[2], i, col[3], i )
        # print "JC(%d)=%d" % ( i, col[0] )
    _TRACE = False
    METRICS = _METRICS()
    search(0,True)
    METRICS.display()
    # bas_printcas()
