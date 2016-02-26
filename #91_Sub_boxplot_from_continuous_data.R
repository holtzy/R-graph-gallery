png("#91_Sub_boxplot_from_continuous_data.png" , width = 480, height = 480 )
par(mar=c(4,4,1,1))
variable1=seq(1:1000)
variable2=rnorm(1000,5)+0.01*seq(1:1000)
variable1_cut = cut(variable1, breaks=seq(from=0, to=ceiling(max(variable1)), by=250))
boxplot(variable2 ~ variable1_cut , col=terrain.colors(4) )
dev.off()

