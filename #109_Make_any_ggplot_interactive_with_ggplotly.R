library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")

# Let's remake the graph #50 : a very basic scatter plot :
library(ggplot2)
data=data.frame(cond = rep(c("condition_1", "condition_2"), each=10), my_x = 1:100 + rnorm(100,sd=9), my_y = 1:100 + rnorm(100,sd=16) )
my_graph=ggplot(data, aes(x=my_x, y=my_y)) + geom_point(shape=1)

# Let's make it interactive using the ggplotly function !
p=ggplotly(my_graph)
p

plotly_POST(p, filename = "#109_Make_any_ggplot_interactive_with_ggplotly", world_readable=TRUE)
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 2, out_file = "#109_Make_any_ggplot_interactive_with_ggplotly")

