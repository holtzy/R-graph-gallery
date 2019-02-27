# Count the number of degree for each node:
deg=degree(network, mode="all")

png("#251_network_with_node_size_based_on_edges_numbers.png" , width = 480, height = 480 )
par(mar=c(0,0,0,0))
plot(network, vertex.size=deg*6, vertex.color=rgb(0.1,0.7,0.8,0.5) )
dev.off()

