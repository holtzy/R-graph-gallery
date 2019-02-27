png("#101_Manhattan_plot.png" , width = 480, height = 480 )
par(mar=c(4,4,1,1))

# Create data
data <- data.frame (SNP = 1:20000*5 , CHR=c(rep(1:5, each = 20000)), BP= rep(1:20000, 5), P=rnorm(20000*5, 0.2, 0.3) )
data <- data[data$P>0,]

#Library
library(qqman)
library(RColorBrewer)

# Plot !
manhattan(data , suggestiveline = F, genomewideline = F , col=brewer.pal(5, "Set2") , cex=0.7)

dev.off()

