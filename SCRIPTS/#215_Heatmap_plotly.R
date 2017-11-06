
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 215 INTERACTIVE HEATMAP PLOTLY

library(plotly)
library(webshot)
Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")


# Data: mtcars:
head(mtcars)
data=as.matrix(mtcars)

# load plotly
#library(plotly)

# basic heatmap
p <- plot_ly(x=colnames(data), y=rownames(data), z = data, type = "heatmap")
tmpFile <- "/Users/holtz/Documents/WORDPRESS/R_GRAPH/#216_INTERACTIVE_HEATMAP/#215_Basic_heatmap_plotly.png"
export(p , file = tmpFile)


# Normalize by column.
# Since I did not find how to implement it In the plotly function, I propose to normalize it by hand.
data=apply(data, 2, function(x){x/mean(x)})
p <- plot_ly(x=colnames(data), y=rownames(data), z = data, type = "heatmap")
#plotly_POST(p, filename = "#215_Heatmap_plotly.png")
tmpFile <- "/Users/holtz/Documents/WORDPRESS/R_GRAPH/#216_INTERACTIVE_HEATMAP/#215_Heatmap_plotly.png"
export(p , file = tmpFile)

# Custom colors:
p=plot_ly(x=colnames(data), y=rownames(data), z = data, type = "heatmap", colors = colorRamp(c("red", "yellow")) )
tmpFile <- "/Users/holtz/Documents/WORDPRESS/R_GRAPH/#216_INTERACTIVE_HEATMAP/#215_Heatmap_plotly_color1.png"
export(p , file = tmpFile)

p=plot_ly(x=colnames(data), y=rownames(data), z = data, type = "heatmap", colorscale="Greys")
tmpFile <- "/Users/holtz/Documents/WORDPRESS/R_GRAPH/#216_INTERACTIVE_HEATMAP/#215_Heatmap_plotly_color2.png"
export(p , file = tmpFile)


p=plot_ly(x=colnames(data), y=rownames(data), z = data, type = "heatmap", colorscale= "Earth")
tmpFile <- "/Users/holtz/Documents/WORDPRESS/R_GRAPH/#216_INTERACTIVE_HEATMAP/#215_Heatmap_plotly_color3.png"
export(p , file = tmpFile)

# Remove scale:
p=plot_ly(x=colnames(data), y=rownames(data), z = data, type = "heatmap", colorscale="Greys" , showscale = F)
tmpFile <- "/Users/holtz/Documents/WORDPRESS/R_GRAPH/#216_INTERACTIVE_HEATMAP/#215_Heatmap_plotly_noscale.png"
export(p , file = tmpFile)

# -----------------------------------------------------------------------------------------------------------------------------------------------------


