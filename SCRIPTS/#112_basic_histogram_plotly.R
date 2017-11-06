#112 Histogramms with plotly

library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")


# Basic histogram of one vecotr only
graph1=plot_ly(x = rnorm(500), type = "histogram")
#graph1
plotly_POST(graph1, filename = "#112_basic_histogram_plotly", world_readable=TRUE)
plotly_IMAGE(graph1, width = 480, height = 480, format = "png", scale = 2, out_file = "#112_basic_histogram_plotly.png")

# Overlaid histogram of 2 vectors:
graph2=plot_ly(x = rnorm(500), opacity = 0.6, type = "histogram") %>%
	add_trace(x = rnorm(500)+1) %>%
	layout(barmode="overlay")
#graph2
plotly_POST(graph2, filename = "#113_overlaid_histogram_plotly", world_readable=TRUE)
plotly_IMAGE(graph2, width = 480, height = 480, format = "png", scale = 2, out_file = "#113_overlaid_histogram_plotly.png")

