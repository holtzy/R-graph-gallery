png("#162_create_shaded_area.png" , width = 480, height = 480 )
cord.x <- c(-3,seq(-3,-1,0.01),-1) 
cord.y <- c(0,dnorm(seq(-3,-1,0.01)),0) 
curve(dnorm(x,0,1), xlim=c(-3,3), main='Standard Normal') 
polygon(cord.x,cord.y,col='skyblue')
dev.off()


