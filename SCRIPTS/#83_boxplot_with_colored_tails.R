
png("#83_boxplot_with_colored_tails.png" , width = 480, height = 480 )
par(mar=c(5,5,1,1))

my_variable=rnorm(2000, 0 , 10)
my_hist=hist(my_variable , breaks=40  , plot=F)

my_color= ifelse(my_hist$breaks < -10, rgb(0.2,0.8,0.5,0.5) , ifelse (my_hist$breaks >=10, "purple", rgb(0.2,0.2,0.2,0.2) ))

plot(my_hist, col=my_color , border=F , main="" , xlab="value of the variable", xlim=c(-40,40) )

dev.off()

