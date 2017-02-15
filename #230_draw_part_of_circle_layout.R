
# -----------------------------------------------------------------------------------------------------------------------------------------------------

#230 DRAW PART OF THE CIRCOS LAYOUT

png("#230_draw_part_of_circle_layout.png" , width = 480, height = 480 )

circos.clear()

# library
library(circlize)

#Create data
factors = letters[1:4]
x1 = runif(100)
y1 = runif(100)

# general parameter of the plot. With canvas.xlim and canvas.ylim we kind of "zoom on a part of the plot:
par(mar = c(1, 2, 0.1, 0.1) )
circos.par("track.height" = 0.7, "canvas.xlim" = c(0, 1), "canvas.ylim" = c(0, 1), "gap.degree" = 0, "clock.wise" = FALSE)

# Make the usual plot, but with no border
circos.initialize(factors = factors, xlim = c(0, 1)) 
circos.trackPlotRegion(factors = factors, ylim = c(0, 1), bg.border = NA ) 

# Finally we plot only the firs sector, so let's change its border to "black" to see it
circos.updatePlotRegion(sector.index = "a", bg.border = "grey" , bg.lwd=0.2)

# Now we can add a plot in this section! You can repeat these steps to add several regions
circos.lines(x1, y1, pch = 16, cex = 0.5, type="h" , col=rgb(0.2,0.5,0.1,0.5) , lwd=3)

# Add axis
circos.axis(h="bottom" , labels.cex=0.4, direction = "inside" )

dev.off()


#clear
circos.clear()

