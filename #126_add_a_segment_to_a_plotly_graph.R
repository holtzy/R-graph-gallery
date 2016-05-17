





# -----------------------------------------------------------------------------------------------------------------------------------------------------
#126 : Add a segment to a plotly graph.

# Let's start by charging the plotly library and having a look to the iris dataset that we will use.
library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

#Let's use the mtcars dataset :
head(mtcars)

# Make the graph
my_graph=plot_ly(mtcars, x = mpg, y = disp, mode = "markers" , marker=list( color=ifelse(mpg>20,"red","blue") , opacity=0.5 , size=30) ) %>%

#Add the segment with add_trace
add_trace(x = c(20, 20), y= c(min(disp), max(disp)), mode = "lines") %>%

#Layout
layout(showlegend=F)

my_graph
#Save
plotly_POST(my_graph, filename = "#126_add_a_segment_to_a_plotly_graph", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 1, out_file = "#126_add_a_segment_to_a_plotly_graph.png")
# -----------------------------------------------------------------------------------------------------------------------------------------------------




