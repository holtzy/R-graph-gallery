#107 Basic scatter plot with plotly

library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

# Let's use the diamonds data set :
d <- diamonds[sample(nrow(diamonds), 1000), ]

# Make a basic scatter plot :
p=plot_ly(d, x = carat, y = price, text = paste("Clarity: ", clarity),
        mode = "markers", color = carat, size = carat)
p
	
	
plotly_POST(p, filename = "#107_Basic_scatterplot_with_plotly", world_readable=TRUE)
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 2, out_file = "#107_Basic_scatterplot_with_plotly.png")

