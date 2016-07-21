
# 146 a time serie boxplot
png("#146_Boxplot_and_time_serie.png" , width = 680, height = 480 )
par(mar=c(4,4,2,2))

# Library
library(RColorBrewer)

# Create Data
days=rep(c("monday","tuesday","wenesday","thursday","friday","saturday","sunday") , each=120)
time=rep (rep( paste(seq(0,22,2),seq(2,24,2),sep="-") , each=10 ) , 7)
value=rep (  rep(seq(0,22,2) , each=10 ) , 7)+rnorm(mean=10, sd=10 , length(time))
data=data.frame(days, time, value)

# Create a color palette
my_colors = brewer.pal(9, "Blues") 
my_colors = colorRampPalette(my_colors)(12)

# Make the boxplot
boxplot(data$value ~ data$time+data$days , xaxt="n" , xlab="" , col=my_colors , pch=20 , cex=0.3 , ylab="value" )
abline(v= seq(0, 12*7, 12) +0.5 , col="grey")
axis(1, labels=unique(days) , at=seq(6,12*7,12) )

# Add general trend
a=aggregate(data$value , by=list(data$time, data$days) , mean)
lines(a[,3], type="l" , col="red" , lwd=2)

dev.off()
