

# ==== #255 Change Background Color
# citer stackoverflow: http://stackoverflow.com/questions/36133746/change-background-color-of-networkd3-plot/36255290
# libraries
library(networkD3)
library(htmltools)
library(webshot)
library(htmlwidgets)

# Load data
data(MisLinks)
data(MisNodes)

# Plot
graph=forceNetwork(
	Links = MisLinks, Nodes = MisNodes, 
	Source = "source", Target = "target",
	Value = "value", NodeID = "name",
	Group = "group", opacity = 0.8,
	linkDistance = JS('function(){d3.select("body").style("background-color", "#DAE3F9"); return 50;}')
 )


saveNetwork(graph,file = '#255_change_background_networkD3.html',selfcontained = T)
webshot("#255_change_background_networkD3.html", file = "#255_change_background_networkD3.png", cliprect = "viewport", vwidth = 480, vheight = 480)




