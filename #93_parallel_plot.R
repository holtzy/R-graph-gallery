



#PARALLEL PLOT
png("#93_parallel_plot.png" , width = 480, height = 480 )
library(MASS)
par(mar=c(4,3,1,3))
data(iris)
my_colors=colors()[as.numeric(iris$Species)*11]
parcoord(iris[,c(1:4)] , col= my_colors  )
dev.off()
