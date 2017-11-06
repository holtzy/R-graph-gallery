
# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 265: GROUPED BOXPLOT
#################

# library
library(ggplot2)

# create a data frame
variety=rep(LETTERS[1:7], each=40)
treatment=rep(c("high","low"),each=20)
note=seq(1:280)+sample(1:150, 280, replace=T)
data=data.frame(variety, treatment ,  note)
 

# Set a unique color with fill, colour, and alpha
png("#265_grouped_boxplot_ggplot2_1.png" , width = 480, height = 480 )
ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
	geom_boxplot()
dev.off()

# note that an alternative can be to use faceting!
png("#265_grouped_boxplot_ggplot2_2.png" , width = 480, height = 480 )
ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
	geom_boxplot() +
	facet_wrap(~treatment)
dev.off()
png("#265_grouped_boxplot_ggplot2_3.png" , width = 480, height = 480 )
ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
	geom_boxplot() +
	facet_wrap(~variety, scale="free")
dev.off()


# ---------------------------------------------------------------------------------------------------------------------------------------------------------


