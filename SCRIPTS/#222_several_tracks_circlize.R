
# ----------------------------------------------------------------------------------------------------------------------------------------------------
# --- #222 ADD SEVERAL TRACK


#library
library(circlize)

#Create data
data = data.frame(
	factor = sample(letters[1:8], 1000, replace = TRUE),
	x = rnorm(1000), 
	y = runif(1000)
	)

png("#222_several_tracks_circlize_1.png" , width = 480, height = 480 )
#Initialize the plot has seen before
par(mar = c(1, 1, 1, 1) ) 
circos.initialize(factors = data$factor, x = data$x )

# Build the regions of couche #1 and add a scatterplot on it
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8)
	})
circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.1,0.5,0.8,0.3), pch=20)
dev.off()





# Add the couche #2
png("#222_several_tracks_circlize_2.png" , width = 480, height = 480 )
par(mar = c(1, 1, 1, 1) ) 
circos.initialize(factors = data$factor, x = data$x )
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8)
	})
circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.1,0.5,0.8,0.3), pch=20)

circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels=FALSE, major.tick=FALSE)
	})
circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.9,0.5,0.8,0.3), pch=20, cex=2)
dev.off()

# Add the couche #3 --> don't forget you can custom the height of tracks!
png("#222_several_tracks_circlize_3.png" , width = 480, height = 480 )
par(mar = c(1, 1, 1, 1) ) 
circos.initialize(factors = data$factor, x = data$x )
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels.cex=0.5, labels.font=1, lwd=0.8)
	})
circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.1,0.5,0.8,0.3), pch=20)

circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels=FALSE, major.tick=FALSE)
	})
circos.trackPoints(data$factor, data$x, data$y, col = rgb(0.9,0.5,0.8,0.3), pch=20, cex=2)

circos.par("track.height" = 0.4)
circos.trackPlotRegion(factors = data$factor, y=data$y, panel.fun = function(x, y) {
	circos.axis(labels=FALSE, major.tick=FALSE)
	})
circos.trackLines(data$factor, data$x, data$y, col = rgb(0.9,0.5,0.1,0.3), pch=20, cex=2, type="h")
dev.off()
# and continue as long as needed!

# -----------------------------------------------------------------------------------------------------------------------------------------------------



