png("#89_Boxplot_with_scatter.png" , width = 480, height = 480 )
library(ggplot2)
names=c(rep("A", 80) , rep("B", 50) , rep("C", 70))
value=c( sample(2:5, 80 , replace=T) , sample(4:10, 50 , replace=T), 
       sample(1:7, 70 , replace=T) )
data=data.frame(names,value)
 
qplot( x=names , y=value , data=data , geom=c("boxplot","jitter") , fill=names)
dev.off()


