#!/bin/bash

set -u
set -e
set -o pipefail


##This script will take the intersection of set of replicate narrowPeak files

samples=cocultureSamples.txt 

groups=$(cut -f2 $samples | uniq)
for group in $groups
do

	echo $group
	ids=$(grep $group $samples | cut -f3)
	for i in $ids
	do
		file=(${i}_macs/${i}_peaks.narrowPeak)

		## convert narrowPeak files to sorted bed files for bedops
		awk 'BEGIN{OFS="\t"} {print $1,$2,$3,$4}' $file > tmp.bed
		sort-bed --tmpdir $PWD tmp.bed > tmp_${i}.bed
		rm tmp.bed

	done

	bed=$(ls tmp*bed)
	
	##if there are replicates get the coordinates that intersect with all files,
	## otherwise return the bed file of single replicate
	N=$(ls tmp*bed | wc -w)
	if [ $N -gt 1 ]
	then
		bedops --intersect $bed > ${group}_peaks.bed
		rm tmp*bed
	else
		mv tmp*bed ${group}_peaks.bed

	fi
done


