#reference : 
http://onepager.togaware.com/KnitRO.pdf
page 14

#ggplot2

library(rattle)   # For the weatherAUS dataset.
library(ggplot2)  # To generate a density plot.
png("#21_portfolio_ggplot2_ddensity_plot.png" , width = 800, height = 600)
png("#21_ggplot2_ddensity_plot.png" , width = 480, height = 480)
cities <- c("Canberra", "Darwin", "Melbourne", "Sydney")
ds <- subset(weatherAUS, Location %in% cities & ! is.na(Temp3pm))
p  <- ggplot(ds, aes(Temp3pm, colour=Location, fill=Location))
p  <- p + geom_density(alpha=0.55)
p





