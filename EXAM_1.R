library(genetics)
library(comprehenr)
library(LDheatmap)
 n_snps <- 10
 n_individuals <- 10
 APEX1 <- matrix(0,n_individuals,n_snps)
 genotypes <- c("A/T","A/A","T/T","T/A")
 for (i in 1:n_snps){
   APEX1[,i] <- sample(x=genotypes,size=n_individuals,replace=TRUE) 
 }
 
 APEX1 <- makeGenotypes(APEX1)
 
 
 afr <-matrix(0,n_snps,2)
 for (i in 1:n_snps){
   afr[i,] <- summary(APEX1[,i])$allele.freq[,2]
 } 
 
 dim(APEX1)
 
 het <- to_vec(for (i in 1:n_snps) summary(APEX1[,i])$Hu)
 het
 
 plot(afr[,1],col="BLACK",ylim=c(0,1),pch=16,xlab="SNPs",ylab="frequency")
 points(afr[,2],col="RED",pch=16)
 abline(h=0.05,col="GREEN")
 
 plot(het,col="BLACK",ylim=c(0,1),pch=16,xlab="SNPs",ylab="het")
 abline(h=0.05,col="GREEN")
 R1 <- LD(APEX1)
 LDtable(R1)
 R1$R^2
 LDheatmap(APEX1)
 
 data(CEUData)
 
 MyHeatmap <- LDheatmap(CEUSNP,LDmeasure = "D'",
                        title="Pairwise LD in D'",
                        add.map=TRUE,color=heat.colors(20),add.key=TRUE)
 
 het <- to_vec(for (i in 1:length(CEUSNP)) summary(CEUSNP[,i])$Hu)
 het
 PIC <- to_vec(for (i in 1:length(CEUSNP)) summary(CEUSNP[,i])$pic)
 PIC
 plot(het,col="BLACK",ylim=c(0,1),pch=16,xlab="SNPs")
 points(PIC,col="RED",ylim=c(0,1),pch=16,xlab="SNPs")
 
 APEX1[,2] <- APEX1[,1]
 APEX1[,3] <- APEX1[,1]
 APEX1[,4] <- APEX1[,6]
 APEX1[,8] <- APEX1[,10]
 
 
APEX1
R2 <- LD(APEX1)
R2$r^2
LDheatmap(APEX1)
 