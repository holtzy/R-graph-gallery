
# ---------------------------------------------------------------------------------------------------------------------------------------------------------
#289 Custom ggplot2 title


# library & data
library(ggplot2)
data=data.frame(x=rnorm(100))

# Basic plot with title
png("#289_custom_ggplot2_title1.png" , width = 480, height = 480 )
ggplot( data=data, aes(x=x)) + 
	geom_histogram(fill="skyblue", alpha=0.8) +
	ggtitle("A blue Histogram") +
	theme_minimal()
dev.off()

# title on several lines
png("#289_custom_ggplot2_title2.png" , width = 480, height = 480 )
ggplot( data=data, aes(x=x)) + 
	geom_histogram(fill="skyblue", alpha=0.8) +
	ggtitle("A blue \nHistogram") +
	theme_minimal() 
dev.off()
	
# Custom title appearance
png("#289_custom_ggplot2_title3.png" , width = 480, height = 480 )
ggplot( data=data, aes(x=x)) + 
	geom_histogram(fill="skyblue", alpha=0.8) +
	ggtitle("A blue Histogram") +
	theme_minimal() +
	theme(
		plot.title=element_text(family='', face='bold', colour='skyblue', size=20)
		)
dev.off()
		
# Adjust the position of title
png("#289_custom_ggplot2_title4.png" , width = 480, height = 480 )
ggplot( data=data, aes(x=x)) + 
	geom_histogram(fill="skyblue", alpha=0.8) +
	ggtitle("A blue Histogram") +
	theme_minimal() +
	theme(
		plot.title=element_text( hjust=1, vjust=0.5)
		)
dev.off()

# Custom a few word of the title only:
png("#289_custom_ggplot2_title5.png" , width = 480, height = 480 )
my_title <- expression(paste("A ", italic(bold("blue")), " histogram"))
ggplot( data=data, aes(x=x)) + 
	geom_histogram(fill="skyblue", alpha=0.8) +
	ggtitle(my_title) +
	theme_minimal()
dev.off()


# lineheight control size between lines.


