#Create data
Ixos=rnorm(4000 , 100 , 30)	
Primadur=rnorm(4000 , 200 , 30)	

#Represent separately
png("#2two_hist_melt_colors_step1.png" ,  width = 480, height = 480)
par(mfrow=c(1,2))
hist(Ixos, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="height" , 
     ylab="nbr of plants" , main="" )
hist(Primadur, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="height" , 
     ylab="nbr of plants" , main="")
dev.off()

#But it is hard to visualize differences in the distribution. It would be more interesting to have both distribution on the same graph, with transparency permitting to see the whole distribution :
png("#2two_hist_melt_colors_step2.png" ,  width = 480, height = 480)
hist(Ixos, breaks=30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab="height", 
     ylab="nbr of plants", main="distribution of height of 2 durum wheat varieties" )
hist(Primadur, breaks=30, xlim=c(0,300), col=rgb(0,0,1,0.5), add=T)
legend("topright", legend=c("Ixos","Primadur"), 
      col=c(rgb(1,0,0,0.5), rgb(0,0,1,0.5)), pt.cex=2, pch=15 )
dev.off()





