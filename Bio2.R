library(genetics)
#For single locus: allele: "A" and "T"
#genotype: "AA", "AT", "TT"
snp1 <- c("A/A","A/T","T/T","T/T","A/A",
          "A/T","A/A","A/T","T/T")
snp2 <- c("C/G","C/C","G/G","G/C","G/C",
          "G/G","C/G","C/C","G/C")
gsnp1<-genotype(snp1)
gsnp2<-genotype(snp2)

gsnp1;gsnp2

gsnp11<-makeGenotypes(snp1)
gsnp11
gsnp1

summary(gsnp1)
heterozygote(gsnp1)
homozygote(gsnp1)


expectedGenotypes(gsnp1)
expectedHaplotypes(gsnp1)

allele.names(gsnp2)
allele.count(gsnp2)

haplotype(gsnp1)


########### Making genotype data
snp1 <- c("A/A","A/T","T/T","T/T","A/A", "A/T","A/A","A/T","T/T")
snp2 <- c("C/G","C/C","G/G","G/C","G/C", "G/G","C/G","C/C","G/C")
snp3 <- c("C/G","C/C","G/G","G/C","G/C", "G/G","C/G","C/C","G/C")
snp4 <- c("A/A","A/T","T/T","T/T","A/A", "A/T","A/A","A/T","T/T")
snp5 <- c("C/G","C/C","G/G","G/C","G/C", "G/G","C/G","C/C","G/C")

data1 <- makeGenotypes(data.frame(snp1, snp2, snp3, snp4, snp5))

summary(data1)


########### Making genotype data
geno1<-c("A/A","A/T","T/A","T/T")
geno2<-c("C/C","C/G","G/C","G/G")

gene1<-sample(geno1,10,replace=TRUE)
gene2<-sample(geno2,10,replace=TRUE)

nsnp1 <- 5; nsample <- 10

geneA <- matrix(0, nsample, nsnp1)

for(i in 1:nsnp1) {
  geneA[,i]<-sample(geno1, nsample, replace = TRUE)
}

geneA

dim(geneA)


nsnp2 <- 10; nsample <- 10
geneB <- matrix(0, nsample, nsnp2)

for(i in 1:nsnp2) {
  geneB[,i] <- sample(geno2, nsample, replace = TRUE)
}

geneB

dim(geneB)








