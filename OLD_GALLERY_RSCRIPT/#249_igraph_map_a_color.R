

# ---------------------------------------------------------------------------------------------------------------------------------------------------------
# ==== 249 IGRAPH: MAP COLOR

# Now we know how to do a Igraph and how to custom it. 
# So we can use data features to custom the graph.

# library
library(igraph)

# create data:
links=data.frame(
	source=c("A","A", "A", "A", "A","J", "B", "B", "C", "C", "D","I"),
	target=c("B","B", "C", "D", "J","A","E", "F", "G", "H", "I","I"),
	importance=(sample(1:4, 12, replace=T))
	)
nodes=data.frame(
	name=LETTERS[1:10],
	carac=c( rep("young",3),rep("adult",2), rep("old",5))
	)

# Turn it into igraph object
network=graph_from_data_frame(d=links, vertices=nodes, directed=F) 

# You can now plot it!
png("#249_igraph_map_a_color_1.png" , width = 480, height = 480 )
par(bg="grey32", mar=c(0,0,0,0))
plot(network)
dev.off()

# Let's do it, but the color of vertices depens of that carac:

# Creation of a small color palette:
png("#249_igraph_map_a_color_2.png" , width = 480, height = 480 )
par(bg="grey32", mar=c(0,0,0,0))
library(RColorBrewer)
coul = brewer.pal(3, "Set1") 
my_color=coul[as.numeric(as.factor(V(network)$carac))]
plot(network, vertex.color=my_color)
#legend
legend("bottomleft", legend=levels(as.factor(V(network)$carac))  , col = coul , bty = "n", pch=20 , pt.cex = 3, cex = 1.5, text.col=coul , horiz = FALSE, inset = c(0.1, 0.1))


dev.off()

# And what if we want the edges bigger when importance is big:
png("#249_igraph_map_a_color_3.png" , width = 480, height = 480 )
par(bg="grey32", mar=c(0,0,0,0))
E(network)$importance
plot(network, vertex.color=my_color, edge.width=E(network)$importance*2 )
legend("bottomleft", legend=levels(as.factor(V(network)$carac))  , col = coul , bty = "n", pch=20 , pt.cex = 3, cex = 1.5, text.col=coul , horiz = FALSE, inset = c(0.1, 0.1))
dev.off()



# ---------------------------------------------------------------------------------------------------------------------------------------------------------


