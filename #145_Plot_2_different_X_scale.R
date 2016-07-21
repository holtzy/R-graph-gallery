
#library
library(latticeExtra)

# create data
set.seed(1)
x = 1:100
var1 = cumsum(rnorm(100))
var2 = var1^2
data=data.frame(x,var1,var2)


## Note that with the xyplot function, you can easily show both var in the same time :
png("#145_Plot_2_different_X_scale1.png" , width = 480, height = 480 )
xyplot(var1 + var2 ~ x, data, type = "l")
dev.off()

## But it could be nice to have TWO Y axis!

# --> construct separate plots for each series
obj1 <- xyplot(var1 ~ x, data, type = "l" , lwd=2)
obj2 <- xyplot(var2 ~ x, data, type = "l", lwd=2)

# --> Make the plot with second y axis:
png("#145_Plot_2_different_X_scale2.png" , width = 480, height = 480 )
doubleYScale(obj1, obj2, add.ylab2 = TRUE)
dev.off()

## Same graph with a key legend
png("#145_Plot_2_different_X_scale3.png" , width = 480, height = 480 )
doubleYScale(obj1, obj2, text = c("obj1", "obj2") , add.ylab2 = TRUE)
dev.off()
