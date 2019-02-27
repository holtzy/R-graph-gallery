# -----------------------------------------------------------------------------------------------------------------------------------------------------
# #243 LEAFLET CLUSTERIZE MARKERS

# To save in png and in html I need 2 libraries
library(htmlwidgets)
library(webshot)

# Load libraries
library(leaflet)

# Make data with several positions
data=data.frame(LONG=42+rnorm(1000), LAT=23+rnorm(1000), PLACE=paste("place",seq(1,1000)))
	
# Initialize the leaflet map:
m=leaflet() %>% 
	setView(lng=42, lat=23, zoom=8 ) %>%

	# Add two tiles
	addTiles(options = providerTileOptions(noWrap = TRUE)) %>%

	# Add 2 marker groups
	addCircleMarkers(data=data, lng=~LONG , lat=~LAT, radius=8 , color="black",  fillColor="red", stroke = TRUE, fillOpacity = 0.8, clusterOptions = markerClusterOptions()) 
	
saveWidget(m, "243_Leaflet_clusterize_markers.html", selfcontained = TRUE)
webshot("243_Leaflet_clusterize_markers.html", file = "243_Leaflet_clusterize_markers.png", cliprect = "viewport")
# -----------------------------------------------------------------------------------------------------------------------------------------------------


