

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 277: MARGINAL HISTOGRAM TO GGPLOT2
#################


# Created by dataali: http://deanattali.com/2015/03/29/ggExtra-r-package/

# library
library(ggplot2)
library(ggExtra)

# The mtcars dataset is proposed in R
head(mtcars)

png("#277_Marginal_Histogram_ggplot2_1.png" , width = 480, height = 480 )
p=ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, size=cyl)) +
 	 geom_point() +
 	 theme(legend.position="none")
ggMarginal(p, type="histogram")
dev.off()

png("#277_Marginal_Histogram_ggplot2_2.png" , width = 480, height = 480 )
ggMarginal(p, type="density")
dev.off()

png("#277_Marginal_Histogram_ggplot2_3.png" , width = 480, height = 480 )
ggMarginal(p, type="boxplot")
dev.off()


# Set relative size of marginal plots
png("#277_Marginal_Histogram_ggplot2_4.png" , width = 480, height = 480 )
ggMarginal(p, type="histogram", size=10)
dev.off()

# Custom marginal plots:
png("#277_Marginal_Histogram_ggplot2_5.png" , width = 480, height = 480 )
ggMarginal(p, type="histogram", fill = "slateblue", xparams = list(  bins=10))
dev.off()

# Custom marginal plots:
png("#277_Marginal_Histogram_ggplot2_5.png" , width = 480, height = 480 )
ggMarginal(p, margins = 'x', color="purple", size=4)
dev.off()


# ---------------------------------------------------------------------------------------------------------------------------------------------------------






