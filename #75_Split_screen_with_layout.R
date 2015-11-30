par(mar=c(5,5,1,1))


# Create data
a=seq(129,1)+4*runif(129,0.4)
b=seq(1,129)^2+runif(129,0.98)

# Basic Layout : how does the screen looks like ?
png("#75_Split_screen_with_layout_1.png" , width = 480, height = 480 )
nf=layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
layout.show(nf)
dev.off()

# I add plots in the 3 screens: 
png("#75_Split_screen_with_layout_2.png" , width = 480, height = 480 )
nf=layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
hist(a , breaks=30 , border=F , col=rgb(0.1,0.8,0.3,0.5) , xlab="distribution of a" , main="")
boxplot(a , xlab="a" , col=rgb(0.8,0.8,0.3,0.5) , las=2)
boxplot(b , xlab="b" , col=rgb(0.4,0.2,0.3,0.5) , las=2)
dev.off()

# Custom Layout : If I want the left part bigger than the right part :
png("#75_Split_screen_with_layout_3.png" , width = 480, height = 480 )
nf<-layout(matrix(c(1,1,2,3),2,2,byrow=TRUE), c(3,1), c(2,2),TRUE) 
layout.show(nf)
dev.off()


#With plot within :
png("#75_Split_screen_with_layout_4.png" , width = 480, height = 480 )
nf<-layout(matrix(c(1,1,2,3),2,2,byrow=TRUE), c(3,1), c(2,2),TRUE) 
hist(a , breaks=30 , border=F , col=rgb(0.1,0.8,0.3,0.5) , xlab="distribution of a" , main="")
boxplot(a , xlab="a" , col=rgb(0.8,0.8,0.3,0.5) , las=2)
boxplot(b , xlab="b" , col=rgb(0.4,0.2,0.3,0.5) , las=2)
dev.off()


