library(ggplot2)

# Basic plot
png("#240_ggplot2_custom_layout_background_1.png" , width = 480, height = 480 )
basic=ggplot(mtcars, aes(wt, mpg)) +
   geom_point()
basic
dev.off()

# color of plot background and panel background:
png("#240_ggplot2_custom_layout_background_2.png" , width = 480, height = 480 )
basic + theme(
	plot.background = element_rect(fill = "green"), 
	panel.background = element_rect(fill = "red", colour="blue")
	)
dev.off()

# Custom the grid of the panel. It is composed of major and minor grid
png("#240_ggplot2_custom_layout_background_3.png" , width = 480, height = 480 )
basic + theme(
	panel.grid.major = element_line(colour = "red", linetype = "dotted"),
	panel.grid.minor = element_line(colour = "blue", size = 2)
	)
dev.off()

# You can change only the horizontal or the vertical:
png("#240_ggplot2_custom_layout_background_4.png" , width = 480, height = 480 )
basic + theme(
	panel.grid.major.y = element_blank(),
	panel.grid.minor.y = element_blank()
)
dev.off()
