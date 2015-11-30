#50 scatterplot with ggplot2
data=data.frame(cond = rep(c("condition_1", "condition_2"), each=10), my_x = 1:100 + rnorm(100,sd=9), my_y = 1:100 + rnorm(100,sd=16) )
library(ggplot2)

png("#50_basic_scatterplot_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(x=my_x, y=my_y)) + geom_point(shape=1)
dev.off()

png("#51_scatterplot_and_linear_model_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(x=my_x, y=my_y)) +    geom_point(shape=1) +  geom_smooth(method=lm , color="red", se=FALSE)  # Add linear regression line 
dev.off()

png("#51_scatterplot_linear_model_with_CI_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(x=my_x, y=my_y)) +    geom_point(shape=1) +  geom_smooth(method=lm , color="red")   # Add linear regression line 
dev.off()



