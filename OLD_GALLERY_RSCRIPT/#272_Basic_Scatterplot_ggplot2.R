


# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 272: BASIC SCATTERPLOT WITH GGPLOT2
#################

# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mtcars)

#A really basic boxplot.
png("#272_Basic_Scatterplot_ggplot2.png" , width = 480, height = 480 )
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
	geom_point()
dev.off()

# ---------------------------------------------------------------------------------------------------------------------------------------------------------


