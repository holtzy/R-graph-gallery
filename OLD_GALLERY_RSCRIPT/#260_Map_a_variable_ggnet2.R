# === MAP A COLOR !
# Libraries
library(GGally)
library(network)
library(sna)
library(ggplot2)

# data: Adjacency matrix
set.seed(10)
data=matrix(sample(0:2, 25, replace=TRUE), nrow=5)
colnames(data)=rownames(data)=LETTERS[1:5]

# Make a network
my_net = network(data, directed = FALSE, matrix.type="adjacency")

# If you have feature for each node, add it to the network object
my_net %v% "group" = c("GroupA","GroupA","GroupB","GroupB","GroupC")

# Map group to color
png("#260_Map_a_variable_ggnet2_1.png" , width = 480, height = 480 )
ggnet2(my_net, color = "group", palette = "Set2")
dev.off()

# Map group to size
png("#260_Map_a_variable_ggnet2_2.png" , width = 480, height = 480 )
ggnet2(my_net, color = "grey",  size="group", size.palette = c("GroupA" = 2, "GroupB" = 10, "GroupC" = 20))
dev.off()


