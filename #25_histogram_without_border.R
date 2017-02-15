# Creating data 
my_variable=c(rnorm(1000 , 0 , 2) , rnorm(1000 , 9 , 2))

# Draw the histogram with border=F
png("#25_histogram_without_border.png" , width = 480, height = 480)
par(mar=c(3,4,2,2))
hist(my_variable , breaks=40 , col=rgb(0.2,0.8,0.5,0.5) , border=F , main="")
dev.off()

