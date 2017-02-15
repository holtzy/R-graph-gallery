# 205.
# Gif doit etre ouvert dans firefox pour fonctionner.
# Carlos Ortega
# cof@qualityexcellence.es
# Citer le package

library(plot3D) 
library(animation) 
saveGIF({ 
par(mai = c(0.1,0.1,0.1,0.1)) 
for(i in 1:100){ 
	X <- seq(0, 2*pi, length.out = 100) 
	Y <- seq(-15, 6, length.out = 100) 
	M <- mesh(X, Y) 
	u <- M$x 
	v <- M$y 
	# x, y and z grids 
	x <- (1.16 ^ v) * cos(v) * (1 + cos(u)) 
	y <- (-1.16 ^ v) * sin(v) * (1 + cos(u)) 
	z <- (-2 * 1.16 ^ v) * (1 + sin(u)) 
	# full colored image 
	surf3D(x, y, z, colvar = z, col = ramp.col(col = c("red", "red", "orange"), n = 100), colkey = FALSE, shade = 0.5, expand = 1.2, box = FALSE, phi = 35, theta = i, lighting = TRUE, ltheta = 560, lphi = -i) 
	} 
	}, interval = 0.1, ani.width = 550, ani.height = 350)







