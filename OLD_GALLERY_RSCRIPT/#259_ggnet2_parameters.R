
# === CUSTOM APPEARANCE

# see more options here:
# https://rdrr.io/cran/GGally/man/ggnet2.html

# Libraries
library(GGally)
library(network)
library(sna)
library(ggplot2)

set.seed(1)
links=data.frame(
	source=c(sample(letters[1:20], 30, replace=T)),
	target=c(sample(letters[1:20], 30, replace=T))
	)
my_net = network(links, directed = FALSE, matrix.type="edgelist")

# Exemple 1 focus on nodes
png("#259_ggnet2_parameters1.png" , width = 480, height = 480 )
ggnet2(my_net, 
	color="steelblue", 
	alpha=0.7, 
	shape=c(rep(20,10), rep(17,10)), 
	#label.color="grey" 
	) + 
	theme(panel.background = element_rect(fill = alpha("forestgreen",0.2) ))
dev.off()

# Example 2: focus on label
png("#259_ggnet2_parameters2.png" , width = 480, height = 480 )
ggnet2(my_net, 
	color = "grey15", 
	size = 12, 
	label = TRUE, 
	label.color = c(rep("green",10), rep("pink",10))
	) +
  	theme(panel.background = element_rect(fill = "grey15"))
dev.off()
 
# Example 3: focus on edges
png("#259_ggnet2_parameters3.png" , width = 480, height = 480 )
ggnet2(my_net,
	size=5, color="skyblue",
	edge.size=c(rep(0.5,15), rep(2,15)),
	edge.lty=c(rep(2,15), rep(1,15)), 
	edge.color=c(rep("grey",15), rep("white",15))
	) +
	theme(panel.background = element_rect(fill = alpha("steelblue4",0.7) ))
dev.off()

