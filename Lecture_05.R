####### GHRH: 5 SNPs for 100 individuals
#####Alleles: A and T
###dim:100x5

geno<-c("A/A", "A/T", "T/A", "T/T")
nsnps<-5; sample<-100

GHRH<-matrix(0,sample,nsnps)
for(i in 1:nsnps){
  GHRH[,i]<-sample(x=geno,size=sample,replace = TRUE)
}
GHRH
dim(GHRH)

library(genetics)
GHRH<-makeGenotypes(GHRH)
class(GHRH$V1)

library(LDheatmap)



R1<-LD(GHRH)
R1$R^2
R1$D
summary(GHRH$V1)






######QC
#########minor allele frequency

af<-matrix(0,2,nsnps)
for (i in 1:nsnps) {
  af[,i]<-summary(GHRH[,i])$allele.freq[,2]
}
af
###################################Overlapping plot (QC)
plot(af[1,],ylim = c(0,1),pch=16)
points(af[2,],pch=16,col="red")
abline(h=0.05,col="green")

het<-matrix()
for (i in 1:nsnps) {
  het[i]<-summary(GHRH[,i])$Hu
}
het
summary(GHRH$V1)
summary(GHRH$V1)$Hu
summary(GHRH$V1)$PIC

LD(GHRH)
library(LDheatmap)

LDheatmap(GHRH)
