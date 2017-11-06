
# ==== #253: go further with force Network
# Load package
library(networkD3)
library(webshot)

# create data:
set.seed(101)
links=data.frame(
	source=c("A","A", "A", "A", "A","J", "B", "B", "C", "C", "D","I"),
	target=c("B","B", "C", "D", "J","A","E", "F", "G", "H", "I","I"),
	my_width=seq(1,48,4)
	)
nodes=data.frame(
	name=LETTERS[1:10],
	carac=c( rep("young",3),rep("adult",2), rep("old",5)),
	size=seq(1,20,2)
	)

# The Nodes ID MUST be numeric and start from 0!
links$source=as.numeric(as.factor(links$source))-1
links$target=as.numeric(as.factor(links$target))-1

#plot
graph=forceNetwork(
	Links=links, 
	Nodes=nodes, 
	NodeID = "name", 
	Group = "carac"
	)
saveNetwork(graph,file = '#253_interactive_network_custom_chart1.html',selfcontained = T)

# And nodes must be in the same order than links$target!
# a vérifier

# Custom the plot
graph=forceNetwork(Links=links, Nodes=nodes, NodeID = "name", Group = "carac",
		
		# -- custom nodes and labels
		Nodesize="size",													# column names that gives the size of nodes
		radiusCalculation = JS(" d.nodesize^2+10"), 							# How to use this column to calculate radius of nodes? (Java script expression)
		opacity = 0.6, 														# Opacity of nodes when you hover it
		opacityNoHover = 0.6,												# Opacity of nodes you do not hover
		colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"),   		# Javascript expression, schemeCategory10 and schemeCategory20 work
		fontSize = 17,														# Font size of labels
		fontFamily = "serif", 												# Font family for labels

		# custom edges
		Value="my_width",
		arrows = FALSE, 													# Add arrows?
		linkColour = c("grey","orange"), 									# colour of edges
		linkWidth = JS("function(d) { return Math.sqrt(d.value); }"),		# edges width

		# layout
		linkDistance = 250,													# link size, if higher, more space between nodes
		charge = -50,														# if highly negative, more space betqeen nodes
				
		# -- general parameters
		height = NULL, 														# height of frame area in pixels
		width = NULL,
		zoom = TRUE, 														# Can you zoom on the figure
		legend = TRUE,														# add a legend?
		bounded = F, 
		clickAction = NULL
		)
       
saveNetwork(graph,file = '#253_interactive_network_custom_chart2.html',selfcontained = T)
webshot("#253_interactive_network_custom_chart2.html", file = "#253_interactive_network_custom_chart2.png", cliprect = "viewport", vwidth = 480, vheight = 480)


