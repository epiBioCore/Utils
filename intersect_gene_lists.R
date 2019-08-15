## import gene lists, change "gene_list1.txt" and "gene_list2.txt" to your file names
list1 <- read.delim("gene_list1.txt")
list2 <- read.delim("gene_list2.txt")

##change geneID to the name of the column that has your ids
commonGenes <- intersect(list1$geneID,list2$geneID)

#export, this will export the one column of gene names that were found in both lists
write.table(commonGenes,file = "list1_list2_common_genes.txt",quote = F, col.names = F, row.names = F)