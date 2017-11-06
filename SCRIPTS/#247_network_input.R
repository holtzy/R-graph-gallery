
# -----------------------------------------------------------------------------------------------------------------------------------------------------

#############
GRAPH #257: INPUT FORMAT FOR NETWORK ANALYSIS
#############



# ===== 1/ ADJENCY MATRIX = matrice carré.
#	** 	--> directed
#		--> undirected
#	**  --> connexion=juste des 1 ou des 0.
#		--> correlation=weighted : les relations sont plus ou moins fortes

#library
library(igraph)
set.seed(10)

# Create data
data=matrix(sample(0:2, 25, replace=TRUE), nrow=5)
colnames(data)=rownames(data)=LETTERS[1:5]

# Tell Igraph it is an adjency matrix... with default parameters
set.seed(10)
network=graph_from_adjacency_matrix(data)

# plot it
par(mar=c(1,1,1,1))
png("#247_network_input_adj1.png" , width = 480, height = 480 )
plot(network)
dev.off()

# Then you can tell if the matrix is weighted or not!
# If NOT then an unweighted graph is created and an element of the adjacency matrix gives the number of edges to create between the two corresponding vertices.
# If TRUE then the elements of the matrix give the weights of the edges (if they are not zero)
# Explanation
png("#247_network_input_adj2.png" , width = 480, height = 480 )
par(mfrow=c(1,2))
set.seed(10)
network=graph_from_adjacency_matrix(data, weighted=NULL)
plot(network, main="UNweighted")
set.seed(10)
network=graph_from_adjacency_matrix(data, weighted=TRUE)
plot(network, main="weighted")
dev.off()

# Then following this choice  The details depend on the value of the ‘mode’ argument
#help(graph_from_adjacency_matrix)



	
# ===== 2/ INCIDENCE MATRIX = matrice NON carré.
#Two-mode or bipartite graphs have two different types of actors and links that go across, but not within each type
set.seed(1)
data=matrix(sample(0:2, 15, replace=TRUE), nrow=3)
colnames(data) <- letters[1:5]
rownames(data) <- LETTERS[1:3]
set.seed(1)
network=graph_from_incidence_matrix(data)
png("#247_network_input_inc.png" , width = 480, height = 480 )
plot(network)
dev.off()
     
     
		
# ===== 3/ LIST OF EDGE AND LIST OF VERTICES: edge list
	
set.seed(10)
# create data:
links=data.frame(
	source=c("A","A", "A", "A", "A","F", "B"),
	target=c("B","B", "C", "D", "F","A","E")
	)
# Turn it into igraph object
network=graph_from_data_frame(d=links, directed=F) 
png("#247_network_input_edge1.png" , width = 480, height = 480 )
plot(network)
dev.off()

# You can provide informations concerning nodes!
nodes=data.frame(
	name=LETTERS[1:6],
	carac=c( rep(10,3), rep(30,3))
	)
# Turn it into igraph object
network=graph_from_data_frame(d=links, vertices=nodes, directed=F) 
# And thus use these new info in the plot!
png("#247_network_input_edge2.png" , width = 480, height = 480 )
plot(network, vertex.size=nodes$carac)
dev.off()

# The same but directed:
network=graph_from_data_frame(d=links, vertices=nodes, directed=T) 
png("#247_network_input_edge3.png" , width = 480, height = 480 )
plot(network, vertex.size=nodes$carac)
dev.off()


# ======= 4/ LITERAL LIST
# see  help(graph_from_literal) to understand how to create it
network=graph_from_literal( A-B-C-D, E-A-E-A, D-C-A, D-A-D-C )
png("#247_network_input_literal.png" , width = 480, height = 480 )
plot(network)
dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------



