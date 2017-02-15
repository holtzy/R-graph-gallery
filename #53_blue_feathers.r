
png("#53_blue_feathers.png", width = 480, height = 480)


# generate pairs of x-y values
x1 = c(seq(0, pi, length = 50), seq(pi, 2*pi, length = 50))
y1 = cos(x1) / sin(x1)
x2 = seq(1.02 * 2 * pi + pi/2, 4*pi + pi/2, length = 50)
y2 = tan(x2)

# set graphical parameters
op = par(bg="black", mar=rep(.5,4))

# plot
plot(c(x1, x2), c(y1, y2), type = "n", ylim = c(-11, 11))
for (i in seq(-10, 10, length = 100))
{
  lines(x1, y1 + i, col = hsv(runif(1,.65,.7), 1, 1, runif(1,.7)), 
        lwd = 4 * runif(1, 0.3))
  lines(x2, y2 + i, col = hsv(runif(1,.65,.7), 1, 1, runif(1,.7)), 
        lwd = 4 * runif(1, 0.3))
}
# signature
legend("bottomright", legend = "© Gaston Sanchez", bty = "n", text.col = "gray70")


dev.off()


