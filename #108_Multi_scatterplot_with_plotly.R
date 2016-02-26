library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

# Let's use the diamonds data set :
d <- diamonds[sample(nrow(diamonds), 1000), ]

p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Clarity:", clarity)), size = 4) +
  geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

p=ggplotly(p)
p
	
plotly_POST(p, filename = "#108_Multi_scatterplot_with_plotly", world_readable=TRUE)
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 2, out_file = "#108_Multi_scatterplot_with_plotly.png")

