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

########Display D' value
print(ld_matrix$`R^2`)


#######LDheatmap
LDheatmap(APOC3)

