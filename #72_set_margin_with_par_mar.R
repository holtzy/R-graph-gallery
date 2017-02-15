png("#72_set_margin_with_par_mar.png" , width = 480, height = 480 )
par(mar=c(7,8,7,7))

#Create data
a=runif(29,0.4)
hist(a, border=F , col=rgb(0.2,0.2,0.8,0.7) , main="", ylab="" , xlab="")

# Add the text
mtext(c("Margin 1","Margin 2","Margin 3","Margin 4") , at=c(0.7,0.22,0.7,1.1) , line=c(-25,-10,2,-10) , col="orange" , cex=1.5 )

dev.off()


