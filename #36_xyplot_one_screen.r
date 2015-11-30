# create data :
sample=paste(rep("sample_",40) , seq(1,40) , sep="")
specie=c(rep("carot" , 10) , rep("cumcumber" , 10) , rep("wheat" , 10) , rep("Potatoe" , 10) )
gene1=rep(seq(5,14),4)
gene2=c( seq(1,5.5,0.5)+rnorm(10 , 4 , 2) , seq(1,20,2)+rnorm(10 , 6 , 0.5) , seq(2,11)+rnorm(10 , 5 , 2) , seq(3,12)+rnorm(10 , 4 , 10) )
data=data.frame(sample,specie,gene1,gene2)
colors=c(rgb(0.2,0.2,0.1,0.5) , rgb(0.1,0.4,0.1,0.6) , rgb(0.7,0.3,0.1,0.5) , rgb(0.2,0.2,0.9,0.5) )

# Make the graph
library(lattice)
png("#36_xyplot_one_screen.png" , width = 480, height = 480)
xyplot(gene2 ~ gene1 , data, groups = specie , type = "a", auto.key = list(corner=c(0.1,0.9) , points = FALSE, lines = FALSE, col=colors , cex=1.3) , 	lwd=5 , col=colors )
dev.off()


