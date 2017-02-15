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


