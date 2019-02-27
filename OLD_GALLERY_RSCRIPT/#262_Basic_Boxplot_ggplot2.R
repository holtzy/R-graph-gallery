
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 262: BASIC BOXPLOT WITH GGPLOT2
#################

# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mtcars)

# A really basic boxplot.
png("#262_Basic_Boxplot_ggplot2.png" , width = 480, height = 480 )
ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + 
	geom_boxplot(fill="slateblue", alpha=0.2) + 
	xlab("cyl")
dev.off()

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

