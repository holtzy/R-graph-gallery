
# Explication PCA en français :
http://www.pacea.u-bordeaux1.fr/IMG/pdf/TP_ACP.pdf



# library 
library(FactoMineR)

# Set of data :
data(iris)
data=iris

# Basic PCA on the numerical variables :
res.PCA = PCA(data[,1:4], scale.unit=TRUE, ncp=4, graph=F ) 

# Basic plot of the PCA :
png("#85_1_PCA.png" , width = 480, height = 480 )
par(mfrow=c(1,2))
plot.PCA(res.PCA, axes=c(1, 2), choix="ind")
plot.PCA(res.PCA, axes=c(1, 2), choix="var")
dev.off()

# To know what variable is correlated with each axis :
dimdesc(res.PCA, axes=c(1,2))

# PCA with colors on each level of a given factor :
res.PCA = PCA(data, scale.unit=TRUE, ncp=4, graph=F , quali.sup=5) 
png("#85_2_PCA.png" , width = 480, height = 480 )
par(mfrow=c(1,2))
plot.PCA(res.PCA, axes=c(1, 2), choix="ind" , habillage=5)
plot.PCA(res.PCA, axes=c(1, 2), choix="var" , habillage=5)
dev.off()

# PCA with Ellipse around groups
concat = cbind.data.frame(data[,5],res.PCA$ind$coord)
ellipse.coord = coord.ellipse(concat,bary=T)
plot.PCA(res.PCA,habillage=5,ellipse=ellipse.coord,cex=0.8)

# Custom PCA when many individuals
res.PCA = PCA(data, scale.unit=TRUE, ncp=4, graph=F , quali.sup=5) 
my_colors=c( rgb(143,199,74,maxColorValue = 255),rgb(242,104,34,maxColorValue = 255), rgb(111,145,202,maxColorValue = 255),rgb(254,188,18,maxColorValue = 255) , rgb(74,132,54,maxColorValue = 255),rgb(236,33,39,maxColorValue = 255),rgb(165,103,40,maxColorValue = 255))
png("#85_3_PCA.png" , width = 480, height = 480 )
par(mfrow=c(1,1))
par(mar=c(4,5,1,1))
plot(res.PCA$ind$coord[,1] , res.PCA$ind$coord[,2]  , xlab="axis1" , ylab="axis2" , pch=20 , cex=3 , 
	col=my_colors[as.numeric(res.PCA$call$quali.sup$quali.sup[,1])] )
abline(h=0 , v=0)
legend("bottomright" , legend=levels(res.PCA$call$quali.sup$quali.sup[,1] ) , col=my_colors  , pch=20 )
dev.off()



