# Let's start by charging the plotly library and having a look to the iris dataset that we will use.
library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

# Create data
my_y=rnorm(10)*3
my_x=seq(0,10)

# Let's do a first plot
p<-plot_ly(y=my_y, x=my_x , evaluate=TRUE)
#%>%
#layout(yaxis=list(range=c(-10,10)))

# Add 5 trace to this graphic with a loop!
for(i in 1:3){
	my_y=rnorm(10)
	p<-add_trace(y=my_y, x=my_x , evaluate=TRUE)
	p=layout(yaxis=list(range=c(-10,9)))
}

print(p)

#Save
plotly_POST(p, filename = "#129_use_a_loop_to_add_trace_plotly", world_readable=TRUE)
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 1, out_file = "#129_use_a_loop_to_add_trace_plotly.png")

