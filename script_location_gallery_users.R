


# Je récupère les stats par pays -> stat -> see more --> year..
# J'améliore a la main le fichier csv

# Je télécharge le shape file des pays ici: http://data.okfn.org/data/datasets/geo-boundaries-world-110m


# Je charge dans R le shapefile des pays
library(rgdal)
countries <- readOGR("countries.geojson", "OGRGeoJSON")

# Je charge le fichier des données d'utilisation de la gallery
data=read.table("data.csv" , header=F , sep=";")
colnames(data)=c("country","freq")

# Add the frequency data to country@data
countries@data=merge( countries@data, data , by.x="admin" , by.y=1 , all.x=T)
# If missing, then 0
countries@data$freq[which(is.na(countries@data$freq))]=0

# Create a continuous palette for the number of users
pal <- colorNumeric( palette = "Blues", domain = countries@data$freq )
binpal <- colorBin("Blues", countries@data$freq, 6, pretty = FALSE)



# Make the map
library(leaflet)
leaflet(countries) %>%
addTiles() %>%
setView( lng = 2.34, lat = 48.85, zoom = 2 ) %>%
addPolygons(stroke = FALSE, smoothFactor = 0.2, fillOpacity = 1, color = ~binpal(countries@data$freq)  )