
#http://stackoverflow.com/questions/32955163/multiple-ggplot2-plots-with-plotly


library(ggplot2)
library(gridExtra)
library(plotly)

Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")


g1<-ggplot(mpg, aes(displ, hwy, color=factor(year)))+geom_point()
g2<-ggplot(mpg, aes(cyl, hwy, color=factor(year)))+geom_point()

p=subplot( plot_ly(g1), plot_ly(g2)	)
	
	
plotly_POST(p, filename = "#92_SUBPLOT_plotly", world_readable=TRUE)
plotly_IMAGE(p, width = 480, height = 480, format = "png", scale = 2, out_file = "#92_SUBPLOT_plotly.png")


