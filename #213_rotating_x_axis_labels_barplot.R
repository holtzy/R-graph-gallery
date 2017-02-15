# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 213 Rotating x axis labels

#Create data

# Let's create a vector of data:
my_vector=c(3,12,5,18,45,43,54,12,98)
names(my_vector)=paste("group: ",letters[1:9],sep="")

#create color palette:
library(RColorBrewer)
coul = brewer.pal(9, "Pastel2") 

png("#213_rotating_x_axis_labels_barplot.png" , width = 480, height = 480 )
par(mar=c(7,3,3,3))
a=barplot(my_vector, col=coul , las=1, names.arg="")
text(a[,1], -3.7, srt = 60, adj= 1, xpd = TRUE, labels = names(my_vector) , cex=1.2)
dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------


