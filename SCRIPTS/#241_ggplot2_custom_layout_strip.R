library(ggplot2)

# basic
png("#241_ggplot2_custom_layout_strip_1.png" , width = 480, height = 480 )
basic=ggplot(mtcars, aes(wt, mpg)) +
	geom_point() +
	facet_wrap(~ cyl)
basic
dev.off()

# Change background
png("#241_ggplot2_custom_layout_strip_2.png" , width = 480, height = 480 )
basic + theme(strip.background = element_rect(colour = "red", fill = alpha("blue",0.2) ))
dev.off()

# Change the text features:
png("#241_ggplot2_custom_layout_strip_3.png" , width = 480, height = 480 )
basic + theme(strip.text.x = element_text(colour = "red", face = "bold", size=10, angle=30))
dev.off()

# Change the space between parts:
png("#241_ggplot2_custom_layout_strip_4.png" , width = 480, height = 480 )
basic + theme(panel.spacing = unit(4, "lines"))
dev.off()

