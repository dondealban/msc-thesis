# This R script generates box-whisker plotes using ggplot2 package.
# The aim of generating the boxplots is to visualise the distribution of values for
# each land cover type per year for each feature predictor variable.
#
# Script By:      Jose Don T. De Alban
# Date Created:   09 May 2015
# Last Modified:  04 Mar 2016 

# Set working directory
# Note: Need to change the path name
setwd("/Users/dondealban/Image Processing/Thesis/R/1 boxplots/")

# Load the required R libraries
library(ggplot2)

# [1] Image Objects by Chessboard Segmentation

### LOAD DATA

# Read data, define variables, and store data in variables
# Note: Need to change filenames
ALL2 <- read.csv(file="PALSARwDEM-Stats-Selected-Join-Date-2010.csv", header=TRUE, sep=",")
sardem2 <- subset(ALL2, subset=(LCCode=="FCFB" | LCCode=="FCFC" | LCCode=="FCFM" | LCCode=="FFPB" | LCCode=="FFPC" | LCCode=="FOFB" | LCCode=="FOFC" | LCCode=="FOFM" | LCCode=="LVMG"))

### MEAN ASPECT
# Generate boxplots per land cover type across all years
mnASP2 <- ggplot() + geom_boxplot(aes(y = MeanAspect,x = LCCode, fill=factor(AcquisitionDate)),data=sardem2,outlier.shape = 1,outlier.size = 1)
mnASP2 <- mnASP2 + labs(title="Mean Aspect of Forest Cover Types in Northern Luzon", x="Land Cover Type", y="Value (degrees)", fill="Year")
mnASP2 <- mnASP2 + ylim(0,360)

### MEAN DEM
# Generate boxplots per land cover type across all years
mnDEM2 <- ggplot() + geom_boxplot(aes(y = MeanDEM,x = LCCode, fill=factor(AcquisitionDate)),data=sardem2,outlier.shape = 1,outlier.size = 1)
mnDEM2 <- mnDEM2 + labs(title="Mean DEM of Forest Cover Types in Northern Luzon", x="Land Cover Type", y="Value (m)", fill="Year")
mnDEM2 <- mnDEM2 + ylim(0,2500)

### MEAN HH
# Generate boxplots per land cover type across all years
mnHH2 <- ggplot() + geom_boxplot(aes(y = MeanHH,x = LCCode, fill=factor(AcquisitionDate)),data=sardem2,outlier.shape = 1,outlier.size = 1)
mnHH2 <- mnHH2 + labs(title="Mean HH of Forest Cover Types in Northern Luzon", x="Land Cover Type", y="Value (dB)", fill="Year")
mnHH2 <- mnHH2 + ylim(-12,0)

### MEAN HV
# Generate boxplots per land cover type across all years
mnHV2 <- ggplot() + geom_boxplot(aes(y = MeanHV,x = LCCode, fill=factor(AcquisitionDate)),data=sardem2,outlier.shape = 1,outlier.size = 1)
mnHV2 <- mnHV2 + labs(title="Mean HV of Forest Cover Types in Northern Luzon", x="Land Cover Type", y="Value (dB)", fill="Year")
mnHV2 <- mnHV2 + ylim(-18,-6)

### MEAN HH/HV
# Generate boxplots per land cover type across all years
mnRAT2 <- ggplot() + geom_boxplot(aes(y = MeanRAT,x = LCCode, fill=factor(AcquisitionDate)),data=sardem2,outlier.shape = 1,outlier.size = 1)
mnRAT2 <- mnRAT2 + labs(title="Mean HH/HV of Forest Cover Types in Northern Luzon", x="Land Cover Type", y="Value", fill="Year")
mnRAT2 <- mnRAT2 + ylim(1,4)

### MEAN SLOPE
# Generate boxplots per land cover type across all years
mnSLOPE2 <- ggplot() + geom_boxplot(aes(y = MeanSlope,x = LCCode, fill=factor(AcquisitionDate)),data=sardem2,outlier.shape = 1,outlier.size = 1)
mnSLOPE2 <- mnSLOPE2 + labs(title="Mean Slope of Forest Cover Types in Northern Luzon", x="Land Cover Type", y="Value (degrees)", fill="Year")
mnSLOPE2 <- mnSLOPE2 + ylim(0,90)

### BOX-WHISKER PLOTS

# Output boxplots to a PDF file
ggsave(mnASP2, file="Boxplot-2010-Mean-Aspect-chess.pdf", width=7, height=5.5)
ggsave(mnDEM2, file="Boxplot-2010-Mean-DEM-chess.pdf", width=7, height=5.5)
ggsave(mnHH2, file="Boxplot-2010-Mean-HH-chess.pdf", width=7, height=5.5)
ggsave(mnHV2, file="Boxplot-2010-Mean-HV-chess.pdf", width=7, height=5.5)
ggsave(mnRAT2, file="Boxplot-2010-Mean-RAT-chess.pdf", width=7, height=5.5)
ggsave(mnSLOPE2, file="Boxplot-2010-Mean-Slope-chess.pdf", width=7, height=5.5)
