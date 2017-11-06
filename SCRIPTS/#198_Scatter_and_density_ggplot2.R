#198 
# Chris
# rct3master@web.de
# http://chrisk91.me

png("#198_Scatter_and_density_ggplot2.png" , width = 480, height = 480 )


# create a scatterplot with a density map as background. 
#Can indicate shifts of "point clouds" very easily 
library(ggplot2) 
sample_data <- data.frame(x_values = 1:100 + rnorm(100,sd=20), y_values = 1:100 + rnorm(100,sd=27)) 
# generate sample data 
plot <- ggplot(sample_data, aes(x_values, y_values)) 
plot + stat_density2d(geom="tile", aes(fill = ..density..), contour = FALSE) + geom_point(colour = "white")

dev.off()
