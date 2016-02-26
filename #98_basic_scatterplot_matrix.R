png("#98_basic_scatterplot_matrix.png" , width = 480, height = 480 )
par(mar=c(1,1,1,1))

data=mtcars[ , c(1,3:6)]
plot(data , pch=20 , cex=1.5 , col=rgb(0.5, 0.8, 0.9, 0.7))

dev.off()
