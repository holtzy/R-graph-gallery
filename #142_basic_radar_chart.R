

# -----------------------------------------------------------------------------------------------------------------------------------------------------
   -  RADAR CHART  -
# -----------------------------------------------------------------------------------------------------------------------------------------------------

# Option:
# - Maxmin : si F, alors max et min sont calculés sur les données, si T, alors on donne ces valeurs en ligne 1 et 2 du tableau d'entrée.
# - Axistype : entre 0 et 5, = de rien a beaucoup d'annotation.
# - pty, pcol, plty, plwd, pdensity, pangle, pfcol --> for the polygon design
# - cglty, cglwd, cglcol, axislabcol
# - vlabels, vlcex




# -----------------------------------------------------------------------------------------------------------------------------------------------------

#142_Basic_Radar_Chart
par(mar=c(0,0,0,0))

# Library
library(fmsb)

# Create data: note in High school for Jonathan:
data=as.data.frame(matrix( sample( 2:20 , 10 , replace=T) , ncol=10))
colnames(data)=c("math" , "english" , "biology" , "music" , "R-coding", "data-viz" , "french" , "physic", "statistic", "sport" )

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data=rbind(rep(20,10) , rep(0,10) , data)

# The default radar chart proposed by the library:
png("#142_basic_radar_chart_1.png" , width = 480, height = 480 )
radarchart(data)
dev.off()

# Custom the radarChart !
png("#142_basic_radar_chart_2.png" , width = 480, height = 480 )
radarchart( data  , axistype=1 , 
	#custom polygon
	pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
	#custom the grid
	cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
	#custom labels
	vlcex=0.8 
	)
dev.off()
# -----------------------------------------------------------------------------------------------------------------------------------------------------

