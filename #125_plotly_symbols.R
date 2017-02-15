# -----------------------------------------------------------------------------------------------------------------------------------------------------
#125 : The plotly symbols :

# Let's start by charging the plotly library and having a look to the iris dataset that we will use.
library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")


# Make data
data=expand.grid(c(1:6) , c(1:6))
data=cbind(data , my_symbol=c(1:36))
data=data[data$my_symbol<33 , ]

# Make the graph
my_graph=plot_ly(data , x=Var1 , y=Var2 , mode="markers+text" , hovermode="text" , text=my_symbol , textposition = "bottom right" , marker=list(symbol=my_symbol , size=40 , color="red" , opacity=0.7) )%>% 
layout(
	hovermode="closest",
	yaxis=list(autorange="reversed" , title="" , tickfont=list(color="white")  ) ,
	xaxis=list( title="" , tickfont=list(color="white")) 
	)


#Save
plotly_POST(my_graph, filename = "#125_plotly_symbols", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 1, out_file = "#125_plotly_symbols.png")
# -----------------------------------------------------------------------------------------------------------------------------------------------------


