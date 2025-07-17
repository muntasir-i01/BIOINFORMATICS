library(genetics)

#for single locus allele: "A" and "T"
#genotype: "AA", "AT", "TT"

data <- c("A/A", "A/T", "T/T", "T/T", "A/A", "A/T","A/A","A/T","T/T")

snp1 <- c("A/A","A/T","T/T","T/T","A/A",
          "A/T","A/A","A/T","T/T")

snp2 <- c("C/G","C/C","G/G","G/C","G/C",
          "G/G","C/G","C/C","G/C")

gsnp1<-genotype(snp1)
gsnp2<-genotype(snp2)

gsnp1;gsnp2

summary(snp1)
