png("#13_scatter_plot.png" , width = 480, height = 480)
par(bg="white")
par(mar=c(0,0,0,0))
a=seq(1:100) + 0.1*seq(1:100)*sample(c(1:10) , 100 , replace=T)
b=seq(1:100) + 0.2*seq(1:100)*sample(c(1:10) , 100 , replace=T)
plot(a,b , xlim=c(10,200) , ylim=c(10,200) , pch=20 , bg="white" , cex=3+(a/30) , col=rgb(a/300,b/300,0.9,0.9) )
abline(h=c(0,50,100,150) , v=c(0,50,100,150) , col="whitesmoke")
dev.off()


