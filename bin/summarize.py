#!/usr/bin/env python


# configure
COUNT = 150

# require
from gensim.summarization.summarizer import summarize
import sys
import re

# sanity check
if len( sys.argv ) != 2 :
	sys.stderr.write( 'Usage: ' + sys.argv[ 0 ] + " <file>\n" )
	exit()

# import the data file and normalize it
data = open( sys.argv[ 1 ] ).read()
data = re.sub( '\r+', ' ', data )
data = re.sub( '\n+', ' ', data )
data = re.sub( ' +' , ' ', data )
data = re.sub( '^\W+', '', data )
data = re.sub( '$\W+', '', data )

# output and done
print( summarize( data, word_count = COUNT ) )
exit()
