# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 201
# Carlos Ortega
# cof@qualityexcellence.es
# http://latticeextra.r-forge.r-project.org/#panel.2dsmoother&theme=default

# library
library(latticeExtra) 

# create data
set.seed(1) 
xyz <- data.frame(x = rnorm(100), y = rnorm(100)) 
xyz$z <- with(xyz, x * y + rnorm(100, sd = 1)) 

# showing data points on the same color scale 
png("#201_level_plot_lattice.png" , width = 480, height = 480 )
levelplot(z ~ x * y, xyz, panel = panel.levelplot.points, cex = 1.2) + layer_(panel.2dsmoother(..., n = 200))
dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------

