

# -----------------------------------------------------------------------------------------------------------------------------------------------------
#------ #220 IMPROVE_BASIC_CIRCULAR PLOT

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
par(mar = c(1, 1, 1, 1), bg=rgb(0.4,0.1,0.7,0.05) ) 
circos.par("track.height" = 0.6)
# Main option are:
# - start.degree= The starting degree from which the circle begins to draw
# - gap.degree Gap between two neighbour sectors (simple value or vector)
# - custom the margin with track.margin / cell.padding / 

png("#220_circlize_improve_basic_plot_1.png" , width = 480, height = 480 )
par(mar = c(1, 1, 1, 1), bg=rgb(0.4,0.1,0.7,0.05) ) 
circos.par("track.height" = 0.6)

# Initialise the chart. This part explains to R how we want to slice the window: how many area we want to build, and what we will show on axis
# We can also set the width of each sector with the sector.width argument.
circos.initialize(factors = data$factor, x = data$x)

# Build the regions. It's here that we can custom the axis and borders of regions!
# You can use for example: labels.font / labels.cex / labels.facing / lwd
# Type help(circos.axis) for more information
# Let's do 3 examples:
circos.trackPlotRegion(factors = data$factor, y = data$y, panel.fun = function(x, y) {
	circos.axis(
		h="top",  # x axis on the inner or outer part of the track?
		labels=TRUE, # show the labels of the axis?
		major.tick=TRUE, # show ticks?
		labels.cex=0.5, # labels size (higher=bigger)
		labels.font=1,  # labels font (1, 2, 3 , 4)
		direction="outside", # ticks point to the outside or inside of the circle ?
		minor.ticks=4, # Number of minor (=small) ticks
		major.tick.percentage=0.1, # The size of the ticks in percentage of the track height
		lwd=2 # thickness of ticks and x axis.
		)
	})
dev.off()

png("#220_circlize_improve_basic_plot_2.png" , width = 480, height = 480 )
par(mar = c(1, 1, 1, 1), bg=rgb(0.4,0.1,0.7,0.05) ) 
circos.par("track.height" = 0.6)
circos.initialize(factors = data$factor, x = data$x)
circos.trackPlotRegion(factors = data$factor, y = data$y, panel.fun = function(x, y) {
	circos.axis(
		h="top",  # x axis on the inner or outer part of the track?
		labels=TRUE, # show the labels of the axis?
		major.tick=TRUE, # show ticks?
		labels.cex=0.5, # labels size (higher=bigger)
		labels.font=1,  # labels font (1, 2, 3 , 4)
		direction="outside", # ticks point to the outside or inside of the circle ?
		minor.ticks=4, # Number of minor (=small) ticks
		major.tick.percentage=0.1, # The size of the ticks in percentage of the track height
		lwd=2 # thickness of ticks and x axis.
		)
	})

		
# Add points
# There we can use the usual parameters of plots. Everything that works for basic R works for circlize
circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.1,0.5,0.8,0.3), pch = 20, cex = 2) 
dev.off()
# -----------------------------------------------------------------------------------------------------------------------------------------------------


