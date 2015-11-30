library(RColorBrewer)
png("#40_colorRampPalette_and_RcolorBrewer.png" , width = 480, height = 480)
par(mar=c(0,0,0,0))
coul = brewer.pal(4, "BuPu") 
coul = colorRampPalette(coul)(25)
pie(rep(1, length(coul)), col = coul , main="") 
dev.off()

