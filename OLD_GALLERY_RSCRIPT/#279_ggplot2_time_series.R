
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 279: TIME SERIES AND GGPLOT2
#################



# library
library(tidyverse)

# Build a Time serie data set for last year
day=as.Date("2017-06-14") - 0:364
value=runif(365) + seq(-140, 224)^2 / 10000
data=data.frame(day, value)

# We can check if the the day column is recognized as a date:
str(data)

# If your column is not recognized as date, you need to convert it with the as.Date function.
# Example
as.Date("1jan1960", "%d%b%Y")
as.Date("02/27/92", "%m/%d/%y")
# See here for more example

# Once the day column is recognized as a date, ggplot2 plot it as well as possible
png("#279_ggplot2_time_series1.png" , width = 980, height = 480 )
p=ggplot(data, aes(x=day, y=value)) +
  geom_line() + 
  xlab("")
p
dev.off()

# What format do you want for the date on the x axis?
png("#279_ggplot2_time_series2.png" , width = 980, height = 480 )
p+scale_x_date(date_labels = "%b")
dev.off()
# Show year + month + dat
png("#279_ggplot2_time_series3.png" , width = 980, height = 480 )
p+scale_x_date(date_labels = "%Y %b %d")
dev.off()
# Show week
png("#279_ggplot2_time_series4.png" , width = 980, height = 480 )
p+scale_x_date(date_labels = "%W")
dev.off()
#
png("#279_ggplot2_time_series5.png" , width = 980, height = 480 )
p+scale_x_date(date_labels = "%m-%Y")
dev.off()



# How often do you want to write the date?
png("#279_ggplot2_time_series6.png" , width = 980, height = 480 )
p + scale_x_date(date_breaks = "1 week", date_labels = "%W")
dev.off()
png("#279_ggplot2_time_series7.png" , width = 980, height = 480 )
p + scale_x_date(date_breaks = "2 week", date_labels = "%b %d")
dev.off()

# We can custom minor break as well
png("#279_ggplot2_time_series8.png" , width = 980, height = 480 )
p + scale_x_date(date_minor_breaks = "2 day")
dev.off()

# If dates take to much place, angle them:
png("#279_ggplot2_time_series9.png" , width = 980, height = 480 )
p + theme(axis.text.x=element_text(angle=60, hjust=1))
dev.off()

# Zoom on january and february
png("#279_ggplot2_time_series10.png" , width = 980, height = 480 )
p + scale_x_date(limit=c(as.Date("2017-01-01"),as.Date("2017-02-11")))
dev.off()

