# Sympa! --> Calendrier
# Carlos Ortega
# cof@qualityexcellence.es
# Citer le package

#library
library(openair) 

# load example data from package 
data(mydata) 

# basic plot 
png("#204_calendar_plot.png" , width = 480, height = 480 )
calendarPlot(mydata, pollutant = "o3", year = 2003)
dev.off()
