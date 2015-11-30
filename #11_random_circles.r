a=rnorm(300 , mean=0 , sd=4)
b=rnorm(300 , mean=0 , sd=4)
c=rnorm(300 , mean=8 , sd=8)
par(bg="black")
par(mar=c(0,0,0,0))
plot(a ,b , cex=abs(c) , col=rgb(0.5,0.2,1,0.25) , pch=20 , 
     bty="n" , xaxt="n" , yaxt="n" , xlab="" , 
     ylab="" , xlim=c(-3,10) , ylim=c(-3,10))
#legend("bottomright", legend = expression(italic("Made with R by Holtz Yan")),)
dev.off()


