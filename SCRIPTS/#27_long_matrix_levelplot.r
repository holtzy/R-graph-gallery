library("lattice")

## Example data
x <- seq(1,10, length.out=20)
y <- seq(1,10, length.out=20)
data <- expand.grid(X=x, Y=y)
data$Z <- runif(400, 0, 5)

## Try it out
png("#27_long_matrix_levelplot.png" , width = 480, height = 480)
par(mar=c(3,4,2,2))
levelplot(Z ~ X*Y, data=data  , xlab="X" , col.regions = heat.colors(100)[length(heat.colors(100)):1]   , main="")
dev.off()

