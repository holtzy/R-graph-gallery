

X=rep(1:5, each=200)
a=rnorm(200 , mean=10 , sd=9)
Y=c( a-3 , a , a+5, a+10 , a+20 )

# plot without jitter
png("#194_Boxplot_with_jitter1.png" , width = 480, height = 480 )
par(mar=c(4,4,1,1))
plot(X, Y)
 dev.off()
 
# plot with jitter
png("#194_Boxplot_with_jitter2.png" , width = 480, height = 480 )
par(mar=c(4,4,1,1))
plot(jitter(X), Y , pch=20, col=rgb(0.1, 0.2, 0.8, 0.3) , xlab="X", ylab="Y", bty="n" )
dev.off()
 

# argument amount permet de gérer la taille du jitter. plus fort--> points plus écartés.
 
 
