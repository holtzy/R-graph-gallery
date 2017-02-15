#163 - INTERACTIVE FILLED AREA CHART PLOTLY

library(plotly)
Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

# Create data
var1=seq(1,8)
var2=c(0,1,4,1,8,7,5,4)
var3=c(7,8,4,2,1,2,0,1)

# With only one trace
p <- plot_ly(x = var1, y = var2, fill = "tozeroy")
p

#Save
plotly_POST(p, filename = "#163_Interactive_filled_area_chart_plotly")
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 1, out_file = "#163_Interactive_filled_area_chart_plotly.png")


# If you need to add a trace
p <- plot_ly(x = var1, y = var2, fill = "tozeroy")
p=add_trace(p, x = var1, y = var3, fill = "tonexty")
p

#Save
plotly_POST(p, filename = "#163_Interactive_filled_area_chart_plotly_2traces")
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 1, out_file = "#163_Interactive_filled_area_chart_plotly_2traces.png")


