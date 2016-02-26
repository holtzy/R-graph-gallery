png("#117_Multiple_graphs_on_one_page_ggplot2.png" , width = 480, height = 480)

# Libraries
library(gridExtra)
library(ggplot2)

# Load the diamonds dataset
data(diamonds)

# Create a histogram, assign to "plot1"
plot1 <- qplot(price,data=diamonds,binwidth=1000)

# Create a scatterplot (plot2)
plot2 <- qplot(carat,price,data=diamonds,colour = cut)

# Arrange and display the plots into a 2x1 grid
grid.arrange(plot1,plot2,ncol=1)

dev.off()


