

# -----------------------------------------------------------------------------------------------------------------------------------------------------
#124 : change hover text with plotly

# You can change the hover text with the hoverinfo option.
# Any combination of "x", "y", "z", "text", "name" joined with a "+" OR "all" or "none". 
# If you give "text", you have to give an other argument: text, where you add a vector containing the text for each point.


Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

# Let's start by charging the plotly library and having a look to the iris dataset that we will use.
library(plotly)

# Make data
x=seq(1,10,0.3)
a=rnorm(length(x))*0.2
data=data.frame(x=x , y=-log(x)+a , my_size=a)

# Add a column with the hover text of each point
data$my_text=paste("Write what you want | Value of a : " , round(data$my_size,2)   , sep="")

# Make the plot
my_graph=plot_ly(data, x=x , y=y , mode="markers"   , text=my_text , hoverinfo="text+x+y" , marker=list(color="green" , size=20 , opacity=0.4))
my_graph

# Save it
plotly_POST(my_graph, filename = "#124_Change_hover_text_plotly", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 2, out_file = "#124_Change_hover_text_plotly.png")


