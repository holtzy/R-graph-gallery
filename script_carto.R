#######
#  Tuto CARTO.
######


# -----------------------------
Présentation: wukan.ums-riate.fr/r2016/#cartographie
rmd fait avec le template: readthedown / juba / rmdformats




R=bien pour faire de la carto apparemment.
Permet de se libérer des logiciels propriétaires.

3 packages principaux pour faire des cartes de base.

- RGDAL:
lien R vers GDAL. Permet d'importer les données de type spatial. Permet aussi de faire les transfo de sphère (la terre), vers le plan.
qgis= SIG libre.
Layer =couche de données.

- SP
permet d'affichier les shapes files qu'on a chargé avec RGDAL

- RGEOS
interface le logiciel GEOS. Permet de faire les opérations de SIG classsiques. Genre calcul de surface, etc...
Exemple, je peux aggréger tous les polygones d'un objet en un seul objet.
Quand on afficher un plot, c'est un plot classique de R. Avec un repère en R x et y. Donc on peut ajouter un main et tout autre type de fonction de plot R.
On peut aussi ajouter un buffer.

Pour faire mieux: package cartography.
Donne un jeu de données avec.
A quoi il sert de plus?
- Faire une carte chloroplethes= carte avec les couleurs proportionnelles a une donnée quanti. En une seule ligne de commande.
Et plein d'option pour personnaliser le graph.
- Faire une carte avec des cercles d'une taille proportionnelle à une donnée.
- carte de flux: combien j'ai de transfert de qqchose entre tel et tel endroit.
- passage en un cadrillage régulier. En fait, le fait d'avoir des polygones qui représentent les régions avec des tailles différentes. Ca peut piéger ce que l'on observe.
Attention a google-->, pas le droit de tout récupérer  et utiliser n'importe comment. Voir openstreet map pour une utilisation professionnelle!



COMMENT PROJETER UNE CARTE
projeter=passer d'une sphere au plan?
- Projection mercator. Les surfaces sont déformées au poles. C'est la 
- Projectioin UTM
Attention a la différence entre les 2, surtour pour faire des calculs.
# -----------------------------











# -----------------------------
Exercice

Source des données: 
GEOFLA qui donne les polygones des communes et départements.
Natural Earth pour les polygones de l'espagne et de la france.
voir aussi l'IGN.

# Pour récupérer depuis le net:
1/ récupérer fichier shape file récupérer sur le web. = fichier .shp. C'est un fichier que je peux ouvrir avec qgis.
2/ importer dans r:
monspdf=readOGR( dsn= monpwd , layer="nomdufichiersans le.shp") 
3/ Export si nécessaire
writeOGR(obj=monspdf, dsn=monpwd , layer="hcom2"
4/ on peiut travailler avec!
plot(monspdf)

Donc en gros il faut télécharger les "shapefile" sur le net, puis passer par rgdal pour obtenir un objet au format sp.

# On charge de fichier de données;
cd /Users/holtz/Desktop
load("Occitanie.RData")

# On charge les librairies nécessaires:
library(sp)
library("rgdal")
library(cartography)


# Description des objets chargés:
# - com: polygone des communes. Objet déja chargé avec rgdal. Donc directement exploitable pour faire des cartes.
# C'est un objet sp. Il a des attributs que l'on peut appeler avec com$qqchose
names(COM)
# C'est un objet qui a aussi des slots:
com@data  #pour voir le tableau complet

# - csp = data frame avec plein de valeurs.
# - dep
# - espagne


# Afficher le découpage des régions ou des départements?
# Basique:
plot(com)
plot(dep)
# Amélioré


# Je créé un objet (dep76) qui sont tous les départements de la régions.
dep76=dep[dep$CODE_REG==76 , ]
plot(dep76)

#Du coup  je peux ploter les 2:
plot(com)
plot(dep76 , add=T)


# Meme graph en mieux:
plot(espagne , xlim=bbox(com) , ylim=bbox(com))

Attention, pour représenter une variable sur une carte, il faut utiliser des cercle de taille proportionnelle. En effet,
si on utilise un gradient de couleur, les tous petits polygones ne seront pas très visibles.


com@data$dens=100* com@data$POPULATION / com@data$SUPERFICIE
# affichage en chloropleth
choroLayer(spdf = com, df = com@data, var = "dens")


# le lot
com46=com[com$CODE_DEPT==46, ]
plot(com46 , col=c(1,2,3) )	


Le probleme de toutes ces cartes c'est qu'elles sont statique.
Le truc cool c'est aussi de pouvoir faire des cartes interactives!

Et ca c'est possible via le package 
- mapview par exemple (très simple) ou 
- leaflet qui interface javascript. Ne prend que la projection de google.  Du coup il faut utiliser la fonction spTransform pour obtenir un format buvable,.


Fonction getFigDim pour choper la taille que je dois donner a ma fonction png pour sortir mon image a un format fidele a ce que j'ai pu observer.
=================
Les données Raster.









# =================================================
LETS TRY
# =================================================




# =================================================
#168_GET_A_SHAPE_FILE_INTO_R

# Make a new folder
# Download the shapefile of world countries borders. Found on http://thematicmapping.org/downloads/world_borders.php
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="world_shape_file.zip")

# Unzip this file.
system("unzip world_shape_file.zip")
# You now have 4 files. One of these files is a .shp file! (TM_WORLD_BORDERS_SIMPL-0.3.shp)

# Read this shape file with the rgdal library. 
library(rgdal)
my_spdf=readOGR( dsn= getwd() , layer="TM_WORLD_BORDERS_SIMPL-0.3") 
# Now you have a Spdf object (spatial polygon data frame). You can start doing maps !

# Print your shapefile
par(mar=c(0,0,0,0)) 
png("#168_get_shapefile_into_R.png" , width = 480, height = 480 )
plot(my_spdf)
dev.off()

# =================================================




# =================================================
#169_BASIC_MANIPULATION_OF_SHAPE_FILE

# See graph #168 to understand how to upload a shapefile from the web.
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="world_shape_file.zip")
system("unzip world_shape_file.zip")
library(rgdal)
my_spdf=readOGR( dsn= getwd() , layer="TM_WORLD_BORDERS_SIMPL-0.3") 

# First we can plot the complete shape file that is under the spdf format
plot(my_spdf)

# The plot has usual coordinates that you can see doing:
my_spdf@bbox

# We can zoom on a part of the map (australia)
par(mar=c(0,0,0,0)) 
png("#169_basic_manipulation_zoom.png" , width = 480, height = 480 )
plot(my_spdf , xlim=c(115,160) , ylim=c(-45,-10) )
dev.off()

# There is always data associated with the spdf object. Have a look at them
head(my_spdf@data)
dim(my_spdf@data)

# That means you can filter the data. For example, keep only Africa and plot it
africa=my_spdf[my_spdf@data$REGION==2 , ]
png("#170_basic_manipulation_select_data.png" , width = 480, height = 480 )
plot(africa , xlim=c(-20,60) , ylim=c(-40,35) )
dev.off()

# =================================================






# =================================================
#171 - 172 COLOR THE SHAPE FILE
--> works like for every graphics, just give a vector of color corresponding to the data frame @data

# See graph #168 and #169 to get africa shapefile
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="world_shape_file.zip")
system("unzip world_shape_file.zip")
library(rgdal)
my_spdf=readOGR( dsn= getwd() , layer="TM_WORLD_BORDERS_SIMPL-0.3") 
africa=my_spdf[my_spdf@data$REGION==2 , ]

# Unique color for the map and background for the see.
png("#171_uniform_color_on_map.png" , width = 480, height = 480 )
plot(africa , xlim=c(-20,60) , ylim=c(-37,38), col=rgb(0.1,0.9,0.3,0.2) , bg = "#A6CAE0" )
dev.off()

# Give a random color for each country
png("#172_random_color_per_country.png" , width = 480, height = 480 )
plot(africa , xlim=c(-20,60) , ylim=c(-40,35), col=colors()[1:100] , bg = "#A6CAE0")
dev.off()

# =================================================



# =================================================
173 Basic CLOROPLETH MAP handmade

# See graph #168 and #169 to get africa shapefile
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="world_shape_file.zip")
system("unzip world_shape_file.zip")
library(rgdal)
my_spdf=readOGR( dsn= getwd() , layer="TM_WORLD_BORDERS_SIMPL-0.3") 
africa=my_spdf[my_spdf@data$REGION==2 , ]

# A vector of color proportional of the number of inhabitant in the country in 2005 (data are in the spdf@data dataframe)

# Palette of 30 shades of blue with Rcolor brewer.
library(RColorBrewer)
my_colors = brewer.pal(9, "Reds") 
my_colors = colorRampPalette(my_colors)(30)

# Attribute on shade to each country
class_of_country= cut(africa@data$POP2005, 30)
my_colors=my_colors[as.numeric(class_of_country)]

# Make the plot
png("#173_Basic_Cloropleth_map.png" , width = 480, height = 480 )
plot(africa , xlim=c(-20,60) , ylim=c(-40,35), col=my_colors ,  bg = "#A6CAE0")
dev.off()

# Wanna keep the world around it?
png("#173_Basic_Cloropleth_map2.png" , width = 480, height = 480 )
plot(africa , xlim=c(-20,60) , ylim=c(-40,35), col=my_colors ,  bg = "#A6CAE0")
plot(my_spdf,add=T)
dev.off()

# =================================================



# =================================================
174 FROM SHAPE FILE TO OPEN-STREET-MAP

png("#174_Open_street_map_background.png" , width = 480, height = 480 )


# library
library(cartography)

# Get data from the package
data("nuts2006")

# extract Denmark
spdf <- nuts0.spdf[nuts0.spdf$id == "DK", ]

# Download the tiles, extent = Denmark
den <- getTiles(spdf = spdf, type = "osmtransport",  crop = TRUE, zoom = 7)

# Plot the tiles
tilesLayer(den)
# Plot countries
plot(spdf, border = "red", lwd = 2, add = TRUE)
# Map tiles sources
mtext(text = "Map data © OpenStreetMap contributors, under CC BY SA.",  side = 1, adj = 0, cex = 0.7, font = 3, line = -2)

dev.off()
    
# =================================================


# =================================================
175 CLOROPLETH MAP WITH CARTOGRAPHY PACKAGE

# See graph #168 and #169 to get africa shapefile
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="world_shape_file.zip")
system("unzip world_shape_file.zip")
library(rgdal)
my_spdf=readOGR( dsn= getwd() , layer="TM_WORLD_BORDERS_SIMPL-0.3") 
africa=my_spdf[my_spdf@data$REGION==2 , ]

# Use the cartography library to do the choropleth map
png("#175_Choropleth_map_with_cartography_library.png" , width = 480, height = 480 )
library(cartography)
choroLayer(spdf = africa, df = africa@data, var = "POP2005")
title("Number of people living in Africa's country in 2005")
dev.off()

# Same stuff for europe, data are provided with the package
png("#175_Choropleth_map_with_cartography_library_europe.png" , width = 480, height = 480 )
data(nuts2006)
choroLayer(spdf = nuts2.spdf, df = nuts2.df, var = "pop2008" , legend.pos = "right")
title("Population in 2008")
dev.off()

# =================================================



# =================================================
176 CUSTOM CLOROPLETH MAP WITH THE CARTOGRAPHY PACKAGE

png("#176_Custom_Choropleth_map_with_cartography_library.png" , width = 480, height = 480  )

# Cartography Library
library(cartography)

# Upload data attached with the package.
data(nuts2006)

# Now we have a spdf file (shape file) called nuts2.spdf with shape of european regions.
# We also have a dataframe with information concerning every region.Both object have a first column "id" that makes the link between them.
head(nuts2.df)

# Annual growth per region
nuts2.df$cagr <- 100 * (((nuts2.df$pop2008/nuts2.df$pop1999)^(1/9)) -  1)

# Build a color palette
cols <- carto.pal(pal1 = "green.pal", n1 = 2, pal2 = "red.pal", n2 = 4)

# plot backgroud shapes (sea and world)
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)

# Add annual growth
choroLayer(spdf = nuts2.spdf, df = nuts2.df, var = "cagr", 
    breaks = c(-2.43, -1, 0, 0.5, 1, 2, 3.1), col = cols, 
    border = "grey40", lwd = 0.5, legend.pos = "right", 
    legend.title.txt = "taux de croissance\nannuel moyen", 
    legend.values.rnd = 2, add = TRUE)

# Add borders
plot(nuts0.spdf, border = "grey20", lwd = 0.75, add = TRUE)

# Add titles, legend ...
layoutLayer(title = "Growth rate in Europe", 
    author = "cartography", sources = "Eurostat, 2008", 
    frame = TRUE, col = NA, scale = NULL, coltitle = "black", 
    south = TRUE)

dev.off()
# =================================================






# =================================================
177 MAP WITH PROPORTIONAL SYMBOLS (CARTOGRAPHY PACKAGE)

png("#177_Map_with_proportional_symbols_cartography_package.png" , width = 480, height = 480  )

# Chargement de la librairie
library(cartography)

# Upload data attached with the package.
data(nuts2006)

# Now we have a spdf file (shape file) called nuts2.spdf with shape of european regions. We can plot it with the plot function.
summary(nuts2.spdf)
# We also have a dataframe with information concerning every region.
head(nuts2.df)
# Both object have a first column "id" that makes the link between them.

# Plot Europe
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)
plot(nuts0.spdf, col = "#D1914D", border = "grey80", 
    add = TRUE)

# Add circles proportional to the total population
propSymbolsLayer(spdf = nuts0.spdf, df = nuts0.df, 
    var = "pop2008", symbols = "circle", col = "#920000", 
    legend.pos = "right", legend.title.txt = "Total\npopulation (2008)", 
    legend.style = "c")

# Add titles, legend...
layoutLayer(title = "Countries Population in Europe", 
    author = "cartography", sources = "Eurostat, 2008", 
    scale = NULL, south = TRUE)

dev.off()
# =================================================







# =================================================
178 MAP WITH GRID (CARTOGRAPHY PACKAGE)

png("#178_Map_with_grid_cartography_package.png" , width = 480, height = 480  )

# Chargement de la librairie
library(cartography)

# Upload data attached with the package.
data(nuts2006)

# Now we have a spdf file (shape file) called nuts2.spdf with shape of european regions. We can plot it with the plot function.
summary(nuts2.spdf)
# We also have a dataframe with information concerning every region.
head(nuts2.df)
# Both object have a first column "id" that makes the link between them.

# Create a grid
mygrid <- getGridLayer(spdf = nuts2.spdf, cellsize = 2e+05)

# You can plot the grid
# plot(mygrid$spdf)

# Adapt grid to a numerical variable
datagrid.df <- getGridData(x = mygrid, df = nuts2.df, var = "pop2008")
datagrid.df$densitykm <- datagrid.df$pop2008_density *  1000 * 1000

# Plot background
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")
plot(world.spdf, col = "#E3DEBF", border = NA, add = TRUE)

# Plot density of population
choroLayer(spdf = mygrid$spdf, df = datagrid.df, var = "densitykm", 
    border = "grey80", col = carto.pal(pal1 = "wine.pal", n1 = 6), 
    legend.pos = "topright", method = "q6", 
    add = TRUE, legend.title.txt = "Population Density\n(inhabitant/km²)")

# Title, legend..
layoutLayer(title = "Population Density", coltitle = "black", 
    col = NA, sources = "Eurostat, 2011", scale = NULL, 
    author = "cartography", frame = FALSE)

dev.off()
# =================================================





# =================================================
# =================================================
 LEAFLET
 
# =================================================
# =================================================

 
 
# =================================================

# 179 SHOW A PIECE OF MAP WITH LEAFLET

#Library
library(leaflet)

# To save in png and in html I need 2 libraries
library(htmlwidgets)
library(webshot)

# We always initiate a leaflet map with the leaflet() function
m=leaflet()
# Then we Add default OpenStreetMap map tiles
m=addTiles(m)
m
saveWidget(m, "179_show_a_basic_map.html", selfcontained = TRUE)
webshot("179_show_a_basic_map.html", file = "179_show_a_basic_map.png", cliprect = "viewport")

# We can choose a zone:
m=leaflet()
m=addTiles(m)
m=setView(m, lng = 166.45, lat = -21, zoom = 7)
m
## save in html & png
saveWidget(m, "179_zoom_on_a_zone_leaflet.html", selfcontained = TRUE)
webshot("179_zoom_on_a_zone_leaflet.html", file = "179_zoom_on_a_zone_leaflet.png",cliprect = "viewport")

# Same stuff but using the %>% operator
#m=leaflet() %>% addTiles() %>% setView( lng = 166.45, lat = -22.25, zoom = 8 )
#m
# =================================================



# =================================================

180 Change background LEAFLET

#Library
library(leaflet)

# To save in png and in html I need 2 libraries
library(htmlwidgets)
library(webshot)

# We can change the tile style. See the list of possibilities here: http://leaflet-extras.github.io/leaflet-providers/preview/index.html
m=leaflet() %>% addTiles() %>% setView( lng = 2.34, lat = 48.85, zoom = 5 ) %>% addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")
m
saveWidget(m, "180_Change_background_leaflet_1.html", selfcontained = TRUE)
webshot("180_Change_background_leaflet_1.html", file = "180_Change_background_leaflet_1.png", cliprect = "viewport")

m=leaflet() %>% addTiles() %>% setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% addProviderTiles("Esri.WorldImagery")
m
saveWidget(m, "180_Change_background_leaflet_2.html", selfcontained = TRUE)
webshot("180_Change_background_leaflet_2.html", file = "180_Change_background_leaflet_2.png", cliprect = "viewport")
 
 
# =================================================

 
 
 
# =================================================

181 ADD MARKERS WITH LEAFLET.

Markers will keep the SAME size, event when you zoom / unzoom!
Popup option=what you want to see when you click a marker

#library
library(leaflet)

# To save in png and in html I need 2 libraries
library(htmlwidgets)
library(webshot)

# Create 10 markers (Random points)
data=data.frame(long=sample(seq(-150,150),10) ,  lat=sample(seq(-50,50),10) , val=round(rnorm(10),2) , name=paste("point",letters[1:10],sep="_")  ) 
 
# Show a marker at each position
m=leaflet(data = data) %>% addTiles() %>% addMarkers(~long, ~lat, popup = ~as.character(name))
m
saveWidget(m, "181_Add_markers_on_leaflet.html", selfcontained = TRUE)
webshot("181_Add_markers_on_leaflet.html", file = "181_Add_markers_on_leaflet.png", cliprect = "viewport")

# =================================================


 
 
# =================================================
 
182 - ADD CIRCLES
 
# To save in png and in html I need 2 libraries
library(htmlwidgets)
library(webshot)

#library
library(leaflet)

# Create 20 markers (Random points)
data=data.frame(long=sample(seq(-150,150),20) ,  lat=sample(seq(-50,50),20) , val=round(rnorm(20),2) , name=paste("point",letters[1:20],sep="_")  ) 

# Show a circle at each position
m=leaflet(data = data) %>% addTiles() %>% addCircleMarkers(~long, ~lat , popup = ~as.character(name))
m
saveWidget(m, "182_Add_basic_circle_on_leaflet.html", selfcontained = TRUE)
webshot("182_Add_basic_circle_on_leaflet.html", file = "182_Add_basic_circle_on_leaflet.png", cliprect = "viewport")

# Show a CUSTOM circle at each position. Size defined in Pixel. Size does not change when you zoom
m=leaflet(data = data) %>% addTiles() %>%  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~long, ~lat, 
  	radius=~val*14 , 
  	color=~ifelse(data$val>0 , "red", "orange"),
  	stroke = TRUE, 
  	fillOpacity = 0.2,
  	popup = ~as.character(name)
  	) 
m
saveWidget(m, "182_Add_custom_circle_on_leaflet.html", selfcontained = TRUE)
webshot("182_Add_custom_circle_on_leaflet.html", file = "182_Add_custom_circle_on_leaflet.png", cliprect = "viewport")

# Show a CUSTOM circle at each position. Size in meters --> change when you zoom.
m=leaflet(data = data) %>% addTiles()  %>%  addProviderTiles("Esri.WorldImagery") %>%
  addCircles(~long, ~lat, 
  	radius=~val*1000000 , 
  	color=~ifelse(data$val>0 , "red", "orange"),
  	stroke = TRUE, 
  	fillOpacity = 0.2,
  	popup = ~as.character(name)
  	) %>% 
  setView( lng = 166.45, lat = 21, zoom = 2)
m
saveWidget(m, "182_Add_custom_circle_on_leaflet_2.html", selfcontained = TRUE)
webshot("182_Add_custom_circle_on_leaflet_2.html", file = "182_Add_custom_circle_on_leaflet_2.png", cliprect = "viewport")

# Show a rectangle
m=leaflet() %>% addTiles() %>%  
  addRectangles(
    lng1=-118.456554, lat1=34.078039,
    lng2=-118.436383, lat2=34.062717,
    fillColor = "transparent"
  )
m
saveWidget(m, "182_Add_rectangle_on_leaflet_2.html", selfcontained = TRUE)
webshot("182_Add_rectangle_on_leaflet_2.html", file = "182_Add_rectangle_on_leaflet_2.png", cliprect = "viewport")

# =================================================





# =================================================
183 CHLOROPLETH MAP LEAFLET

# To save in png and in html I need 2 libraries
library(htmlwidgets)
library(webshot)

#library
library(leaflet)

# Get the world shape file. You can also download the .shp file somewhere on the net. See graph xx
# See graph #168 to understand how to upload a shapefile from the web.
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="world_shape_file.zip")
system("unzip world_shape_file.zip")
library(rgdal)
world_spdf=readOGR( dsn= getwd() , layer="TM_WORLD_BORDERS_SIMPL-0.3") 


# Then plot this spdf file with polygon around each country

# Color by quantile
m=leaflet(world_spdf)%>% addTiles()  %>% setView( lat=10, lng=0 , zoom=2) %>%
  addPolygons( stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5, color = ~colorQuantile("YlOrRd", POP2005)(POP2005) )
m
saveWidget(m, "183_Choropleth_map_leaflet_quantile.html", selfcontained = TRUE)
webshot("183_Choropleth_map_leaflet_quantile.html", file = "183_Choropleth_map_leaflet_quantile.png", cliprect = "viewport")

# Numeric palette
m=leaflet(world_spdf)%>% addTiles()  %>% setView( lat=10, lng=0 , zoom=2) %>%
  addPolygons( stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5, color = ~colorNumeric("YlOrRd", POP2005)(POP2005) )
m
saveWidget(m, "183_Choropleth_map_leaflet_numeric.html", selfcontained = TRUE)
webshot("183_Choropleth_map_leaflet_numeric.html", file = "183_Choropleth_map_leaflet_numeric.png", cliprect = "viewport")

# Bin
m=leaflet(world_spdf)%>% addTiles()  %>% setView( lat=10, lng=0 , zoom=2) %>%
  addPolygons( stroke = FALSE, fillOpacity = 0.5, smoothFactor = 0.5, color = ~colorBin("YlOrRd", POP2005)(POP2005) )
m
saveWidget(m, "183_Choropleth_map_leaflet_bin.html", selfcontained = TRUE)
webshot("183_Choropleth_map_leaflet_bin.html", file = "183_Choropleth_map_leaflet_bin.png", cliprect = "viewport")

# =================================================






# =================================================

#184 CARTO MIX

#library
library(cartography)

# Load data
data(nuts2006)

# Save image
sizes <- getFigDim(spdf = nuts0.spdf, width = 600, mar = c(0,0,0,0), res = 100)
png('#184_Cartography_mix.png', width = sizes[1], height = sizes[2], res = 100)

# set margins
opar <- par(mar = c(0,0,0,0))

# Plot basemaps
plot(nuts0.spdf, border = NA, col = NA, bg = "#A6CAE0")
plot(world.spdf, col  = "#E3DEBF80", border=NA, add=TRUE)
plot(nuts0.spdf, border = "white", col = "#E3DEBF", lwd= 1.1, add=T)


# Plot an OSM Layer
spdf <- nuts3.spdf[substr(nuts3.spdf$id,1,2) %in% c('AT', 'CH', "SI", "IT"),]
OSMTILES <- getTiles(spdf = spdf, type = "osmtransport", zoom = 5, crop = TRUE)
tilesLayer(OSMTILES, add=TRUE)


# Plot a choropleth layer
spdf <- nuts2.spdf[substr(nuts2.spdf$id,1,2) =="DE",]
nuts2.df$gdppercap <- nuts2.df$gdppps2008 / nuts2.df$pop2008
choroLayer(spdf = spdf, df = nuts2.df, var = "gdppercap", border = "white", 
           lwd = 0.4, col = carto.pal(pal1 = "sand.pal", n1 = ),
           legend.pos = "n", add= TRUE)


# Plot proportional squares
spdf <- nuts1.spdf[substr(nuts1.spdf$id,1,2) %in% c("BE", "NL", "LU"),]
propSymbolsLayer(spdf = spdf, df = nuts1.df, var = "pop2008", 
                 border = "#7C000C",
                 symbols = "square", inches = 0.2, col = "#ff000080", 
                 legend.pos = "n")


# Plot proportional bars
spdf <- nuts1.spdf[substr(nuts1.spdf$id,1,2) %in% c("TR"),]
plot(spdf, add=T, col = NA, border = "grey50", lwd = 0.5, lty = 2)
propSymbolsLayer(spdf = spdf, df = nuts1.df, var = "pop2008", 
                 symbols = "bar", inches = 1, col = "#155F28", 
                 legend.pos = "n", border = "grey")


# Plot a typologie layer
spdf <- nuts3.spdf[substr(nuts3.spdf$id,1,2) %in% c("EE","LT",'LV'),]
typoLayer(spdf = spdf, df = nuts3.df, var = "id", add=T, legend.pos = "n")


# Plot proportional circles
spdf <- nuts3.spdf[substr(nuts3.spdf$id,1,2) %in% c("FI"),]
propSymbolsLayer(spdf = spdf, df = nuts3.df, var = "pop2008", 
                 inches = 0.15, col = "#301551", legend.pos = "n", 
                 border = "white")


# Create and plot a grid layer (absolute)
spdf <- nuts3.spdf[substr(nuts3.spdf$id,1,2) %in% c("FR"),]
mygrid <- getGridLayer(spdf = spdf,cellsize = 50000)
datagrid.df <- getGridData(mygrid, nuts3.df, "pop2008",dfid=NULL)
propSymbolsLayer(spdf = mygrid$spdf, df = datagrid.df, 
                 legend.pos = "n", border = "white",
                 var = "pop2008", inches = 0.1, col="darkblue", add=TRUE)


# Create and plot a grid layer (relative)
spdf <- nuts3.spdf[substr(nuts3.spdf$id,1,2) %in% c("ES", "PT"),]
mygrid <- getGridLayer(spdf = spdf,cellsize = 75000)
datagrid.df <- getGridData(mygrid, nuts3.df, "pop2008",dfid=NULL)
datagrid.df$densitykm <- datagrid.df$pop2008_density*1000*1000
cols <- carto.pal(pal1 = "wine.pal", n1 = 6)
choroLayer(spdf = mygrid$spdf,df = datagrid.df,var = "densitykm", add=TRUE,
           border = "grey80",col=cols,
           legend.pos = "n", method = "q6")


# Plot a dot density layer
spdf <- nuts3.spdf[substr(nuts3.spdf$id,1,2) %in% c("SE", "NO"),]
dotDensityLayer(spdf = spdf, df=nuts3.df,var="pop2008", add = TRUE, 
                col = "grey30",
                n = 100000,  pch = 20, cex = 0.5, legend.pos = "n")

# Plot a proportional links layer
twincities.df <- twincities[substr(twincities$i,1,2) %in% c("IT") & 
                              substr(twincities$j,1,2) %in% c("IT",'AT', "SI", 
                                                              "GR", "CH"), ]
twincities.spdf <- getLinkLayer(spdf = nuts2.spdf, df = twincities.df[,1:2])
gradLinkLayer(spdf = twincities.spdf, df = twincities.df,
              spdfids = "i", spdfide = "j",
              dfids = "i", dfide = "j",legend.pos = "n",
              var = "fij", breaks = c(1,2,4,10), lwd = c(0.5,4,10),
              col = "#92000090", add = TRUE)


# Plot a label layer
spdf <- nuts0.spdf[nuts0.spdf$id %in% c("IS", "CY"),]
df <- data.frame(id = spdf$id, names = c("Cyprus", "Iceland"))
labelLayer(spdf = spdf, df = df, txt =  "names", font = 2)


# Plot Discontinuities
spdf <- nuts3.spdf[substr(nuts3.spdf$id,1,2) %in% c("PL", "CZ", "SK", "HU"),]
bord <- getBorders(spdf)
cols <- carto.pal(pal1 = "blue.pal", n1 = 3, pal2 = "green.pal", n2 = 3)
nuts3.df$gdppercap <- nuts3.df$gdppps2008/nuts3.df$pop2008
choroLayer(spdf = spdf, df = nuts3.df, var = "gdppercap", method = "q6",
           col = cols, add=T, border = NA, legend.pos = F)
discLayer(spdf = bord, df = nuts3.df,
          var = "gdppercap", col="red", nclass=5,
          method="quantile", threshold = 0.25, sizemin = 1,
          sizemax = 3, type = "rel", 
          legend.pos = "n", add=TRUE)


# Plot a double proportional triangles layer
spdf <- nuts1.spdf[substr(nuts1.spdf$id,1,2) %in% c("IE","UK"),]
propTrianglesLayer(spdf = spdf, df = nuts1.df, var1 = "birth_2008", 
                   var2 = "death_2008", legend.pos = "n", k = 0.075)


# Plot a proportional symbols layer + choro
spdf <- nuts3.spdf[substr(nuts3.spdf$id,1,2) %in% c("GR", "BG", "RO", "MK"),]
propSymbolsChoroLayer(spdf = spdf, df = nuts3.df, var2 = "gdppercap", 
                      var = "gdppps2008",add=T, inches = 0.15,
                      col = carto.pal(pal1 = "orange.pal", 8), 
                      legend.var.pos = "n", legend.var2.pos = "n")

# Plot a proportional symbol layer + typo
spdf <- nuts2.spdf[substr(nuts2.spdf$id,1,2) %in% c("DK"),]
nuts2.df$bidon <- 5
propSymbolsTypoLayer(spdf = spdf, df = nuts2.df, var = "bidon", var2 = "id", 
                     add=T, inches = 0.05,
                     legend.var.pos = "n", legend.var2.pos = "n")


# Plot a layout (sources, scale, text, etc.)
layoutLayer(title = "",
            sources = "Eurostat - 2008, OpenStreetMap & contributors - 2016",  
            author = "T. Giraud & N. Lambert © UMS RIATE - 2016", 
            col = NA, 
            coltitle = "black", 
            frame = FALSE, 
            south = TRUE)  
text(x = 6278256, y = 4273436, labels = "Cartographic mix
made with\nthe cartography\nR package",
cex = 1.2, adj = 1, pos = 1, font=2)

dev.off()




# =================================================
 185
 # SAVE MAP WITH LEAFLET




