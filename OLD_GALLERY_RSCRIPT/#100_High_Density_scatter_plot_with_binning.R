# High density scatter plot wth binning
png("#100_High_Density_scatter_plot_with_binning.png" , width = 480, height = 480 )
par(mar=c(1,1,1,1))
library(hexbin)
library(RColorBrewer)
x <- rnorm(mean=1.5, 5000)
y <- rnorm(mean=1.6, 5000)
bin<-hexbin(x, y, xbins=40)
my_colors=colorRampPalette(rev(brewer.pal(11,'Spectral')))
plot(bin, main="" , colramp=my_colors , legend=F ) 
dev.off()

