awk 'BEGIN{FS=OFS="\t"; print "GeneID\tChr\tStart\tEnd\tStrand"}{print $4, $1, $2+1, $3, $6}' mm10_23K_genebody.bed > mm10_23K_genebody.saf
