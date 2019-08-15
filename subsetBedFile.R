bed_file <- read.delim("mm10.bed",header = F,stringsAsFactors = F,col.names = c("chr","start","end","name","score","strand"))
head(bed_file)

gene_list <- read.csv("memory_genes_190313/memory_genes_2h_190313.csv",stringsAsFactors = F)
head(gene_list)


memory_genes_bed <- bed_file[bed_file$name %in% gene_list$Geneid,]
dim(gene_list)
dime(memory_genes_bed)
write.table(memory_genes_bed,file = "memory_genes.bed",sep = "\t",row.names = F,col.names = F,quote = F)
