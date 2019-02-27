


# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 268: BOXPLOT FROM CONTINUOUS VARIABLE	
#################

# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mpg)

# plot
png("#268_boxplot_continuous_variable_ggplot2.png" , width = 480, height = 480 )
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_boxplot(fill="skyblue", aes(group = cut_width(carat, 0.5)))
dev.off()

# ---------------------------------------------------------------------------------------------------------------------------------------------------------



