png("#99_scatterplot_matrix_with_car_package.png" , width = 480, height = 480 )
par(mar=c(1,1,1,1))

library(car)
library(RColorBrewer)

data=mtcars

my_colors <- brewer.pal(nlevels(as.factor(data$cyl)), "Set2")
scatterplotMatrix(~mpg+disp+drat|cyl, data=data , reg.line="" , smoother="", col=my_colors , smoother.args=list(col="grey") , cex=1.5 , pch=c(15,16,17) , main="Scatter plot with Three Cylinder Options")

dev.off()


