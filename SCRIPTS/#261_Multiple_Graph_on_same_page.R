

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 161: MULTIPLE GGPLOT2 GRAPH ON ONE PAGE
#################



# libraries
library(ggplot2)
library(gridExtra)

# Make 3 simple graphics:
g1=ggplot(mtcars, aes(x=qsec)) + geom_density(fill="slateblue")
g2=ggplot(mtcars, aes(x=drat, y=qsec, color=cyl)) + geom_point(size=5) + theme(legend.position="none")
g3=ggplot(mtcars, aes(x=factor(cyl), y=qsec, fill=cyl)) + geom_boxplot() + theme(legend.position="none")
g4=ggplot(mtcars , aes(x=factor(cyl), fill=factor(cyl))) +  geom_bar()

# Show the 4 plots on the same page
grid.arrange(g1, g2, g3, g4, ncol=2, nrow =2)

# Different size
png("#261_Multiple_Graph_on_same_page_1.png" , width = 480, height = 480 )
grid.arrange(g2, arrangeGrob(g3, g4, ncol=2), nrow = 2)
dev.off()
png("#261_Multiple_Graph_on_same_page_2.png" , width = 480, height = 480 )
grid.arrange(g1, g2, g3, nrow = 3)
dev.off()
png("#261_Multiple_Graph_on_same_page_3.png" , width = 480, height = 480 )
grid.arrange(g2, arrangeGrob(g3, g4, ncol=2), nrow = 1)
dev.off()
png("#261_Multiple_Graph_on_same_page_4.png" , width = 480, height = 480 )
grid.arrange(g2, arrangeGrob(g3, g4, nrow=2), nrow = 1)
dev.off()
