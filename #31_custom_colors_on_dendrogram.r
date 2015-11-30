

# -- 1/ DATA : Let's build data.
# We have 3 species : Dicoccoides / Dicoccum / Durum
# We have 2 treatments : High or Low Nitrogen
# We have 4 samples per specie per treatment.
# For each sample we measure the expression of 5 genes

sample=paste(rep("sample_",24) , seq(1,24) , sep="")
specie=c(rep("dicoccoides" , 8) , rep("dicoccum" , 8) , rep("durum" , 8))
treatment=rep(c(rep("High",4 ) , rep("Low",4)),3)
data=data.frame(sample,specie,treatment)
for (i in seq(1:5)){
  gene=sample(c(1:40) , 24 )
  data=cbind(data , gene)
  colnames(data)[ncol(data)]=paste("gene_",i,sep="")
 }
data[data$treatment=="High" , c(4:8)]=data[data$treatment=="High" , c(4:8)]+100
data[data$specie=="durum" , c(4:8)]=data[data$specie=="durum" , c(4:8)]-30
data

# -- 2/ DISTANCES : I calculate distance between each state. For example, the euclidean distance
rownames(data)=data[,1]    
dist=dist(data[ , c(4:8)] , diag=TRUE)


# -- 3/ HIERARCHICAL CLUSTERING

	# PRINCIPLE : We have distances between objects. We seek the smallest distance between 2 objects. We aggregate the 2 objects in a cluster. These 2 points are replaced by theyr barycenter.
	# Then we seek the two points or cluster that have the smallest distance. We repeat until having only one cluster containing every points. 
	# There are several ways to calculate the distance between 2 clusters ( using the max between 2 points of the clusters, or the mean, or the min, or ward (default) ).
	
	# In R, this method is implemented in the Hclust algorythm.
	hc=hclust(dist)


# -- 4/ EASY REPRESENTATION

	# Easiest representation (2 options) : It's completely different ! So I have to be carefull concerning the distance calculation method !
	#png("#29_basic_dendrogram.png" , width = 480, height = 480)
	#par(mar=c(3,4,2,2))
	#plot(hc)
	#dev.off()



# -- 5/ MOST PROBABLE CLUSTERS : 




# -- 6/ ADVANCED REPRESENTATION

	# If I want to Zoom on a specific part of the Tree : 
	dhc=as.dendrogram(hc)
	#png("#30_zooming_on_a_part_of_dendrogram.png" , width = 480, height = 480)
	#par(mar=c(4,4,2,2))
	#plot(dhc[[2]] , main= "zoom on a part of the dendrogram")
	#dev.off()
	
	#If I want informations concerning a leaf. Each leaf has some attributes, I can print them with the function "attributes"
	specific_leaf=dhc[[1]][[1]][[1]]
	specific_leaf
	attributes(specific_leaf)
	
	
	# If I Want to color each leaf of the Tree.
	# The "dendrapply" function permits to apply a function to every leaves of the Tree.
	# I create a function which add 3 attributes to the leaf : one for the color ("lab.col") ,one for the fat "lab.font" and one for the size ("lab.cex")
	# Remarque : le signe  i <<- i + 1 permet de garder la variable i dans l'environnement GLOBAL, pas seulement en local !
		i=0
		colLab <<- function(n) {
			if(is.leaf(n)) {
				a = attributes(n)
				#Récupération des infos de ce sample. Et choix des couleurs.
				ligne=match(attributes(n)$label , data[,1])
				treatment=data[ligne , 3  ] ; if(treatment=="Low"){col_treatment="blue"} ; if(treatment=="High"){col_treatment="red"}
				specie=data[ligne , 2  ] ; if(specie=="dicoccoides"){col_specie="red"} ; if(specie=="dicoccum"){col_specie="Darkgreen"} ; if(specie=="durum"){col_specie="blue"}
				#Modification des attributs de la feuille
				attr(n, "nodePar") <- c(a$nodePar, list(cex=1.5 , lab.cex=1 , pch=20, col=col_treatment , lab.col = col_specie , lab.font = 1 , lab.cex=1))
			}
				return(n)
				}
	
	
	#-- Then I apply this function to all the leaves of my Tree
		dL <- dendrapply(dhc, colLab)
		png("#30_zooming_on_a_part_of_dendrogram.png" , width = 480, height = 480)
		par(mar=c(4,4,2,2))

		plot(dL , main="structure of the population" , axis="F")
   		legend("topright", legend = c("High Nitrogen" , "Low Nitrogen" , "Durum" , "Dicoccoides" , "Dicoccum"), col = c("red", "blue" , "blue" , "red" , "Darkgreen"), pch = c(20,20,4,4,4), bty = "n",  pt.cex = 1.5, cex = 0.8 , text.col = "black", horiz = FALSE, inset = c(0.1, 0.1))

		dev.off()

