png("#79_levelplot_with_ggplot2.png" , width = 480, height = 480 )

## Example data
x <- seq(1,10, length.out=20)
y <- seq(1,10, length.out=20)
data <- expand.grid(X=x, Y=y)
data$Z <- runif(400, 0, 5)

# Levelplot with ggplot2
library(ggplot2)
ggplot(data, aes(X, Y, z= Z)) + geom_tile(aes(fill = Z)) + theme_bw()

# To change the color of the gradation :
ggplot(data, aes(X, Y, z= Z)) + geom_tile(aes(fill = Z)) + theme_bw() + scale_fill_gradient(low="white", high="blue") 


dev.off()

