#########Class 5 exercise
library(genetics)
library(LDheatmap)

########## set genotype data
geno <- c('A/A', 'A/T', 'T/A', 'T/T')

nsnps <- 100
nsample <- 1000


######## create matrix for genotypes
APOC3 <- matrix(0, nsample, nsnps)

###### generate random genotypes for snps
for (i in 1:nsnps) {
  APOC3[,i] <- sample(x = geno, size = nsample, replace = TRUE)
}

########convert the genetics objects
APOC3 <- makeGenotypes(APOC3)


###### QC for minor allele frequency

#########Minor allele frequency

maf <- matrix(0, 2, nsnps)

for(i in 1:nsnps) {
  allele_freqs <- summary(APOC3[,i])$allele.freq[,2]
  maf[,i] <- min(allele_freqs)
}

maf

############allele frequency
af <- matrix(0, 2, nsnps)
for (i in 1:nsnps) {
  af[,i] <- summary(APOC3[,i])$allele.freq[, 2]
}

af


##### Plot minor allele frequency
plot(maf[1, ], ylim = c(0, 1), pch = 16, xlab = "SNPs", ylab = "Allele Frequecy", main = "Minor 
     Allele Frequency")
points(maf[2, ], pch = 16, col = 'red')
abline(h = 0.05, col = 'green')


######## Heterozygosity (HET)
het <- matrix()
for (i in 1:nsnps) {
  het[i] <- summary(APOC3[,i])$Hu
}

het

summary(APOC3$V1)

###### HET Plot
plot(het, ylim = c(0,1), pch = 16, xlab = 'SNPs', ylab = 'Heterozygosity',
     main = 'Heterozygosity')
points(het, pch = 16, col = 'red')
abline(h = 0.05, col = 'green')


####### PIC

PIC <- matrix()
for(i in 1:nsnps) {
  p <- summary(APOC3[,i])$allele.freq[, 2]
}

p

##### Plot PIC
plot(p, ylim = c(0, 1), pch = 16, col = 'red', xlab = "SNPs", ylab = "PIC",
     main = "Polymorphic Information Content")
abline(h = 0.25, col = 'green')


######## calculate LD
ld_matrix <- LD(APOC3)

###### 
LDheatmap(APOC3)

########### Display R^2 values
ld_matrix$`R^2`

ld_table <- LDtable(ld_matrix)
print(ld_table)


###### Display D' vlaue
print(ld_matrix$`D'`)


ld_table1 <- LDtable(ld_matirx)
print(ld_table1)




##############Exercise 2
library(genetics)
library(LDheatmap)

geno <- c('A/A', 'A/T', 'T/A', 'T/T')
nSnps <- 10
nSample <- 10

###########create matrix for genotype
APOC3 <- matrix(0, nSample, nSnps)

######### generte random genotype for snps
for(i in 1:nSnps) {
  APOC3[,i] <- sample(x = geno, size = nSample, replace = TRUE)
}

APOC3


######### set up perfect LD for specified snps pairs
#####snp1 and snp2
APOC3[,2] <- APOC3[,1]
####snp2 and snp3
APOC3[,3] <- APOC3[,2]
#####snp4 and snp6
APOC3[,6] <- APOC3[,4]
####snp8 and snp10
APOC3[,10] <- APOC3[,8]

##########convert to genetics objects
APOC3 <- makeGenotypes(APOC3)


##########Calculalte LD
ld_matrix <- LD(APOC3)

########Display R^2 value
print(ld_matrix$`D'`)


#######LDheatmap
LDheatmap(APOC3)








