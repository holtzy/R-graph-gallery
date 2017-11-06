
# === INPUT DATA
# For ggnet2, input data must be turn as a network object comming from the network library.
# It is quite easy to use, here are 3 exemples making network from the 3 most common format:

# Libraries
library(GGally)
library(network)
library(sna)
library(ggplot2)

# Adjacency matrix
set.seed(10)
data=matrix(sample(0:2, 25, replace=TRUE), nrow=5)
colnames(data)=rownames(data)=LETTERS[1:5]
my_net = network(data, directed = FALSE, matrix.type="adjacency")
png("#258_ggnet2_input_format1.png" , width = 480, height = 480 )
ggnet2(my_net, label = TRUE)
dev.off()

# Incidence matrix
set.seed(1)
data=matrix(sample(0:2, 15, replace=TRUE), nrow=3)
colnames(data) <- letters[1:5]
rownames(data) <- LETTERS[1:3]
#my_net = network(data, directed = FALSE, matrix.type="incidence")
my_net=network(data, matrix.type = "bipartite", ignore.eval = FALSE, names.eval = "weights")
png("#258_ggnet2_input_format2.png" , width = 480, height = 480 )
ggnet2(my_net, label = TRUE)
dev.off()

# Edge list
links=data.frame(
	source=c("A","A", "A", "A", "A","F", "B"),
	target=c("B","B", "C", "D", "F","A","E")
	)
my_net = network(links, directed = FALSE, matrix.type="edgelist")
png("#258_ggnet2_input_format3.png" , width = 480, height = 480 )
ggnet2(my_net, label = TRUE)
dev.off()

