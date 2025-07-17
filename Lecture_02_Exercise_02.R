# Load the genetics package
library(genetics)

# Define possible genotypes for SNPs with alleles G and C
genotypes <- c("G/G", "G/C", "C/C")

# Set parameters: 10 SNPs and 10 individuals
n_snps <- 10
n_individuals <- 10

# Create a matrix to store genotype data
set.seed(123) # For reproducibility
data <- matrix(0, n_individuals, n_snps)

# Simulate genotype data for each SNP
for (i in 1:n_snps) {
  data[, i] <- sample(x = genotypes, size = n_individuals, replace = TRUE)
}

# Name the columns of the matrix
colnames(data) <- paste0("SNP", 1:n_snps)

# Display the genotype data matrix
cat("Genotype Data Matrix for CFTR Gene:\n")
print(data)

# Convert the matrix to a data frame of genotype objects using makeGenotypes
CFTR <- makeGenotypes(data)

# Create a 10x2 matrix to store allele frequencies (G and C) for each SNP
allele_freq_matrix <- matrix(0, n_snps, 2)
colnames(allele_freq_matrix) <- c("G", "C")
rownames(allele_freq_matrix) <- paste0("SNP", 1:n_snps)

# Populate the allele frequency matrix
for (i in 1:n_snps) {
  freq <- summary(CFTR[[i]])$allele.freq
  allele_freq_matrix[i, ] <- freq[, 2] # Store frequencies for G and C
}

# Display the allele frequency matrix
cat("\nAllele Frequency Matrix (10x2) for CFTR Gene:\n")
print(allele_freq_matrix)

# Create an overlapping bar plot for allele frequencies
barplot(t(allele_freq_matrix), beside = FALSE, 
        col = c(rgb(0, 0, 1, 0.5), rgb(1, 0, 0, 0.5)), # Blue for G, Red for C with transparency
        names.arg = paste0("SNP", 1:n_snps),
        main = "Allele Frequencies for CFTR Gene SNPs",
        xlab = "SNP", ylab = "Frequency",
        ylim = c(0, 1),
        legend.text = c("G", "C"),
        args.legend = list(x = "topright", bty = "n"))
abline(h=0.02, col="green", lty=2,lwd=2)
