png("#18_portfolio_histograms.png" , width = 800, height = 600)
png("#18_histograms.png" , width = 480, height = 480)
par(bg="grey90")
par(mar=c(0,0,0,0))
a=rnorm(400 , mean=-5 , sd=12)
b=rnorm(400 , mean=20 , sd=3)
c=rnorm(200 , mean=-20 , sd=3)
hist(a , col=rgb(1,0.2,0.2,0.7) , breaks=50 , xlim=c(-40 , 40) , main="" , ylim=c(-20 , 70) )
hist(b ,  col=rgb(0,1,0.5,1) , breaks=15 , add=T)
hist(c ,  col=rgb(0.6,0.4,1,1) , breaks=15 , add=T)
dev.off()


