#### DONNES QUALI : ON VA REPRESENTER LA PROPORTION DE 1.


#Création d'un vecteur avec toutes les commbinaisons dans l'ordre)
name= c("DD","with himself","with DC","with Silur" ,"DC","with himself","with DD","with Silur" ,"Silur","with himself","with DD","with DC" )
average= sample(seq(1,10) , 12 , replace=T)
number= sample(seq(4,39) , 12 , replace=T)
data=data.frame(name,average,number)

png("#26_add_number_of_value_onto_a_boxplot.png" , width = 480, height = 480)


#Gestion des marges)
par(mar=c(7,2,2,2))


#Représentation du tableau bil :
my_bar=barplot(data$average , border=F , names.arg=data$name , las=2 , col=c(rgb(0.3,0.1,0.4,0.6) , rgb(0.3,0.5,0.4,0.6) , rgb(0.3,0.9,0.4,0.6) ,  rgb(0.3,0.9,0.4,0.6)) , ylim=c(0,11) , main="" )
abline(v=c(4.9 , 9.7) , col="grey")

#Ajout du texte 
text(my_bar, data$average+0.4 , paste("n = ",data$number,sep="") ,cex=1) 

#Legende
legend("topleft", legend = c("Alone","with Himself","With other genotype" ) , col = c(rgb(0.3,0.1,0.4,0.6) , rgb(0.3,0.5,0.4,0.6) , rgb(0.3,0.9,0.4,0.6) ,  rgb(0.3,0.9,0.4,0.6)) , bty = "n", pch=20 , pt.cex = 2, cex = 0.8, horiz = FALSE, inset = c(0.05, 0.05))

dev.off()
