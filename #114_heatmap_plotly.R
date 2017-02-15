
# Heatmap plotly

# Library
library(plotly)
Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

# Let's use the volcano dataset :
head(volcano)

# Let's make the basic heatmap
my_graph=plot_ly(z = volcano, type = "heatmap")
my_graph

plotly_POST(my_graph, filename = "#114_heatmap_plotly", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 2, out_file = "#114_heatmap_plotly.png")


# You can also change the colorscale using the "colorscale parameter"
plot_ly(z = volcano, colorscale = "Hot", type = "heatmap")
# Available : Hot / Greys / Greens



