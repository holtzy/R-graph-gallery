


# -----------------------------------------------------------------------------------------------------------------------------------------------------

#143_Spider_Chart
par(mar=c(0,0,0,0))
set.seed(99)

# Library
library(fmsb)

# Create data: note in High school for several students
data=as.data.frame(matrix( sample( 0:20 , 15 , replace=F) , ncol=5))
colnames(data)=c("math" , "english" , "biology" , "music" , "R-coding" )
rownames(data)=paste("mister" , letters[1:3] , sep="-")

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data=rbind(rep(20,5) , rep(0,5) , data)

# The default radar chart proposed by the library:
png("#143_radar_chart_multi_indiv_1.png" , width = 480, height = 480 )
radarchart(data)
dev.off()

# Custom the radarChart !
png("#143_radar_chart_multi_indiv_2.png" , width = 480, height = 480 )
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( data  , axistype=1 , 
	#custom polygon
	pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
	#custom the grid
	cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
	#custom labels
	vlcex=0.8 
	)
legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)
dev.off()


# Custom the radarChart !
png("#143_radar_chart_multi_indiv_3.png" , width = 480, height = 480 )
colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( data[-c(1,2),]  , axistype=0 , maxmin=F,
	#custom polygon
	pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
	#custom the grid
	cglcol="grey", cglty=1, axislabcol="black", cglwd=0.8, 
	#custom labels
	vlcex=0.8 
	)
legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)
dev.off()


