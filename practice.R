# Load the library
library(genetics)

# Define possible genotypes for a single SNP
geno <- c("G/G", "G/C", "C/G", "G/G")

# Set parameters
nsnp <- 10
nsample <- 10

# Simulate genotype data
CFTR <- matrix(0, nsample, nsnp)
for(i in 1:nsnp){
  CFTR[,i] <- sample(x = geno, size = nsample, replace = TRUE)
}

# Convert matrix to data frame with genotype objects
CFTR_geno <- as.data.frame(apply(CFTR, 2, genotype))

# View the genotype data
print(CFTR_geno)

