

# -----------------------------------------------------------------------------------------------------------------------------------------------------
------ #228 ADD LINKS BETWEEN REGIONS

#library
library(circlize)
set.seed(123)

#Create data
data = data.frame(
	factor = sample(letters[1:8], 1000, replace = TRUE),
	x = rnorm(1000), 
	y = runif(1000)
	)

png("#228_add_links_circlize_1.png" , width = 480, height = 480 )

#Initialize the plot has seen before
par(mar = c(1, 1, 1, 1) ) 
circos.initialize(factors = data$factor, x = data$x )

# Build the regions of couche #1 and color it
circos.trackPlotRegion(factors = data$factor, y=data$y , bg.col = rgb(0.1,0.1,seq(0,1,0.1),0.4) , bg.border = NA)

# Add a link between a point and another
# Argument: lwd, lty, col, border, 
circos.link("a", 0, "b", 0, h = 0.4)
dev.off()

# Add a link between a point and a zone
png("#228_add_links_circlize_2.png" , width = 480, height = 480 )
par(mar = c(1, 1, 1, 1) ) 
circos.initialize(factors = data$factor, x = data$x )
circos.trackPlotRegion(factors = data$factor, y=data$y , bg.col = rgb(0.1,0.1,seq(0,1,0.1),0.4), bg.border = NA)
circos.link("a", 0, "b", 0, h = 0.4)
circos.link("e", 0, "g", c(-1,1), col = "green", lwd = 2, lty = 2, border="black" )
dev.off()

# Add a link between a zone and another
png("#228_add_links_circlize_3.png" , width = 480, height = 480 )
par(mar = c(1, 1, 1, 1) ) 
circos.initialize(factors = data$factor, x = data$x )
circos.trackPlotRegion(factors = data$factor, y=data$y , bg.col = rgb(0.1,0.1,seq(0,1,0.1),0.4), bg.border = NA)
circos.link("a", 0, "b", 0, h = 0.4)
circos.link("e", 0, "g", c(-1,1), col = "green", lwd = 2, lty = 2, border="black" )
circos.link("c", c(-0.5, 0.5), "d", c(-0.5,0.5), col = "red", border = "blue", h = 0.2)
dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------



