library(LDheatmap)
data("CEUSNP")

MyHeatmap <- LDheatmap(CEUSNP, CEUDist, LDmeasure="r",
                       title="Pairwise LD in r^2", add.map=TRUE,
                       color=heat.colors(20),add.key=TRUE)


MyHeatmap2 <- LDheatmap(CEUSNP, CEUDist, LDmeasure="D'",
                       title="Pairwise LD in D'", add.map=TRUE,
                       color=heat.colors(20),add.key=TRUE)

# Initialize a vector to store heterozygosity values
het <- numeric(ncol(CEUSNP))  # Create a numeric vector of length equal to the number of SNPs

for (i in 1:ncol(CEUSNP)) {
  het[i] <- summary(CEUSNP[, i])$Hu  # Store the heterozygosity value for each SNP
}
het



# Create a numeric vector of length equal to the number of SNPs
PIC <- numeric(ncol(CEUSNP))

# Loop through each SNP
for (i in 1:ncol(CEUSNP)) {
  # Calculate allele frequencies
  allele_freqs <- table(CEUSNP[, i]) / nrow(CEUSNP)
  
  # Calculate PIC
  PIC[i] <- 1 - sum(allele_freqs^2)
}

# Display the PIC values
PIC


summary(CEUSNP)










