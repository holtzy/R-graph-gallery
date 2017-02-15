http://www.hallwaymathlete.com/2016/03/one-of-best-and-most-underutilized.html
Connor Jennings

# ggplot2 library
library(ggplot2)

# Let's use the diamonds dataset
data(diamonds)
head(diamonds)

#If we study the density of price for each type of cut of the diamond:
png("#135_stacked_density_graph_1.png" , width = 480, height = 480 )
ggplot(data=diamonds,aes(x=price, group=cut, fill=cut)) + 
	geom_density(adjust=1.5)
dev.off()

# A solution would be to use transparency (using the alpha argument):
png("#135_stacked_density_graph_2.png" , width = 480, height = 480 )
ggplot(data=diamonds,aes(x=price, group=cut, fill=cut)) + 
	geom_density(adjust=1.5 , alpha=0.2)
dev.off()

# Or to use a staked density plot:
png("#135_stacked_density_graph_3.png" , width = 480, height = 480 )
ggplot(data=diamonds,aes(x=price, group=cut, fill=cut)) + 
	geom_density(adjust=1.5, position="fill")
dev.off()

