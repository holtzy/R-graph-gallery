
# -----------------------------------------------------------------------------------------------------------------------------------------------------

AREA CHART GGPLOT2

png("#164_area_chart_ggplot2.png" , width = 480, height = 480 )

# ggplot2 library
library(ggplot2)

# Create data
data=data.frame(my_x=seq(1,10), my_size=sample(seq(1,20),10))

# Basic filled area plot
ggplot(data, aes(x=my_x , y=my_size)) + 
geom_area( fill="blue", alpha=.2)+ 
geom_line()

dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------

