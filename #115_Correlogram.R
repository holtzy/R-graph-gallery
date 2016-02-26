WEB : 
http://www.statmethods.net/advgraphs/correlograms.html


par(mar=c(0,0,0,0))

# Charge the Corrgram library
library(corrgram)

# We are going to use the mtcars dataset that looks like that :
head(mtcars)

# First Correlogram Example
png("#115_Correlogram-1.png" , width = 480, height = 480)
corrgram(mtcars, order=TRUE, lower.panel=panel.shade, upper.panel=panel.pie, text.panel=panel.txt, main="Car Milage Data in PC2/PC1 Order") 
dev.off()

# Second Correlogram Example
png("#115_Correlogram-2.png" , width = 480, height = 480)
corrgram(mtcars, order=TRUE, lower.panel=panel.ellipse, upper.panel=panel.pts, text.panel=panel.txt, diag.panel=panel.minmax, main="Car Milage Data in PC2/PC1 Order") 
dev.off()
  
# Third Correlogram Example
png("#115_Correlogram-3.png" , width = 480, height = 480)
corrgram(mtcars, order=NULL, lower.panel=panel.shade, upper.panel=NULL, text.panel=panel.txt, main="Car Milage Data (unsorted)")
dev.off()



