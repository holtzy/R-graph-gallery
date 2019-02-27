par(mar=c(3,3,1,1))

library(ggplot2)
library(gridExtra)

set.seed(123)
var=rnorm(1000)

# Without theme
plot1 <- qplot(var , fill=I(rgb(0.1,0.2,0.4,0.6)) )

# With themes
plot2 = plot1+theme_bw()+annotate("text", x = -1.9, y = 75, label = "bw()" , col="orange" , size=4)
plot3 = plot1+theme_classic()+annotate("text", x = -1.9, y = 75, label = "classic()" , col="orange" , size=4)
plot4 = plot1+theme_gray()+annotate("text", x = -1.9, y = 75, label = "gray()" , col="orange" , size=4)
plot5 = plot1+theme_linedraw()+annotate("text", x = -1.9, y = 75, label = "linedraw()" , col="orange" , size=4)
plot6 = plot1+theme_dark()+annotate("text", x = -1.9, y = 75, label = "dark()" , col="orange" , size=4)
plot7 = plot1+theme_get()+annotate("text", x = -1.9, y = 75, label = "get()" , col="orange" , size=4)
plot8 = plot1+theme_minimal()+annotate("text", x = -1.9, y = 75, label = "minimal()" , col="orange" , size=4)

 
# Arrange and display the plots into a 2x1 grid
png( "#192_ggplot2_themes_part1.png" , width = 480, height = 480 )
grid.arrange(plot1,plot2,plot3,plot4, ncol=2)
dev.off()

png( "#192_ggplot2_themes_part2.png" , width = 480, height = 480 )
grid.arrange(plot5,plot6,plot7,plot8, ncol=2)
dev.off()

