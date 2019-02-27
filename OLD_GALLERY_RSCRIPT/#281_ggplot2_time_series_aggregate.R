

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 281 : Aggregate time serie per time unit
#################

# library
library(tidyverse)

# Build a Time serie data set for last year
day=as.Date("2017-06-14") - 0:364
value=runif(365) + seq(-140, 224)^2 / 10000
data=data.frame(day, value)

# Calculate agregated data per month
don=data %>% mutate(month = as.Date(cut(day, breaks = "month"))) %>%
	group_by(month) %>% 
	summarise(average = mean(value)) 

# And make the plot
png("#281_ggplot2_time_series_aggregate1.png" , width = 980, height = 480 )
ggplot(don, aes(x=month, y=average)) +
 	 geom_line() + 
 	 geom_point() +
	 scale_x_date(date_labels = "%b-%Y", date_breaks="1 month")
dev.off()

# Calculate agregated data
don=data %>% mutate(week = as.Date(cut(day, breaks = "week"))) %>%
	group_by(week) %>% 
	summarise(average = mean(value)) 

# And make the plot
png("#281_ggplot2_time_series_aggregate2.png" , width = 980, height = 480 )
ggplot(don, aes(x=week, y=average)) +
 	 geom_line() + 
 	 geom_point() +
 	 geom_area(fill=alpha('slateblue',0.2)) +
	 scale_x_date(date_labels = "%W-%b", date_breaks="1 week") +
	 theme(axis.text.x=element_text(angle=60, hjust=1))
dev.off()


# ---------------------------------------------------------------------------------------------------------------------------------------------------------


