# 189 CHANGE COLOR WITH IFELSE STATEMENT

png("#189_change_color_ifelse_statement.png" , width = 480, height = 480 )
par(mar=c(3,3,1,1))
data=data.frame( my_x = 1:100 + rnorm(100,sd=9), my_y = 1:100 + rnorm(100,sd=16) )
plot(data$my_x , data$my_y, col=ifelse(data$my_x>50,"red","skyblue") , lwd=3 , xlab="value of X" , ylab="value of Y" )
abline(v=50 , col="grey")
dev.off()

