
# -----------------------------------------------------------------------------------------------------------------------------------------------------
#------ #226 USE DIFFERENT TYPE OF PLOT FOR CIRCULAR

# Upload library
library(circlize)

#Create data
data = data.frame(
	factor = sample(letters[1:8], 1000, replace = TRUE),
	x = rnorm(1000), 
	y = runif(1000)
	)

# We can use par to custom the general parameteres
# it the same as basic plot, we have to use par to set margins, baackground color...
par(mar = c(1, 1, 1, 1) ) 
circos.par("track.height" = 0.4)

png("#226_different_plot_type_circlize_1.png" , width = 480, height = 480 )

# SCATTERPLOT - LINEPLOT - TEXT PLOT
# Initialise the chart. This part explains to R how we want to slice the window: how many area we want to build, and what we will show on axis
# We can also set the width of each sector with the sector.width argument.
circos.initialize(factors = data$factor, x = data$x )

# Build the regions. It's here that we can custom the axis and borders of regions!
# You can use for example: labels.font / labels.cex / labels.facing / lwd
# Type help(circos.axis) for more information
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8, h="bottom", direction="inside")
	})

# plot dots:
circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.1,0.5,0.8,0.3), pch=20)
dev.off()

#plot lines
png("#226_different_plot_type_circlize_2.png" , width = 480, height = 480 )
circos.initialize(factors = data$factor, x = data$x )
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8, h="bottom", direction="inside")
	})
circos.trackLines(data$factor, data$x[order(data$x)], data$y[order(data$x)], col = rgb(0.1,0.5,0.8,0.3), lwd=2)
dev.off()

# plot abline
png("#226_different_plot_type_circlize_3.png" , width = 480, height = 480 )
circos.initialize(factors = data$factor, x = data$x )
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8, h="bottom", direction="inside")
	})
circos.trackLines(data$factor, data$x[order(data$x)], data$y[order(data$x)], col = rgb(0.1,0.5,0.8,0.3), lwd=2, type="h")
dev.off()

# plot text:
png("#226_different_plot_type_circlize_4.png" , width = 480, height = 480 )
circos.initialize(factors = data$factor, x = data$x )
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8, h="bottom", direction="inside")
	})
circos.trackText(data$factor, data$x[order(data$x)], data$y[order(data$x)], labels=data$factor, col = rgb(0.9,0.2,0.8,0.3), cex=1)
dev.off()

# HISTOGRAMM
png("#226_different_plot_type_circlize_5.png" , width = 480, height = 480 )
# Initialise the chart. This part explains to R how we want to slice the window: how many area we want to build, and what we will show on axis
# We can also set the width of each sector with the sector.width argument.
circos.initialize(factors = data$factor, x = data$x )

# Build the regions. It's here that we can custom the axis and borders of regions!
# You can use for example: labels.font / labels.cex / labels.facing / lwd
# Type help(circos.axis) for more information
circos.trackPlotRegion(factors = data$factor, panel.fun = function(x, y) {
	circos.axis(labels.cex=0.5, labels.font=1, lwd=4)
	})

#Let's do a histogram
circos.trackHist(data$factor, data$x, bg.col = "grey78", col = rgb(0.1,0.5,0.8,0.3))

dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------



