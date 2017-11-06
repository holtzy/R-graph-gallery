
# -----------------------------------------------------------------------------------------------------------------------------------------------------
#------ #229 ARRANGE LAYOUT IN A FIGURE

png("#229_circlize_arrange_layout.png" , width = 480, height = 480 )

#
library(circlize)
layout(matrix(1:9, 3, 3)) 

for(i in 1:9) {
	par(mar = c(0.5, 0.5, 0.5, 0.5), bg=rgb(1,1,1,0.1) )
	factors = 1:8
	circos.par(cell.padding = c(0, 0, 0, 0)) 
	circos.initialize(factors, xlim = c(0, 1)) 
	circos.trackPlotRegion(ylim = c(0, 1), track.height = 0.05, bg.col = rand_color(8), bg.border = NA ) 

	for(i in 1:20) {
		se = sample(1:8, 2)
		circos.link(se[1], runif(2), se[2], runif(2), col = rand_color(1, transparency = 0.4)) 
		
	}
	circos.clear()
}

dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------



