# TURN Y AXIS UPSIDE DOWN
png("#77_Turn_Y_axis_upside_down.png" , width = 480, height = 480 )

par(mar=c(5,5,1,1))

a=abs(seq(1,29)+4*runif(29,0.4))
b=seq(1,29)^2+runif(29,0.98)

plot(a~b , ylim = rev(range(a)) ,lwd=4 , type="l" , bty="n" , ylab="value of a (decreasing)" , col=rgb(0.2,0.4,0.6,0.8) )
abline(v=seq(0,900,100) , col="grey" , lwd=0.6)

dev.off()



