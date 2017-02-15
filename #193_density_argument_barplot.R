
png( "#193_density_argument_barplot.png" , width = 480, height = 480 )
par(mar=c(3,3,1,1))
barplot( c(2,5,4,6) , density=c(5,10,20,30) , angle=c(0,45,90,11) , col="brown" , names.arg=c("A","B","C","D")  )
dev.off()

