
#Library
library(ggplot2)

#mtcars data
head(mtcars)

# First type of color
png("#95_Violin_plot_ggplot2_1.png" , width = 480, height = 480 )
p <- ggplot(mtcars, aes(factor(cyl), mpg))
p + geom_violin(aes(fill = cyl))
dev.off()

# Second type
png("#95_Violin_plot_ggplot2_2.png" , width = 480, height = 480 )
p <- ggplot(mtcars, aes(factor(cyl), mpg))
p + geom_violin(aes(fill = factor(cyl)))
dev.off()

