# ========= IGRAPH: DIFERRENT TYPES DE LAYOUT
#layout.circle / layout.random / Génere ta propre matrice de coordonées x et y / layout.sphere / fruchterman.reingold.grid and fruchterman.reingold avec leur options / layout.kamada.kawai / layout.spring
#Exemple de boucle sur le meme data set proposé par:
#https://rpubs.com/kateto/netviz

# Get I graph library
library(igraph)

# Create data
data=matrix(sample(0:1, 400, replace=TRUE, prob=c(0.8,0.2)), nc=20)
network=graph_from_adjacency_matrix(data , mode='undirected', diag=F )

png("#247_igraph_layout_types.png" , width = 480, height = 480 )

# When ploting, we can use different layouts:
par(mfrow=c(2,2), mar=c(1,1,1,1))
plot(network, layout=layout.auto, main="auto")
plot(network, layout=layout.circle, main="circle")
plot(network, layout=layout.random, main="random")
plot(network, layout=layout.fruchterman.reingold, main="fruchterman.reingold")

dev.off()

