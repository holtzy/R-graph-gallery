# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 210 : Custom Barplot LAYOUT
# In this part we see how to custom X and Y axis of a barplot
# Let's start with a basic barplot:

# Let's create a vector of data:
my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")

# A basic barplot already seen in graph #209:
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), xlab="category" )

# Use LAS to change orientation of labels. Really helpfull for horizontal barchart
png("#210_change_labels_orientation_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), horiz=T , las=1)
dev.off()

# Change labels of categories with names.arg:
png("#210_change_labels_names_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), names.arg=c("group1","group2","group3","group4","group5") )
dev.off()

# Change appearance of labels. Remember for font:     1: Normal / 2: Bold / 3: Italic / 4:Bold Italic
png("#210_custom_labels_font_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), names.arg=c("group1","group2","group3","group4","group5"), font.axis=2, col.axis="orange" , cex.axis=1.5 )
dev.off()

# You can add and custom axis title: 
png("#210_custom_axis_names_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), xlab="category", font.lab=2, col.lab="orange", cex.lab=2  )
dev.off()

# Note you can do the same for the main title of the plot with main=, font.main, col.main and cex.main.
# And the same with subtitles : sub, font.sub....

# Orientation of labels. If you let it horizontally, often they are unreadable. If you put it vertically, it is better to increase margin first, if not it does not fit the screen
png("#210_increase_margin_to_fit_axis_labels_barplot.png" , width = 480, height = 480 )
par(mar=c(11,4,4,4))
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), names.arg=c("very long group name 1","very long group name 2","very long group name 3","very long group name 4","very long group name 5"), las=2 )
dev.off()

