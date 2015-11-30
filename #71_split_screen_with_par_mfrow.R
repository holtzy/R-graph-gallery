

### MFROW

png("#71_split_screen_with_par_mfrow.png" , width = 480, height = 480 )
par(mar=c(5,5,1,1))

#Create data
a=seq(1,29)+4*runif(29,0.4)
b=seq(1,29)^2+runif(29,0.98)

par(mfrow=c(2,2))
plot( a,b , pch=20)
plot(a-b , pch=18)
hist(a, border=F , col=rgb(0.2,0.2,0.8,0.7) , main="")
boxplot(a , col="grey" , xlab="a")

dev.off()


