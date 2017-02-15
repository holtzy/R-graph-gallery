
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 221 GGPLOT2: CONTINUOUS COLOR PALETTES

# library
library(ggplot2)

# dataset:
head(mtcars)

# BAsic graph without any colour:
ggplot( mtcars, aes(x=wt , y=mpg)) + geom_point(size=4)

# Ok so now we want to color each point relatively to its disp value. Disp is a continuous (numeric) variable.
# So we have 4 options to choose a palette
# Attention, a chaque fois j'utilise scale_fil... ou scale_color... selon si j'utilise l'argument fill ou color
ggplot( mtcars, aes(x=wt , y=mpg, color=disp)) + geom_point(size=4)

# 1 - Scale_fill_gradient
png("#221_ggplot2_coninuous_color_palette_1.png" , width = 480, height = 480 )
ggplot( mtcars, aes(x=wt , y=mpg, color=disp)) + geom_point(size=5) + 
	scale_color_gradient(low = "black", high = "red")
dev.off()

# 2 - Three colours gradient
png("#221_ggplot2_coninuous_color_palette_2.png" , width = 480, height = 480 )
ggplot( mtcars, aes(x=wt , y=mpg, color=disp)) + geom_point(size=5) + 
	scale_fill_gradient2(midpoint = 3)
dev.off()


#3 - scale_colour_gradientn() and scale_fill_gradientn(): a custom n-colour gradient.
png("#221_ggplot2_coninuous_color_palette_3.png" , width = 480, height = 480 )
# Marche donc avec les classique cm.colors, heat.colors...
# Mais aussi avec les palette du package "colorspace"
ggplot( mtcars, aes(x=wt , y=mpg, color=disp)) + geom_point(size=5) + 
	scale_color_gradientn(colours = terrain.colors(7))
dev.off()

# 4 - Using R colorbrewer
png("#221_ggplot2_coninuous_color_palette_4.png" , width = 480, height = 480 )
ggplot( mtcars, aes(x=wt , y=mpg, color=disp)) + geom_point(size=5) + 
	scale_color_distiller(palette = "RdPu")
dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------


