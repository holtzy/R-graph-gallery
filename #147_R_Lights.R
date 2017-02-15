
#============

png("#147_R_Lights.png" , units="in", width=15, height=7, res=500)

set.seed(1)
par(mar=c(0,0,0,0) , bg="black" )
plot( x=c(4,4) , y=c(0,20) ,  xlim=c(6,40) , ylim=c(2,18) , xaxt="n",yaxt="n", xlab="", ylab="", bty="n" , col=rgb(0.5,0.5,0.5, 0.8) , main="" , type="l" , lwd=0.1  )

# 1
for(i in 1:1000){
	a=rnorm(1.5, 3 , n=1)
	points( x=c(4+a, 4-a) , y=c(0+rnorm(0.3, n=1), 60+rnorm(0.3, n=1)) , col=rgb(0.9,0.4,0.2, 0.5)  , type="l", lwd=0.3)
}
# 2
for(i in 1:1000){
	a=rnorm(1.5, 3 , n=1)
	points( x=c(13+a, 13-a) , y=c(-45+rnorm(0.3, n=1), 25+rnorm(0.3, n=1)) , col=rgb(1,0.5,0.7, 0.4)   , type="l", lwd=0.3)
}
# 3
for(i in 1:1000){
	a=rnorm(1.5, 4 , n=1)
	points( x=c(20+a, 18-a) , y=c(-15+rnorm(0.3, n=1), 30+rnorm(0.3, n=1)) , col=rgb(0.1,0.9,0.2, 0.4)  , type="l", lwd=0.3)
}
# 4
for(i in 1:1000){
	a=rnorm(1.5, 4 , n=1)
	points( x=c(25+a, 26-a) , y=c(-10+rnorm(0.3, n=1), 70+rnorm(0.3, n=1)) , col=rgb(1,0.6,1, 0.4)  , type="l", lwd=0.3)
}
# 5
for(i in 1:1000){
	a=rnorm(1.5, 4 , n=1)
	points( x=c(30+a, 29-a) , y=c(-25+rnorm(0.3, n=1), 75+rnorm(0.3, n=1)) , col= rgb(0.6,0.7,0.2, 0.3) , type="l", lwd=0.7)
}
# 6
for(i in 1:1000){
	a=rnorm(1.5, 4 , n=1)
	points( x=c(26+a, 43-a) , y=c(-42+rnorm(0.3, n=1), 34+rnorm(0.3, n=1)) , col=rgb(1,0.2,0.5, 0.4)  , type="l", lwd=0.7)
}
legend("bottomright", legend = "© Yan Holtz", bty = "n", text.col = "white", cex=0.9, angle=90)

dev.off()
