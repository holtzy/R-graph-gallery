
# -----------------------------------------------------------------------------------------------------------------------------------------------------
ANIMATED GRAPH IMAGE MAGICK

# example 1: simple animated countdown from 10 to "GO!".
png(file="example%02d.png", width=480, height=480)
par(bg="grey")
  for (i in c(10:1, "G0!")){
    plot.new()
    text(.5, .5, i, cex = 6 )
  }
dev.off()

# convert the .png files to one .gif file using ImageMagick. 
# The system() function executes the command as if it was done
# in the terminal. the -delay flag sets the time between showing
# the frames, i.e. the speed of the animation.
system("convert -delay 80 *.png animated_count_down.gif")

# to not leave the directory with the single jpeg files
# I remove them.
file.remove(list.files(pattern=".png"))

# -----------------------------------------------------------------------------------------------------------------------------------------------------


