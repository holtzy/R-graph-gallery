
png("#group_comparison_with_ggplot2.png" , width = 480, height = 480 )


#Create Data
names=c(rep("A", 20) , rep("B", 8) , rep("C", 30), rep("D", 80))
value=c( sample(2:5, 20 , replace=T) , sample(4:10, 8 , replace=T), sample(1:7, 30 , replace=T), sample(3:8, 80 , replace=T) )
data=data.frame(names,value)

#Package
library(ggplot2)

#Calculation of mean and sd of each group ?
my_mean=aggregate(data$value , by=list(data$names) , mean) ; colnames(my_mean)=c("names" , "mean")
my_sd=aggregate(data$value , by=list(data$names) , sd) ; colnames(my_sd)=c("names" , "sd")
my_info=merge(my_mean , my_sd , by.x=1 , by.y=1)

# Make the plot
ggplot(data) + 
	geom_point(aes(x = names, y = value) , colour=rgb(0.8,0.7,0.1,0.4) , size=5) + 
	geom_point(data = my_info, aes(x=names , y = mean) , colour = rgb(0.6,0.5,0.4,0.7) , size = 8) +
	geom_errorbar(data = my_info, aes(x = names, y = sd, ymin = mean - sd, ymax = mean + sd), colour = rgb(0.4,0.8,0.2,0.4) , width = 0.7 , size=1.5)

dev.off()

