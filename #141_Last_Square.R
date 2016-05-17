set.seed(250)
par(mar=c(0,0,0,0) , bg="white" )
plot(1,1,col="white",xlim=c(10,80) , ylim=c(10,80) ,xaxt="n", yaxt="n" , bty="n" , xlab="" , ylab="")
for(i in c(1:150)){
col=rgb( sample(seq(0,1,0.01) , 1),  sample(seq(0,1,0.01) , 1),  sample(seq(0,1,0.01) , 1), 1)
a=sample(1:100 , 1)
b=sample(1:100 , 1)
rect(a,b,a+sample(1:20 , 1),b+sample(1:40 , 1) , col="transparent", border="black", lwd=sample(1:4 , 1) )
}
legend("bottomright", legend = "© Yan Holtz", bty = "n", text.col = "gray70", cex=1.3, angle=90)

