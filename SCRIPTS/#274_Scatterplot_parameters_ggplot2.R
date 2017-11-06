
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 274: SCATTERPLOT PARAMETERS DEPENDS OF A VARIABLE GGPLOT2
#################

# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mtcars)

# Color and shape depend on factor (categorical variable)
png("#274_Scatterplot_parameters_ggplot2_1.png" , width = 480, height = 480 )
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species)) + 
	geom_point(size=6, alpha=0.6)
dev.off()


# Color and shape depend on factor (categorical variable)
png("#274_Scatterplot_parameters_ggplot2_2.png" , width = 480, height = 480 )
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Petal.Length, size=Petal.Length)) + 
	geom_point(alpha=0.6)
dev.off()

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

