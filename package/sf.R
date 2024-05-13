rm(list=ls())
library(maps)
library(sf)
library(ggplot2)
library(patchwork)

# create a map of the USA
usa = st_as_sf(map('usa', plot = FALSE, fill = TRUE))
laea = st_crs("+proj=laea +lat_0=30 +lon_0=-95") # Lambert equal area projection
usa2 <- st_transform(usa, laea)

# create ggplot objects with graticules
p1 = ggplot(data = usa) + 
  geom_sf() + 
  theme_minimal()

p2 = ggplot(data = usa2) + 
  geom_sf() + 
  theme_minimal()

# combine plots with patchwork
p1 + p2

nc = st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
ncg = st_geometry(nc)
plot(ncg, border = 'grey')
cntrd = st_centroid(ncg)
plot(cntrd, col = 'red', add = TRUE, cex = .5)
