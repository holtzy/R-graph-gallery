

# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 220 BASIC GGPLOT2 HISTOGRAMM 

# library
library(ggplot2)

# dataset:
data=data.frame(value=rnorm(10000))

# Basic histogram
png("#220_basic_histogram_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(x=value)) + geom_histogram()
dev.off()

# Custom Binning. I can just give the size of the bin
png("#220_custom_binning_histogram_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(x=value)) + geom_histogram(binwidth = 0.05)
dev.off()

# And then, custom colors. Color and fill to custom borders and fill colors
png("#220_custom_color_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(x=value)) + 
	geom_histogram(binwidth = 0.2, color="white", fill=rgb(0.2,0.7,0.1,0.4) ) + 
	xlim(-4, 4)

# Or a colors proportionnal to the count
png("#220_custom_color2_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(x=value)) + 
	geom_histogram(binwidth = 0.2, aes(fill = ..count..) )

# And then, do not forget to adjust xlim if needed + add title
png("#220_basic_adjust_xlim_histogram_ggplot2.png" , width = 480, height = 480 )
ggplot(mtcars, aes(x=wt)) + 
	geom_histogram(binwidth = 0.2 , fill=rgb(0.4,0.1,0.3,0.4) , color="black" ) + 
	ggtitle("distribution of wt") +
	labs(x = "wt", y = "Value") +
	xlim(1, 5)


