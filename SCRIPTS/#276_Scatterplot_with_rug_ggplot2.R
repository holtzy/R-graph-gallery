
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 276: ADD MARGINAL RUG
#################

# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(iris)

png("#276_Scatterplot_with_rug_ggplot2.png" , width = 480, height = 480 )
ggplot(data=iris, aes(x=Sepal.Length, Petal.Length)) + geom_point() + 
  geom_rug(col="steelblue",alpha=0.1, size=1.5) 
dev.off()

         
         
# ---------------------------------------------------------------------------------------------------------------------------------------------------------



