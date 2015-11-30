# Graphe R simple
png("#17_portfolio_easy_plot.png" , width = 800, height = 600)
png("#17_easy_plot.png" , width = 480, height = 480)
par(mar=c(0,0,0,0))
x <- seq(-10, 10, length = 1000)
plot(x, sin(x), xlab = "x-values", ylab = "f(x)", type = "p"  , cex=0.5 , ylim=c(-1 , 1.5) )
lines(x, cos(x), lty = 4 , lwd=2)
abline(h=0)
#title("Trigonometric functions", "sin(x) and cos(x)")
dev.off()



