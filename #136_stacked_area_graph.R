inspired from the cookbook for R
https://www.safaribooksonline.com/library/view/r-graphics-cookbook/9781449363086/ch04.html


# ggplot2 library
library(ggplot2)

#DATA
set.seed(345)
Sector <- rep(c("S01","S02","S03","S04","S05","S06","S07"),times=7)
Year <- as.numeric(rep(c("1950","1960","1970","1980","1990","2000","2010"),each=7))
Value <- runif(49, 10, 100)
data <- data.frame(Sector,Year,Value)

# Stacked area graph:
png("#136_stacked_area_graph_1.png" , width = 480, height = 480 )
ggplot(data, aes(x=Year, y=Value, fill=Sector)) + 
	geom_area()
dev.off()

# Custom version
png("#136_stacked_area_graph_2.png" , width = 480, height = 480 )
ggplot(data, aes(x=Year, y=Value, fill=Sector)) +
    geom_area(colour="black", size=.2, alpha=.4) +
    scale_fill_brewer(palette="Greens", breaks=rev(levels(data$Sector)))
dev.off()

# To reverse the stacking order, you have to change the order in the initial data frame
png("#136_stacked_area_graph_3.png" , width = 480, height = 480 )
data=data[order(data$Sector, decreasing=T) , ]
ggplot(data, aes(x=Year, y=Value, fill=Sector)) +
    geom_area(colour="black", size=.2, alpha=.4) +
    scale_fill_brewer(palette="Greens", breaks=rev(levels(data$Sector)))
dev.off()

# You can also set a specific order:
png("#136_stacked_area_graph_4.png" , width = 480, height = 480 )
data$Sector=factor(data$Sector , levels=levels(data$Sector)[c(1,4,3,2,7,6,5)])
ggplot(data, aes(x=Year, y=Value, fill=Sector)) + 
	geom_area()
dev.off()

# Proportionnal stack area graph ?
my_fun=function(vec){ as.numeric(vec[3]) / sum(data$Value[data$Year==vec[2]]) *100 }
data$prop=apply(data , 1 , my_fun)
png("#136_stacked_area_graph_5.png" , width = 480, height = 480 )
ggplot(data, aes(x=Year, y=prop, fill=Sector)) + 
	geom_area(alpha=0.6 , size=1, colour="black")
dev.off()


