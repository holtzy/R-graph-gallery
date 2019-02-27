#Intro
png("#46_genetic_map.png" , width = 480, height = 480 )

marker=paste("marker" , sample(seq(1,1200) , 1200 ) , sep="_")
chromosome=as.factor(sort(rep(seq(1,6) , 200)))
position=abs(c( rep(seq(1,200)+runif(200 , -20 , 100)) , rep(seq(1,200)+runif(200 , -20 , 100)) ,rep(seq(1,200)+runif(200 , -20 , 10)) ,rep(seq(1,200)+runif(200 , -20 , 100)) ,rep(seq(1,200)+runif(200 , -20 , 100)) ,rep(seq(1,200)+runif(200 , -50 , 300))   ))
type=sample(c("SNP","Dart") , 1200 , replace=T)
map=data.frame(chromosome, marker, position , type)

#Réalisation du dessein
par(mar=c(1,1,0,0))
par(bg="grey")
nb_K=nlevels(map$chromosome)
num=0
plot(0,0 , xlim=c(1,nb_K) , ylim = rev(range(map$position)) , bty="n" , xaxt="n" , yaxt="n" )
abline(h=seq(0 , max(map$position) , 50) , col="white" , lwd=0.2)
for (i in levels(map$chromosome)){
	num=num+1
	text(num-0.3 , 0 , i)
	a=map[map$chromosome==i , ]
	points( rep(num,nrow(a)) , a$position  , pch=20 , cex=1.5, col=ifelse(a$type=="Dart"  , rgb(1,0.1,0.1,0.4) , rgb(0.1,0.1,1,0.4) )  )
	}
legend("bottomleft", legend = c("SNP markers" , "Darts markers" ) , col = c(rgb(0.1,0.1,1,0.4) , rgb(1,0.1,0.1,0.4)) , bty = 1 , pch=20 , pt.cex = 2, cex = 0.8, horiz = FALSE, inset = c(0.1, 0.1))

dev.off()

