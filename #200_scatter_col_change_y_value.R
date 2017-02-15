# library
library(plotrix)

#create color palette
library(RColorBrewer)
my_colors = brewer.pal(8, "Set2") 

# Create data
x<-seq(1,100)
y<-sin(x/5)+x/20

# Plot x and y
png("#200_scatter_col_change_y_value.png" , width = 480, height = 480 )
par(mar=c(4,4,2,2))
clplot(x, y, main="", lwd=5, levels=c(1,2,3,4,5), col=my_colors, showcuts=T , bty="n")
dev.off()

