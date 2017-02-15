png("#73_box_style_with_bty.png" , width = 480, height = 480 )
par(mfrow=c(2,2))

#Create data
a=seq(1,29)+4*runif(29,0.4)
b=seq(1,29)^2+runif(29,0.98)

par(mfrow=c(2,2))
par(bty="l")
boxplot(a , col="grey" , xlab="bottom & left box")
par(bty="o")
boxplot(b , col="grey" , xlab="complete box", horizontal=TRUE)
par(bty="c")
boxplot(a , col="grey" , xlab="up & bottom & left box", width=0.5)
par(bty="n")
boxplot(a , col="grey" , xlab="no box")

dev.off()

