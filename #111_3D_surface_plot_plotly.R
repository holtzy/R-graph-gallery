#111 3D graph with plotly

library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

library(plotly)
p=plot_ly(z = volcano, type = "surface")
#p

plotly_POST(p, filename = "#111_3D_surface_plot_plotly", world_readable=TRUE)
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 2, out_file = "#111_3D_surface_plot_plotly.png")

