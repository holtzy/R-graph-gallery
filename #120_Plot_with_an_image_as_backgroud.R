


# -----------------------------------------------------------------------------------------------------------------------------------------------------
#120 Mettre une image en arriere plan d'un graph


# I download a jpeg file from the web. If you have the image, just place it in the current directory
download.file("https://holtzyan.files.wordpress.com/2015/10/cropped-p1090518.jpg" , destfile="my_image.jpg")

png("#120_Plot_with_an_image_as_backgroud.png" , width = 480, height = 480)
par(mar=c(3,3,1,1))


# Charge this image as an R object with the JPEG package
library(jpeg)
my_image=readJPEG("my_image.jpg")

# Set up the plot area
plot(1:2, type='n', main="", xlab="x", ylab="y")

# Get the plot information so the image will fill the plot box, and draw it
lim <- par()
rasterImage(my_image, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
grid()
lines(c(1, 1.2, 1.4, 1.6, 1.8, 2.0), c(1, 1.3, 1.7, 1.6, 1.7, 1.0), type="b", lwd=5, col="white")


dev.off()

