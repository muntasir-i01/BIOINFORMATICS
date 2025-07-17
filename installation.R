devtools::install_github("SFUStatgen/LDheatmap")
install.packages("LDheatmap")
make checkCRAN()
if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")
devtools::install_github("davidzhao/LDheatmap")


setwd("C:/Users/khan_/Downloads/LDheatmap_1.0-6.tar.gz")
install.packages("LDheatmap_1.0-6.tar.gz", repos = NULL, type = "source")

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("snpStats")
install.packages("https://cran.r-project.org/src/contrib/Archive/LDheatmap/LDheatmap_1.0-6.tar.gz", repos = NULL, type = "source")
library(LDheatmap)