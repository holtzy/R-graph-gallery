#Create data
names=c(rep("A", 20) , rep("B", 20) , rep("C", 20), rep("D", 20))
value=c( sample(2:5, 20 , replace=T) , sample(6:10, 20 , replace=T), sample(1:7, 20 , replace=T), sample(3:10, 20 , replace=T) )
data=data.frame(names,value)

#Boxplot classique
boxplot(data$value ~ data$names)

#png
png("#22_reorder_boxplot_by_names.png" , width = 480, height = 480)

# Pour réordonner les expé dans l'ordre quinous convient.
data$names=factor(data$names , levels=levels(data$names)[c(1,4,3,2)])
boxplot(data$value ~ data$names , col=rgb(0.3,0.5,0.4,0.6) , ylab="value" , xlab="names in desired order")

#
dev.off()
