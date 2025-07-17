####### GHRH: 5 SNPs for 100 individuals
#####Alleles: A and T


library(genetics)
geno <- c('A/A', 'A/T', 'T/A','T/T')
nsnps <- 5; nsample <- 100

GHRH <- matrix(0, nsample, nsnps)
for(i in 1: nsnps) {
  GHRH[,i] <- sample(x = geno, size = nsample, replace = TRUE)
}

GHRH
dim(GHRH)

GHRH <- makeGenotypes(GHRH)
class(GHRH$V1)

############ perform QC
############ Minor Allel frequency (MAF)

af <- matrix(0, 2, nsnps)

for(i in 1:nsnps) {
  af[,i] <- summary(GHRH[,i])$allele.freq[,2]
}

af

##############plot and hence comment
###################################Overlapping plot (QC)

plot(af[1,], ylim = c(0,1), pch=16)
points(af[2,], pch=16, col="red")
abline(h=0.05, col="green")


het <- matrix()
for(i in 1:nsnps) {
  het[i] <- summary(GHRH[,i])$Hu
}
het


plot(het, ylim = c(0,1), pch=16)
points(het, pch=16, col="red")
abline(h=0.05, col="green")


#############################
GHRH
library(LDheatmap)

LDheatmap(GHRH)
nGHRH <- GHRH
nGHRH[,1] <- nGHRH[,2]


r1 <- LD(nGHRH)
r1$'R^2'
LDheatmap(nGHRH)

summary(nGHRH$V1)$allele.freq[,2]
summary(nGHRH$V2)$allele.freq[,2]
summary(nGHRH$V3)$allele.freq[,2]
summary(nGHRH$V4)$allele.freq[,2]
summary(nGHRH$V5)$allele.freq[,2]

summary(nGHRH$V1)$Hu
summary(nGHRH$V2)$Hu

?LDtable
LDtable(r1)









