# --------------TRIP RAYURE

# Rayure
png("#12_rayure_1.png" , width = 480, height = 480 )
png("#12_portfolio_rayure_1.png" , width = 800, height = 600 )
par(bg="black")
par(mar=c(0,0,0,0))
plot( 1 , 1 , xlim=c(0,100) , ylim=c(0,40) , col="black")
for(i in seq(-250,50,2)){
	abline(a = i, b = 0.3, col = rgb(sample(seq(0,1,0.001) , 1) ,sample(seq(0,1,0.001) , 1),sample(seq(0,1,0.001) , 1),0.7) , lwd=sample(seq(1:50),1) )
}
dev.off()




# Rayure
png("#12_rayure_2.png" , width = 480, height = 480 )
par(bg="black")
par(mar=c(0,0,0,0))
plot( 1 , 1 , xlim=c(0,100) , ylim=c(0,40) , col="black")
for(i in seq(-250,100,2)){
	abline(a = i, b = -0.3, col = rgb(sample(seq(0,1,0.001) , 1) ,0,0,0.7) , lwd=sample(seq(1:50),1) )
}
dev.off()





