
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

# === #248 IGRAPH: PARAMETRE GRAPHIQUES

2 MANIERES DE DONNER LES PARAMETRES GRAPHIQUES:
1/ Directement dans plot()
2/ Pour chaque attribut: V(net.bg)$color <- "orange"


# Library
library(igraph)

# Create data
set.seed(1)
data=matrix(sample(0:1, 100, replace=TRUE, prob=c(0.8,0.2)), nc=10)
network=graph_from_adjacency_matrix(data , mode='undirected', diag=F )

# Default network
par(mar=c(0,0,0,0))
png("#248_igraph_custom_features1.png" , width = 480, height = 480 )
plot(network)
dev.off()

# Modify vertex:
png("#248_igraph_custom_features2.png" , width = 480, height = 480 )
plot(network,
	vertex.color = rgb(0.8,0.2,0.2,0.9),		# Node color
	vertex.frame.color = "Forestgreen",			# Node border color
	vertex.shape=c("circle","square"),			# One of “none”, “circle”, “square”, “csquare”, “rectangle” “crectangle”, “vrectangle”, “pie”, “raster”, or “sphere”
	vertex.size=c(15:24), 	 					# Size of the node (default is 15)
	vertex.size2=NA, 	 						# The second size of the node (e.g. for a rectangle)
	)
dev.off()

# Modify vertex label
png("#248_igraph_custom_features3.png" , width = 480, height = 480 )
plot(network,
	vertex.label=LETTERS[1:10],					# Character vector used to label the nodes
	vertex.label.color=c("red","blue"),
	vertex.label.family="Times", 				# Font family of the label (e.g.“Times”, “Helvetica”)
	vertex.label.font=c(1,2,3,4),				# Font: 1 plain, 2 bold, 3, italic, 4 bold italic, 5 symbol
	vertex.label.cex=c(0.5,1,1.5),	 			# Font size (multiplication factor, device-dependent)
	vertex.label.dist=0, 						# Distance between the label and the vertex
	vertex.label.degree=0 ,	 					# The position of the label in relation to the vertex (use pi)
	)
dev.off()

# Modify Edge
png("#248_igraph_custom_features4.png" , width = 480, height = 480 )
plot(network,
	# === Edge
	edge.color=rep(c("red","pink"),5),			# Edge color
	edge.width=seq(1,10),						# Edge width, defaults to 1
	edge.arrow.size=1, 	 						# Arrow size, defaults to 1
	edge.arrow.width=1,	 						# Arrow width, defaults to 1
	#edge.lty=c(1,2), 							# Line type, could be 0 or “blank”, 1 or “solid”, 2 or “dashed”, 3 or “dotted”, 4 or “dotdash”, 5 or “longdash”, 6 or “twodash”
	edge.curved=c(rep(0,5), rep(1,5))						# Edge curvature, range 0-1 (FALSE sets it to 0, TRUE to 0.5)
	)
dev.off()
# Edge labels work like vertex.label

# Play with everything!
png("#248_igraph_custom_features5.png" , width = 480, height = 480 )
par(bg="grey15", mar=c(0,0,0,0) )
plot(network, 
	
	# === vertex
	vertex.color = rgb(0.8,0.4,0.3,0.8),					 	# Node color
	vertex.frame.color = "white",				# Node border color
	vertex.shape="circle",						# One of “none”, “circle”, “square”, “csquare”, “rectangle” “crectangle”, “vrectangle”, “pie”, “raster”, or “sphere”
	vertex.size=14, 	 							# Size of the node (default is 15)
	vertex.size2=NA, 	 						# The second size of the node (e.g. for a rectangle)
	
	# === vertex label
	vertex.label=LETTERS[1:10],					# Character vector used to label the nodes
	vertex.label.color="white",
	vertex.label.family="Times", 				# Font family of the label (e.g.“Times”, “Helvetica”)
	vertex.label.font=2, 						# Font: 1 plain, 2 bold, 3, italic, 4 bold italic, 5 symbol
	vertex.label.cex=1,	 						# Font size (multiplication factor, device-dependent)
	vertex.label.dist=0, 						# Distance between the label and the vertex
	vertex.label.degree=0 ,	 					# The position of the label in relation to the vertex (use pi)
	
	# === Edge
	edge.color="white",							# Edge color
	edge.width=4, 	 							# Edge width, defaults to 1
	edge.arrow.size=1, 	 						# Arrow size, defaults to 1
	edge.arrow.width=1,	 						# Arrow width, defaults to 1
	edge.lty="solid", 							# Line type, could be 0 or “blank”, 1 or “solid”, 2 or “dashed”, 3 or “dotted”, 4 or “dotdash”, 5 or “longdash”, 6 or “twodash”
	edge.curved=0.3	, 							# Edge curvature, range 0-1 (FALSE sets it to 0, TRUE to 0.5)

	)
dev.off()
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

