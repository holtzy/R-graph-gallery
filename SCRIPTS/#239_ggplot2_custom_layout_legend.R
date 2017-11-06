
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 239 CUSTOM LAYOUT : LEGEND

#more info here
#http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/
#inspired from the help section of theme
#http://docs.ggplot2.org/current/guide_legend.html

library(ggplot2)

# Basic graph: there are 2 legends: one of each level of aestetic:
png("#239_ggplot2_custom_layout_legend_1.png" , width = 480, height = 480 )
basic=ggplot(mtcars, aes(wt, mpg, colour = factor(cyl), shape = factor(vs) )) +
       geom_point()
basic
dev.off()

# Change the title of each aestetic in the legend:
png("#239_ggplot2_custom_layout_legend_2.png" , width = 480, height = 480 )
basic+labs(
         colour = "name1",
         shape = "name2"
        )
dev.off()

# Remove one legend but not the other?
png("#239_ggplot2_custom_layout_legend_10.png" , width = 480, height = 480 )
basic + guides(shape=FALSE)
dev.off()


# remove or Change Position
png("#239_ggplot2_custom_layout_legend_3.png" , width = 480, height = 480 )
basic + theme(legend.position = "none")
dev.off()
png("#239_ggplot2_custom_layout_legend_4.png" , width = 480, height = 480 )
basic + theme(legend.position = "bottom")
dev.off()


# Or place inside the plot using relative coordinates between 0 and 1
# legend.justification sets the corner that the position refers to
png("#239_ggplot2_custom_layout_legend_5.png" , width = 480, height = 480 )
basic + theme(
	legend.position = c(.95, .95),
	legend.justification = c("right", "top"),
	legend.box.just = "right",
	legend.margin = margin(6, 6, 6, 6)
	)
dev.off()

# contour: The legend.box properties work similarly for the space around
# all the legends
png("#239_ggplot2_custom_layout_legend_6.png" , width = 480, height = 480 )
basic + theme(
	legend.box.background = element_rect(color="red", size=2),
	legend.box.margin = margin(116, 6, 6, 6)
)
dev.off()

# You can also control the display of the keys
# and the justifaction related to the plot area can be set
png("#239_ggplot2_custom_layout_legend_7.png" , width = 480, height = 480 )
basic + theme(legend.key = element_rect(fill = "white", colour = "black"))
dev.off()
png("#239_ggplot2_custom_layout_legend_8.png" , width = 480, height = 480 )
basic + theme(legend.text = element_text(size = 8, colour = "red"))
dev.off()
png("#239_ggplot2_custom_layout_legend_9.png" , width = 480, height = 480 )
basic + theme(legend.title = element_text(face = "bold"))
dev.off()
# -----------------------------------------------------------------------------------------------------------------------------------------------------



