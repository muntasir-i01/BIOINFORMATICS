library(genetics)
library(LDheatmap)
nsnps<-5;nsamples<-100
geno<-c("A/A","A/T","T/A","T/T")
GHRH<-matrix(0,nsamples,nsnps)

for(i in 1:nsnps){
  GHRH[,i]<-sample(x=geno,size=nsamples,replace=TRUE)
}
GHRH
dim(GHRH)

GHRH <- makeGenotypes(GHRH)

########## Minor allele frequency
af <- matrix(0, 2, nsnps)

for(i in 1:nsnps) {
  af[,i] <- summary(GHRH[,i])$allele.freq[,2]
}

af

############# Overlapping plot
plot(af[1,], ylim = c(0,1), pch=16)
points(af[2,], pch=16, col='red')
abline(h=0.05, col='green')


################## HET
het <- matrix()
for(i in 1:nsnps) {
  het[i] <- summary(GHRH[,i])$Hu
}
het

summary(GHRH$V1)
summary(GHRH$V1)$Hu
summary(GHRH$V1)$PIC

R1<-LD(GHRH)
R1$R^2
R1$"D'"
summary(GHRH$V1)







library(LDheatmap)
data(CEUSNP)        # SNP genotype data frame
data(CEUDist)       # SNP physical map positions
data("CEUData", package="LDheatmap")
MyHeatmap<-LDheatmap(CEUSNP, CEUDist, LDmeasure = "D'", 
                     title = "Pairwise LD in D'", add.map = TRUE,
                     color = heat.colors(20), add.key = TRUE)
                     
                     