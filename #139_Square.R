# SQUARE ART
for(v in c(1:100)){
name=paste("num",v,".png",sep="")
png(name , units="in", width=7, height=11, res=500 )

set.seed(v)
par(mar=c(0,0,0,0) , bg="white" )
plot(1,1,col="white",xlim=c(1,100) , ylim=c(1,100) ,xaxt="n", yaxt="n" , bty="n" , xlab="" , ylab="")
for(i in c(1:10)){
col=rgb( sample(seq(0,1,0.01) , 1),  sample(seq(0,1,0.01) , 1),  sample(seq(0,1,0.01) , 1), 0.4)
rect(sample(1:100 , 1),sample(1:100 , 1),sample(1:100 , 1),sample(1:100 , 1) , col=col, border="black")
}
dev.off()
}

png("#139_Square.png" , units="in", width=7, height=11, res=500 )
set.seed(27)
par(mar=c(0,0,0,0) , bg="white" )
plot(1,1,col="white",xlim=c(1,100) , ylim=c(1,90) ,xaxt="n", yaxt="n" , bty="n" , xlab="" , ylab="")
for(i in c(1:10)){
col=rgb( sample(seq(0,1,0.01) , 1),  sample(seq(0,1,0.01) , 1),  sample(seq(0,1,0.01) , 1), 0.4)
rect(sample(1:100 , 1),sample(1:100 , 1),sample(1:100 , 1),sample(1:100 , 1) , col=col, border="black")
}
legend("bottomleft", legend = "© Yan Holtz", bty = "n", text.col = "gray70", cex=1.3)
dev.off()


