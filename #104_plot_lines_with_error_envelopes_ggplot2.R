# Thanks to Alastair Sanderson http://www.alastairsanderson.com/
# Plot trouvé a l'adresse http://www.sr.bham.ac.uk/~ajrs/R/r-gallery.html
# Using ggplot2 to show mean temperature profiles and their error envelopes for cool-core and non-cool core clusters, from Sanderson et al. (2006). This plot was made with the outstanding ggplot2 package, which produces high-quality results in just a few short lines of R code. Note the use of semi-transparency to allow overlapping features to be viewed





png("#104_plot_lines_with_error_envelopes_ggplot2.png" , width = 480, height = 480 )

library(ggplot2)

# make data
CC <- read.table("http://www.sr.bham.ac.uk/~ajrs/papers/sanderson06/mean_Tprofile-CC.txt" ,  header=TRUE)
nCC <- read.table("http://www.sr.bham.ac.uk/~ajrs/papers/sanderson06/mean_Tprofile-nCC.txt" , header=TRUE)
CC$type <- "Cool core"
nCC$type <- "Non-cool core"
A <- rbind(CC, nCC)


# Make the plot
ggplot(data=A, aes(x=r.r500, y=sckT, ymin=sckT.lo, ymax=sckT.up, fill=type, linetype=type)) + 
 geom_line() + 
 geom_ribbon(alpha=0.5) + 
 scale_x_log10() + 
 scale_y_log10() + 
 xlab(as.expression(expression( paste("Radius (", R[500], ")") ))) + 
 ylab("Scaled Temperature")
 
 
dev.off()

