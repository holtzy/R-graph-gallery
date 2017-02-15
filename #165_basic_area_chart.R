png("#165_basic_area_chart.png" , width = 480, height = 480 )
par(mar=c(3,4,1,2))

# Create data
data=data.frame(my_x=seq(1,10), my_size=sample(seq(1,15),10))

# Use the polygon function to draw the graph
plot( data$my_x , data$my_size , col=rgb(0.2,0.1,0.5,0.9) , type="o" , lwd=3 , xlab="" , ylab="size" , pch=20)
polygon( c(min(data$my_x), data$my_x , max(data$my_x)) , c( min(data$my_size) , data$my_size , min(data$my_size)) , col=rgb(0.2,0.1,0.5,0.2) , border=F)

dev.off()
