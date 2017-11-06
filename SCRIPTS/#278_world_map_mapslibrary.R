
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 278: THE MAPS LIBRARY
#################



# library
library(maps)

# the maps library is interesting because it allows to map common places without calling shape files on the web.
# Common places are saved in this package.

# An empty map of the world
png("#278_world_map_mapslibrary1.png" , width = 980, height = 480 )
par(mar=c(0,0,0,0))
map('world',col="#f2f2f2", fill=TRUE, bg="white", lwd=0.05, mar=rep(0,4),border=0, ylim=c(-80,80) )
dev.off()

# It works like a normal plot after that, so wee can add points for example
data=as.data.frame(rbind(
	Buenos_aires=c(-58,-34),
	Paris=c(2,49),
	Melbourne=c(145,-38),
	Saint.Petersburg=c(30.32, 59.93),
	Abidjan=c(-4.03, 5.33),
	Montreal=c(-73.57, 45.52),
	Nairobi=c(36.82, -1.29),
	Salvador=c(-38.5, -12.97)
	))
colnames(data)=c("long","lat")

# make the map
png("#278_world_map_mapslibrary2.png" , width = 980, height = 480 )
par(mar=c(0,0,0,0))
map('world',col="#f2f2f2", fill=TRUE, bg="white", lwd=0.05,mar=rep(0,4),border=0, ylim=c(-80,80) )
points(x=data$long, y=data$lat, col="slateblue", cex=2, pch=20)
text(rownames(data), x=data$long, y=data$lat,  col="slateblue", cex=1, pos=4)
dev.off()

# Several places are available with this package:
png("#278_world_map_mapslibrary3.png" , width = 980, height = 480 )
map('county', col="#f2f2f2", fill=TRUE, bg="#A6CAE0",  mar=rep(0,4), border=0)
dev.off()
png("#278_world_map_mapslibrary4.png" , width = 980, height = 480 )
map('france',col="#f2f2f2", fill=TRUE, bg="#A6CAE0", mar=rep(0,4), border=0 )
dev.off()
png("#278_world_map_mapslibrary5.png" , width = 980, height = 480 )
map('nz',col="#f2f2f2", fill=TRUE, bg="#A6CAE0", mar=rep(0,4), border=0 )
dev.off()
png("#278_world_map_mapslibrary6.png" , width = 980, height = 480 )
map('italy', fill=TRUE, col="#f2f2f2", bg="#A6CAE0", mar=rep(0,4), border=0 )
dev.off()

#need more !
 
