
#--Load previously saved data:
path <- "http://www.sr.bham.ac.uk/~ajrs/R/datasets"
a <- load(url(paste(path,"middayweather.RData", sep="/")))
close(url(paste(path,"middayweather.RData", sep="/")))
print(a)	# list names of saved objects

#--Load extra libraries:
require(lattice)

#--The following was used to define the colours, but since it's a non-standard
#   package, I've used the hexadecimal colour codes explicity below to avoid the
#   need to install "RColorBrewer". See http://colorbrewer2.org/ for more info.
#require(RColorBrewer)
#colset <- brewer.pal(5, "Set1")

#--Change output device to pdf file:
trellis.device(device="png", file="midday_weather_profiles.png",  width = 480, height = 480 , color=TRUE)

#--Define plot titles:
lab.wind.speed <- "Wind speed (mph)"
lab.hum <- "Humidity (%)"
lab.rain <- "Rainfall (mm/day, averaged over a week)"
lab.bar <- "Air pressure (mb)"
lab.T.out <- as.expression(expression( paste("Outside temperature (", degree*C, ")") ))

#--Custom strip function:
# (NB the colour used is the default lattice strip background colour)
my.strip <- function(which.given, which.panel, ...) {
   strip.labels <- c(lab.wind.speed, lab.hum, lab.rain, lab.bar, lab.T.out)
   panel.rect(0, 0, 1, 1, col="#ffe5cc", border=1)
   panel.text(x=0.5, y=0.5, adj=c(0.5, 0.55), cex=0.95,
              lab=strip.labels[which.panel[which.given]])
}

#--Define X axis date range:
xlim <- range(middayweather$Date)

#--Define annual quarters for plot grid line markers:
d <- seq(from=as.Date("2006-01-01"), to=as.Date("2011-01-01"), by=365/4)

#--Define colours for raw & smoothed data:
col.raw <- "#377EB8"	#colset[2] } see note above
col.smo <- "#E41A1C"	#colset[1] }
col.lm <- "grey20"

#--Create multipanel plot:
xyplot(wind.speed + hum.out + rain + bar + T.out ~ Date, data=middayweather,
       scales=list(y="free", rot=0), xlim=xlim,
       strip=my.strip, outer=TRUE, layout=c(1, 5, 1), ylab="",
       panel=function(x, y, ...) {panel.grid(h=-1, v=0)	# plot default horizontal gridlines
                            panel.abline(v=d, col="grey90") # custom vertical gridlines
                            panel.xyplot(x, y, ..., type="l", col=col.raw, lwd=0.5) # raw data
                            panel.loess(x, y, ..., col=col.smo, span=0.14, lwd=0.5) # smoothed data
                            panel.abline(h=median(y, na.rm=TRUE), lty=2, col=col.lm, lwd=1) # median value
                           },
       key=list(text=list(c("raw data", "smoothed curve", "median value")),
                title="Birmingham Wast Hills Observatory average midday weather",
                col=c(col.raw, col.smo, col.lm), lty=c(1, 1, 2),
                columns=2, cex=0.95,
                lines=TRUE
               ),
      )

#--Ensure device finishes cleanly:
dev.off()

