# Create data with the randomNames package :
library('randomNames') 
NUMOFLINKS = 100
relations = data.frame(source = randomNames(1000,which.names='both'), target = "")
relations = relations[rep(seq_len(nrow(relations)), sample(1:10,nrow(relations), replace=T)),]
relations = relations[sample(nrow(relations),NUMOFLINKS),] 
relations$target = sample(relations$source,nrow(relations), replace = T)
relations = relations[relations[,1]!=relations[,2], ] 

#The table looks like that
head(relations)

## Plot the graphs using IGRAPH package
library("igraph")
vertices<-data.frame("name" = unique(unlist(relations))) # node names
g = graph.data.frame(relations, directed=F, vertices=vertices) # raw graph
vertices$group = edge.betweenness.community(g)$membership # betweeness centrality for each node for grouping
png("#86_network-igraph.png", width = 480, height = 480 )

plot(g,
     mark.groups=vertices$group, # group vertices by betweeness indicator (redish blob background)
     layout=layout.auto, 
     vertex.color = vertices$group, # color vertices by edge betweeness
     vertex.label=NA, # no vertex label (name)
     vertex.size=5,
     edge.arrow.size=0.8)

dev.off()
