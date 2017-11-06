
# ---------------------------------------------------------------------------------------------------------------------------------------------------------
#284 CALENDAR HEATMAP

#submitted by John MacKintosh <dataguy.jm@gmail.com>
#the hourly heatmap
#blog:http://johnmackintosh.com/2016-11-27-calendar-heatmaps/

# Libraries
library(ggplot2) 
library(lubridate) 
library(tidyr) 
library(ggExtra)
library(dplyr) 

# Create dataset: 10 metrics mesured for each day of a month
data=data.frame(matrix(sample(seq(0,100), 31*10, replace=TRUE), 31, 10))
data[ , 8:10] = data[ ,8:10] *4
colnames(data)=LETTERS[1:10]
data$ReportDate=seq.Date( as.Date('2016-12-1'), by='day',length.out = 31) 

# Transform it into a tidy format
data =gather(data, key=Metric, value = Value, -ReportDate) 
data$Metric=as.factor(data$Metric) 
data$Metric=with(data,factor(Metric, levels=rev(levels(Metric)))) 

# Additional data for the plot
data$dow = wday(data$ReportDate,label=TRUE) 
data$dow = with(data, factor(dow, levels = rev(levels(dow)))) 
data$week=week(data$ReportDate) 
data$weeks = format(data$ReportDate, "%W") # was originally "%Y/%W" 
data$weeks = factor(data$weeks, levels = unique(data$weeks)) #use weekStart as a calendar style plot 
data$weekStart = data$ReportDate - as.POSIXlt(data$ReportDate)$wday 
data$Metric = with(data, factor(Metric, levels = rev(levels(Metric)))) 

# First plot
p=ggplot(data,aes(x=weekStart, y=dow, fill=Value))+ 
	geom_tile(colour="white",size=.1) + 
	scale_fill_gradient(high="#00008B",low= "dodgerblue")+ 
	guides(fill=guide_legend(title="# Rescaled Company Indicators - Activity By Day"))+ 
	scale_x_date(date_breaks = "1 week",date_labels="%d-%b-%y")+ 
	theme_minimal(base_size = 10)+ 
	removeGrid()+
	rotateTextX()+ 
	ggtitle("Company Indicators - Rescaled Events per weekday Dec 2016",subtitle = "# Events per metric per day")+ 
	labs(x="Week Beginning", y=NULL)+ 
	theme(
		plot.title=element_text(hjust=0), 
		axis.ticks=element_blank(),
		axis.text=element_text(size=7),
		legend.title=element_text(size=8),
		legend.text=element_text(size=6),
		legend.position="none"
		) +
	facet_wrap(~Metric,nrow =3 ) 
	
png("#284_Calendar_heatmap1.png" , width = 480, height = 480 )
p 
dev.off()
ggsave("#284_Calendar_heatmap2.png",height = 5.84,width = 8.74)



# Rescaled
data = data %>% group_by(Metric)%>% 
	mutate(Rescaled = scales::rescale(Value)) 
p=ggplot(data,aes(x=weekStart, y=dow, fill=Rescaled))+ 
	geom_tile(colour="white",size=.1) + 
	scale_fill_gradient(high="#00008B",low= "dodgerblue")+ 
	guides(fill=guide_legend(title="# Rescaled Company Indicators - Activity By Day"))+ 
	scale_x_date(date_breaks = "1 week",date_labels="%d-%b-%y")+ 
	theme_minimal(base_size = 10)+ 
	removeGrid()+
	rotateTextX()+ 
	ggtitle("Company Indicators - Rescaled Events per weekday Dec 2016",subtitle = "# Events per metric per day")+ 
	labs(x="Week Beginning", y=NULL)+ 
	theme(
		plot.title=element_text(hjust=0), 
		axis.ticks=element_blank(),
		axis.text=element_text(size=7),
		legend.title=element_text(size=8),
		legend.text=element_text(size=6),
		legend.position="none"
		) +
	facet_wrap(~Metric,nrow =3 ) 
	
ggsave("#284_Calendar_heatmap3.png",height = 5.84,width = 8.74)



# For labelled version: 
p2=p+
	geom_text(data=data,aes(weekStart,dow,label=Value,fontface="bold"),colour="white",size=2.5) 
ggsave("#284_Calendar_heatmap4.png",height = 5.84,width = 8.74)


# ---------------------------------------------------------------------------------------------------------------------------------------------------------

