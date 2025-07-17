if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("BiocVersion")

BiocManager::version() # Verify version



BiocManager::valid()

BiocManager::install(version="3.21")

BiocManager::install("ldblock")
BiocManager::install("GenomeInfoDb")

library(ldblock)
library(GenomeInfoDb)

path = dir(system.file("hapmap", package="ldblock"),
           full=TRUE)


#ceu 17 th chromosome data
ceu17 = hmld(path, poptag="CEU", chrom="chr17")


library(Matrix)
image(ceu17@ldmat[1:1000,1:1000],col.reg=heat.colors(120),colorkey=TRUE,useRaster=TRUE)

#result ldblock

BiocManager::install("ChromHeatMap")
BiocManager::install("ALL")
BiocManager::install("hgu95av2.db")


library(ALL)
library(ChromHeatMap)
library(hgu95av2)
library(hgu95av2.db) #install from bioconductor
library(org.Hs.eg.db)

result <- select(org.Hs.eg.db, keys = <your_keys>, columns = c("PROSITE"), keytype = "ENTREZID")

sessionInfo()


###################
data('ALL')
selSamples <- ALL$mol.biol %in% c('ALL1/AF4', 'E2A/PBX1')
ALLs <- ALL[, selSamples]
chrdata<-makeChrStrandData(exprs(ALLs), lib='hgu95av2')
groupcol <- ifelse( ALLs$mol.biol == 'ALL1/AF4', 'red', 'green' )
plotChrMap(chrdata, 19, strands='both', RowSideColors=groupcol)
plotmap<-plotChrMap(chrdata, 1, cytoband='q23', interval=50000, srtCyto=0, cexCyto=1.2)










