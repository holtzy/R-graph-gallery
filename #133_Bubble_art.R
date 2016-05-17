#ART
png("#133_Bubble_art.png" , width = 480, height = 480)
par(mar=c(0,0,0,0))
x <- seq(1:40)
y <- seq(1:40)
data <- expand.grid(X=x, Y=y)
plot(data[,1],data[,2],xaxt="n",yaxt="n", xlab="", ylab="", bty="n", mar=c(0,0,0,0), pch=20,cex=3,col=rgb(0.2,0.2,0.4,sample(seq(0.2,1,0.001) , 10000,replace=T)))
dev.off()

