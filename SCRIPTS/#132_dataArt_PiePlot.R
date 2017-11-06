png("#132_dataArt_PiePlot.png" , width = 480, height = 480)
par(mar=c(0,0,0,0))
pie(abs(rnorm(100)) , radius=10 , border="transparent" , xlim=c(0,5) )
dev.off()
