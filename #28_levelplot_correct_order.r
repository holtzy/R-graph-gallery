library("lattice")

## Example data
data=matrix(runif(100, 0, 5) , 10 , 10)
colnames(data)=letters[c(1:10)]
rownames(data)=paste( rep("row",10) , c(1:10) , sep=" ")


## Try it out
png("#28_levelplot_correct_order.png" , width = 480, height = 480)
par(mar=c(3,4,2,2))
levelplot(t(data[c(nrow(data):1) , ]))
dev.off()

