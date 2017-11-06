
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 238 CUSTOM LAYOUT : AXIS?

#Allows to modify all non-data components
#Type ?theme to see all the possibilities
#Inspired from theme help
# Use ‘theme()’ to modify individual components of a theme, allowing
#     you to control the appearance of all non-data components of the
#     plot. ‘theme()’ only affects a single plot: see ‘theme_update’ if
#     you want modify the active theme, to affect all subsequent plots.
     

library(ggplot2)

# Basic plot
png("#238_ggplot2_custom_layout_axis_1.png" , width = 480, height = 480 )
basic=ggplot( mtcars , aes(x=mpg, y=wt)) + geom_point()
dev.off()

# Add main title, and axis titles, and axis limits:
png("#238_ggplot2_custom_layout_axis_2.png" , width = 480, height = 480 )
basic+
	ggtitle("mpg and wt relationship") + 
	xlab("mpg value") + 
	xlim(0,50)
dev.off()

# Now we can use theme to modify the axis appearance.

#1: modify axis names:
png("#238_ggplot2_custom_layout_axis_3.png" , width = 480, height = 480 )
basic + theme(axis.title = element_text( angle = 90, color="red", size=15, face=3))
dev.off()
png("#238_ggplot2_custom_layout_axis_4.png" , width = 480, height = 480 )
basic + theme(axis.title.x = element_text( angle = 90, color="red", size=15, face=3))
dev.off()

#2: modify axis text:
png("#238_ggplot2_custom_layout_axis_5.png" , width = 480, height = 480 )
basic + theme(axis.text = element_text( angle = 90, color="blue", size=15, face=3))
dev.off()

#3: modify ticks: it is a line, so element_line, and length with awis.ticks.length
png("#238_ggplot2_custom_layout_axis_6.png" , width = 480, height = 480 )
basic + theme(axis.ticks = element_line(size = 2, color="red") , axis.ticks.length = unit(.5, "cm"))
dev.off()

#4: modify axis line
png("#238_ggplot2_custom_layout_axis_7.png" , width = 480, height = 480 )
basic + theme(axis.line = element_line(size = 3, colour = "green", linetype=2))
dev.off()


# Combine everything
png("#238_ggplot2_custom_layout_axis_8.png" , width = 480, height = 480 )
ggplot( mtcars , aes(x=mpg, y=wt)) + geom_point() +
	theme(
		axis.title = element_text( color="red", size=15, face=2),
		axis.line = element_line(size = 3, colour = "green", linetype=2),
		axis.text = element_text( angle = 90, color="blue", size=15, face=2)
		)
dev.off()
# -----------------------------------------------------------------------------------------------------------------------------------------------------

