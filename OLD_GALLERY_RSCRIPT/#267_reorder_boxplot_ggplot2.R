

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 267: RE-ORDER BOXPLOT
#################


# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mpg)

# geom_boxplot proposes several arguments to custom appearance
png("#267_reorder_boxplot_ggplot2.png" , width = 480, height = 480 )
ggplot(mpg, aes(x=reorder(class, hwy), y=hwy, fill=class)) + 
	geom_boxplot() +
	xlab("class") +
	theme(legend.position="none")
dev.off()
	

# ---------------------------------------------------------------------------------------------------------------------------------------------------------


