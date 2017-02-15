

###########################
## INteractive I graph using networkD3 package
# https://christophergandrud.github.io/networkD3/
# networkD3 produces HTML code for an interactive graph using d3.js
library("networkD3")

# Create data with the randomNames package :
library('randomNames') 
library("igraph")
NUMOFLINKS = 100
relations = data.frame(source = randomNames(1000,which.names='both'), target = "")
relations = relations[rep(seq_len(nrow(relations)), sample(1:10,nrow(relations), replace=T)),]
relations = relations[sample(nrow(relations),NUMOFLINKS),] 
relations$target = sample(relations$source,nrow(relations), replace = T)
relations = relations[relations[,1]!=relations[,2], ] 
vertices<-data.frame("name" = unique(unlist(relations))) # node names
g = graph.data.frame(relations, directed=F, vertices=vertices) # raw graph
vertices$group = edge.betweenness.community(g)$membership # betweeness centrality for each node for grouping


# create indices for each name to fit forceNetwork data format
relations$source.index = match(relations$source, vertices$name)-1
relations$target.index = match(relations$target, vertices$name)-1

# sophisticated network graph
d3 = forceNetwork(Links = relations, Nodes = vertices,
             Source = "source.index", Target = "target.index",
             NodeID = "name",
             Group = "group", # color nodes by betweeness calculated earlier
             charge = -70, # node repulsion
             linkDistance = 25,
             zoom = T)

# If you want to show the graph
#show(d3)

#If you want to save the graph as html file
saveNetwork(d3,file = '#87_Interactive_network.html',selfcontained = F)
saveNetwork(d3,file = '#87_Interactive_network.html',selfcontained = T)




