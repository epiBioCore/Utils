
###add tracks stanzsa to trackDb.txt before certain text

awk '/####add merged data/ {system( "cat trackDb_stanzas.txt" )} {print; } \' trackDb.txt.old > trackDb.txt

This will add the contents of the trackDb_stanzas.txt file before the "####add merged data" line in the trackDb.txt.old file and is saved to the trackDb.txt file
