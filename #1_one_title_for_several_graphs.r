
#Creating data 
Ixos=rnorm(4000,100,30)
Primadur=Ixos+rnorm(4000 , 0 , 30)

#To export the figure
png("#1_one_title_for_several_graphs.png" ,  width = 480, height = 480)

#Divide the screen in 1 line and 2 columns
par(mfrow=c(1,2),oma = c(0, 0, 2, 0))

#Make the margin around each graph a bit smaller
par(mar=c(4,2,2,2))

#Classical histogram and plot
hist(Ixos,  main="" , breaks=30 , col=rgb(0.3,0.5,1,0.4) , 
     xlab="height" , ylab="nbr of plants")
plot(Ixos , Primadur,  main="" , pch=20 , cex=0.4 , 
     col=rgb(0.3,0.5,1,0.4)  , xlab="primadur" , ylab="Ixos" )

#And I add only ONE title :
mtext("Primadur : Distribution and correlation with Ixos", 
      outer = TRUE, cex = 1.5, font=4, col=rgb(0.1,0.3,0.5,0.5) )


