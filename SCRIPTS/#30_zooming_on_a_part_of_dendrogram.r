

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
	png("#30_zooming_on_a_part_of_dendrogram.png" , width = 480, height = 480)
	par(mar=c(4,4,2,2))
	plot(dhc[[2]] , main= "zoom on a part of the dendrogram")
	dev.off()
	
