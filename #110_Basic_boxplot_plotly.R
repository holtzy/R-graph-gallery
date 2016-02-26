#110 Basic boxplot with plotly

library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

library(plotly)
p <- plot_ly(midwest, x = percollege, color = state, type = "box")
p

plotly_POST(p, filename = "#110_Basic_boxplot_plotly", world_readable=TRUE)
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 2, out_file = "#110_Basic_boxplot_plotly.png")

