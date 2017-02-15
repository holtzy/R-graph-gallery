# -----------------------------------------------------------------------------------------------------------------------------------------------------
#116 Print a table as an image !

# We need 2 libraries
library(ggplot2)
library(gridExtra)

#Create data : we take a subset of the mtcars dataset provided by R:
mydata <- data.frame(a=1:50, b=rnorm(50))
mytable <- cbind(sites=c("site 1","site 2","site 3","site 4"),mydata[10:13,])

# --- Graph 1 : If you want just the table in your image :
png("#116_Table_as_an_image_in_a_plot-1.png" , width = 480, height = 480)
# First I create an empty graph with absolutely nothing :
qplot(1:10, 1:10, geom = "blank") + theme_bw() + theme(line = element_blank(), text = element_blank()) +
# Then I add my table :
annotation_custom(grob = tableGrob(mytable))
dev.off()

  
# --- Graph 2 : If you want a graph AND a table on it :
png("#116_Table_as_an_image_in_a_plot-2.png" , width = 480, height = 480)
my_plot <- ggplot(mydata,aes(x=a,y=b)) + geom_point(colour="blue") +   geom_point(data=mydata[10:13, ], aes(x=a, y=b), colour="red", size=5) + 
  annotation_custom(tableGrob(mytable), xmin=35, xmax=50, ymin=-2.5, ymax=-1)
my_plot
dev.off()




