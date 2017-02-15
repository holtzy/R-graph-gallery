#203
# Carlos Ortega
# cof@qualityexcellence.es
# Citer le package

# library
library(plot3D) 

# Create data
x <- y <- z <- seq(-4, 4, by = 0.2) 
M <- mesh(x, y, z) 
R <- with (M, sqrt(x^2 + y^2 + z^2)) 
p <- sin(2*R) /(R+1e-3) 
alpha = 0.5 

# Make the plot
png("#203_slice3D_plot.png" , width = 480, height = 480 )
slice3D(x, y, z, colvar = p, col = jet.col(alpha = 0.5), xs = 0, ys = c(-4, 0, 4), zs = NULL, d = 2)
dev.off()

