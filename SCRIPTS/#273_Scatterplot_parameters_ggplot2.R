# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 273: SCATTERPLOT PARAMETERS GGPLOT2
#################

# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(iris)

# use options!
png("#273_Scatterplot_parameters_ggplot2.png" , width = 480, height = 480 )
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
	geom_point(
		color="red",
		fill="blue",
		shape=21,
		alpha=0.5,
		size=6,
		stroke = 2
		)
dev.off()

# ---------------------------------------------------------------------------------------------------------------------------------------------------------


