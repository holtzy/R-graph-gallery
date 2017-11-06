

# -- 1/ create data :
	# We have 3 species : Dicoccoides / Dicoccum / Durum
	# We have 2 treatments : High or Low Nitrogen
	# We have 4 samples per specie per treatment.
	# For each sample we measure the expression of 5 genes
sample=paste(rep("sample_",24) , seq(1,24) , sep="")
specie=c(rep("dicoccoides" , 8) , rep("dicoccum" , 8) , rep("durum" , 8))
data=data.frame(sample,specie)
for (i in seq(1:5)){
  gene=c( sample(c(1:40),8) , sample(c(10:45),8) , sample(c(5:15),8))
  data=cbind(data , gene)
  colnames(data)[ncol(data)]=paste("gene_",i,sep="")
 }


#I arrange data to have a difference between low and High
data[data$specie=="durum" , c(3:7)]=data[data$specie=="durum" , c(3:7)]-30
data

# -- 2/ Calculate distances between samples
rownames(data)=data[,1]    
distance=dist(data[ , c(3:7)] , diag=TRUE)


# -- 3/ Make the MDS
fit <- cmdscale(as.dist(distance) , eig=TRUE, k=2) 
x <- fit$points[,1]
y <- fit$points[,2]

png("#33_MDS_with_names.png" , width = 480, height = 480)
par(mar=c(4,4,2,2))
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", main="", col="white" , xlim=c(-65,78) )
text(x,y, data$sample , col=as.numeric(data$specie) , lwd=5 , cex=1.3)
legend("topright", legend = c("durum","dicoccum","dicoccoides") , col = c("green","red","black") , pch =20 , bty = "n",  pt.cex = 1.7, cex = 1 , text.col = "black", horiz = FALSE, inset = c(0.1, 0.1))
dev.off()






