#!/bin/bash

##script to generate track stanzas for UCSC genome browser track hub. Input is a tab-delimited file with
## track name, path,and other metaData
file=$1
"
while read -r name group path
do

echo -e "\ttrack $name 
\tparent RNASeqComposite on
\tshortLabel $name
\tlongLabel $name 
\tbigDataUrl $path
\tsubGroups Treatment=${group}
\ttype bigWig
\tvisibility dense
\n"


done < "$file" > trackDb_rna-seq_stanzas.txt
