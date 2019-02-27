
# Let's create a vector of data:
my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")

# The most basic barplot you can do:
# see # for explanation
barplot(my_vector)

# Change color with col: uniform
# text utile: Single value or vector giving the border color of the bars. If vector length is less # of bars, the color values will be repeated. Specifying a single value will border all bars with that color.
png("#209_uniform_color_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6) )
dev.off()

# Change color with col: specific to category
png("#209_specific_color_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=c(1,2,3,4,5) )
dev.off()

# We can also change the color of the border of the bar:
png("#209_border_color_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.1,0.1,0.1,0.1), border="blue" )
dev.off()

# Change the classic attribute of plots:
png("#209_layout_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.5,0.1,0.6,0.6), xlab="categories", ylab="values", main="My title" , ylim=c(0,60) )
dev.off()

# You can put some texture for each bar
# see corresponding graph for density and angle attributes.

# You can make an horizontal barplot:
# use las to make it readable
png("#209_horizontal_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), horiz=T , las=1)
dev.off()

# Add space between bars:
png("#209_custom_size_between_bars.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), space=c(0.1,0.2,3,1.5,0.3) )
dev.off()

# You can change the width of the bars. Usefull if you want to represent the number of values for example! see #
png("#209_custom_width_of_bars.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), width=c(0.1,0.2,3,1.5,0.3) )
dev.off()


