library(genetics)
library(LDheatmap)

snp1 <- c("A/A","A/T","T/T","T/T","A/A", "A/T","A/A","A/T","T/T")
snp2 <- c("C/G","C/C","G/G","G/C","G/C","G/G","C/G","C/C","G/C")
snp3 <- c("A/A","A/T","T/T","T/T","A/A","A/T","A/A","A/T","T/T")
snp4 <- c("A/A","A/T","T/T","T/T","A/A","A/T","A/A","A/T","T/T")
snp5 <- c("A/A","A/T","T/T","T/T","A/A","A/T","A/A","A/T","T/T")

############LD measures and visualization (triangle)

data1 <- makeGenotypes(data.frame(snp1,snp2,snp3,snp4,snp5))
LDheatmap(data1)
LD(data1)


####################
snp1 <- c("A/A","A/T","T/T","T/T","A/A","A/T","A/A","A/T","T/T")
snp2 <- c("C/G","C/C","G/G","G/C","G/C","G/G","C/G","C/C","G/C")
snp3 <- c("C/G","C/C","G/G","G/C","G/C","G/G","C/G","C/C","G/C")
snp4 <- c("A/A","A/T","T/T","T/T","A/A","A/T","A/A","A/T","T/T")
snp5 <- c("C/G","C/C","G/G","G/C","G/C","G/G","C/G","C/C","G/C")

data2<-makeGenotypes(data.frame(snp1,snp2,snp3,snp4,snp5))
LDheatmap(data2)
ldt<-LD(data2)
LDtable(ldt)








