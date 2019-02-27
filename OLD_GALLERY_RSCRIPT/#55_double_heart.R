
       
       
png("#55_double_heart.png", width = 480, height = 480)
     
       
# generate pairs of x-y values
theta = seq(-2 * pi, 2 * pi, length = 300)
x = cos(theta)
y = x + sin(theta) 

# set graphical parameters
op = par(bg = "black", mar = rep(0.1, 4))

# plot
plot(x, y, type = "n", xlim = c(-8, 8), ylim = c(-1.5, 1.5))
for (i in seq(-2*pi, 2*pi, length = 100))
{
  lines(i*x, y, col = hsv(runif(1, 0.85, 0.95), 1, 1, runif(1, 0.2, 0.5)), 
        lwd = sample(seq(.5, 3, length = 10), 1))          
}

# signature
legend("bottomright", legend = "© Gaston Sanchez", bty = "n", text.col = "gray70")
       
 dev.off()
  
       
