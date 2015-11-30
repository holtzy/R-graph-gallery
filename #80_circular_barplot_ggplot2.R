# Explication :
Commencer d'abord par apprendre a faire un barplot normal --> lien vers le graphe correspondant.
Si on ajoute la fonction coord_polar --> alors on a un polar graph
Si on ne spécifie pas le ylim, alors la plus grande valeur fera le tour complet, ce qui n'est pas très jolie.


png("#80_circular_barplot_ggplot2.png" , width = 480, height = 480 )

library(ggplot2)

# make data
data=data.frame(group=c("A ","B ","C ","D ") , value=c(33,62,56,67) )

# Usual bar plot :
ggplot(data, aes(x = group, y = value ,fill = group )) + 
	geom_bar(width = 0.85, stat="identity")
	
# Circular one
ggplot(data, aes(x = group, y = value ,fill = group)) + 
	geom_bar(width = 0.85, stat="identity") +    
	
	# To use a polar plot and not a basic barplot
	coord_polar(theta = "y") +    
	
	#Remove useless labels of axis
	xlab("") + ylab("") +
    
    #Increase ylim to avoid having a complete circle
    ylim(c(0,75)) + 
    
    #Add group labels close to the bars :
    geom_text(data = data, hjust = 1, size = 3, aes(x = group, y = 0, label = group)) +
	
	#Remove useless legend, y axis ticks and y axis text
	theme(legend.position = "none" , axis.text.y = element_blank() , axis.ticks = element_blank())

dev.off()


