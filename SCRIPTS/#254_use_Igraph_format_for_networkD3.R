

# ==== #254 USE IGRAPH OBJECT AS INPUT!
#There are several format available to run networkD3

#library
library(igraph)
library(networkD3)
library(webshot)

# Create data
data=matrix(sample(0:1, 400, replace=TRUE, prob=c(0.95,0.05) ), nrow=20)

# Tell Igraph it is an adjency matrix... with default parameters
network=graph_from_adjacency_matrix(data)

# transform Igraph format in somthing readable
network=igraph_to_networkD3(network)

# plot
graph=simpleNetwork(network$links,
		height = 480, 				# height of frame area in pixels
		width = 480,
		linkDistance = 120, 		# distance between node. Increase this value to have more space between nodes
		charge = -480, 				# numeric value indicating either the strength of the node repulsion (negative value) or attraction (positive value)
		fontSize = 27, 				# size of the node names
		linkColour = rgb(0.1,0.9,0.1,0.3), 		# colour of edges, MUST be a common colour for the whole graph
		nodeColour = "forestgreen",		 	# colour of nodes, MUST be a common colour for the whole graph
		opacity = 0.9, 				# opacity of nodes. 0=transparent. 1=no transparency
)

saveNetwork(graph,file = '#254_use_Igraph_format_for_networkD3.html',selfcontained = T)
webshot("#254_use_Igraph_format_for_networkD3.html", file = "#254_use_Igraph_format_for_networkD3.png", cliprect = "viewport", vwidth = 480, vheight = 480)



