
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 264: CONTROL COLOR
#################


# library
library(ggplot2)

# The mtcars dataset is proposed in R
head(mpg)

# Set a unique color with fill, colour, and alpha
png("#264_control_color_boxplot_ggplot2_1.png" , width = 480, height = 480 )
ggplot(mpg, aes(x=class, y=hwy)) + 
	geom_boxplot(color="red", fill="orange", alpha=0.2)
dev.off()

# Set a different color for each group
png("#264_control_color_boxplot_ggplot2_2.png" , width = 480, height = 480 )
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
	geom_boxplot(alpha=0.3) +
	theme(legend.position="none") 
dev.off()
	
# You can use a different color palette comming from R color brewer (discrete or continuous
png("#264_control_color_boxplot_ggplot2_3.png" , width = 480, height = 480 )
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
	geom_boxplot(alpha=0.3) +
	theme(legend.position="none") +
    scale_fill_brewer(palette="BuPu")
dev.off()
png("#264_control_color_boxplot_ggplot2_4.png" , width = 480, height = 480 )
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
	geom_boxplot(alpha=0.3) +
	theme(legend.position="none") +
    scale_fill_brewer(palette="Dark2")
dev.off()

# Wanna highlight one or several groups?
mpg$type=factor(ifelse(mpg$class=="subcompact","Highlighted","Normal"))
png("#264_control_color_boxplot_ggplot2_5.png" , width = 480, height = 480 )
ggplot(mpg, aes(x=factor(class), y=hwy, fill=type, alpha=type)) + 
	geom_boxplot()
dev.off()

# control appearance of groups 1 and 2:
png("#264_control_color_boxplot_ggplot2_6.png" , width = 480, height = 480 )
ggplot(mpg, aes(x=factor(class), y=hwy, fill=type, alpha=type)) + 
	geom_boxplot() +
	scale_alpha_manual(values=c(0.6,0.1)) +
	scale_fill_manual(values=c("forestgreen","red"))
dev.off()


# ---------------------------------------------------------------------------------------------------------------------------------------------------------

