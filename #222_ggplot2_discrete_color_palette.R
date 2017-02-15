

# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 222 GGPLOT2: DISCRETE COLOR PALETTES

# library
library(ggplot2)

# dataset:
head(mtcars)

# default barplot
ggplot(mtcars, aes(x=as.factor(cyl), fill=as.factor(cyl) )) +
  geom_bar( )
  
# On a x solutions pour une variable facteur:

# - Solution 1
# scale_colour_hue(), c'est la solution par défault
# The default colour scheme, scale_colour_hue(), picks evenly spaced hues around the hcl colour wheel. This works well for up to about eight colours, but after that it becomes hard to tell the different colours apart. You can control the default chroma and luminance, and the range of hues, with the h, c and l arguments:
png("#222_ggplot2_discrete_color_palette_1.png" , width = 480, height = 480 )
ggplot(mtcars, aes(x=as.factor(cyl), fill=as.factor(cyl) )) +
  geom_bar( ) +
  scale_fill_hue(h = c(180, 300))
dev.off()

# - Solution 2:
# R color brewer palette:
png("#222_ggplot2_discrete_color_palette_2.png" , width = 480, height = 480 )
ggplot(mtcars, aes(x=as.factor(cyl), fill=as.factor(cyl) )) +
	geom_bar( ) +
	scale_fill_brewer(palette = "Set1")
dev.off()

# - Solution 3:
# SHade of grey
png("#222_ggplot2_discrete_color_palette_3.png" , width = 480, height = 480 )
ggplot(mtcars, aes(x=as.factor(cyl), fill=as.factor(cyl) )) +
	geom_bar( ) +
	scale_fill_grey() 
dev.off()

# - Solution 3:
# Manually:
png("#222_ggplot2_discrete_color_palette_4.png" , width = 480, height = 480 )
ggplot(mtcars, aes(x=as.factor(cyl), fill=as.factor(cyl) )) +
	geom_bar( ) +
	scale_fill_manual( values=c("red","green","blue"))
dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------

