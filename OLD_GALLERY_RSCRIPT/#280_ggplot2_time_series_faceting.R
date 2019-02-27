

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 280: TIME SERIES AND FACETING WTH GGPLOT2
#################


# library
library(tidyverse)

# Build a Time serie data set for last year
day=as.Date("2017-06-14") - 0:364
value=runif(365) + seq(-140, 224)^2 / 10000
data=data.frame(day, value)

# Split each month on one row?
png("#280_ggplot2_time_series_faceting1.png" , width = 980, height = 480 )
data %>% mutate(month = as.Date(cut(day, breaks = "month"))) %>% 
	ggplot(aes(x=day, y=value)) +
 	 geom_line() + 
 	 theme(
 	 	axis.text.x=element_blank(), 
 	 	axis.ticks.x=element_blank(),
 	 	strip.background = element_rect(fill=alpha("slateblue",0.2)),
 	 	strip.placement="bottom"
 	 	) +
 	 xlab("") + 
 	 facet_wrap(~as.Date(month), scales="free_x", nrow=1)
dev.off()


# Split each month on one row?
png("#280_ggplot2_time_series_faceting2.png" , width = 980, height = 480 )
data %>% mutate(month = as.Date(cut(day, breaks = "month"))) %>% 
	ggplot(aes(x=day, y=value, fill=as.factor(month))) +
 	 geom_line() + 
 	 geom_area() +
 	 theme(
 	 	legend.position="none",
 	 	axis.text.x=element_blank(), 
 	 	axis.ticks.x=element_blank(),
 	 	strip.background = element_rect(fill=alpha("slateblue",0.2)),
 	 	strip.placement="bottom"
 	 	) +
 	 xlab("") + 
 	 facet_wrap(~as.Date(month), scales="free", ncol=3)
dev.off()

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

