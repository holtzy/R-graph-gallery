

========= PIRATE PLOT ===========

# Source:
#http://www.r-bloggers.com/the-pirate-plot-2-0-the-rdi-plotting-choice-of-r-pirates/

# Intal yarr package from github
install.packages("devtools")
library("devtools")
install_github("ndphillips/yarrr")
library("yarrr")

# We have the pirate dataset comming with:
head(pirates)

# First basic pirate plot
png("#148_basic_pirate_plot.png" , width = 480, height = 480 )
pirateplot(formula = age ~ favorite.pirate, data = pirates, xlab = "Favorite Pirate", ylab = "Age", main = "")
dev.off()

# As boxplot, we can put several factors in the formula
png("#148_basic_pirate_plot2.png" , width = 480, height = 480 )
pirateplot(formula = beard.length ~ sex + college, data = pirates, main = "Beard lengths", xlab = "", ylab = "Beard Length")
dev.off()

# The pirate plot propose 3 themes, focussing on 
#Theme 1 emphasises the bar with light points and beans (I’ll use the appletv palette for this one)
#Theme 2 emphasises the points and beans (using the southpark palette)
#Theme 3 Emphases the 95% Highest Density Intervals (HDIs). Keep in mind that calculating HDIs can take a few seconds for each bean… Here I’ll use the Basel palette.
png("#149pirate_plot_with_theme1.png" , width = 480, height = 480 )
pirateplot(formula = age ~ favorite.pirate, data = pirates, xlab = "Favorite Pirate", ylab = "Age", main = "",
	theme.o = 1)
dev.off()
png("#149pirate_plot_with_theme2.png" , width = 480, height = 480 )
pirateplot(formula = age ~ favorite.pirate, data = pirates, xlab = "Favorite Pirate", ylab = "Age", main = "",
	theme.o = 2)
dev.off()
png("#149pirate_plot_with_theme3.png" , width = 480, height = 480 )
pirateplot(formula = age ~ favorite.pirate, data = pirates, xlab = "Favorite Pirate", ylab = "Age", main = "",
	theme.o = 3)	
dev.off()



# You can also custom everything.
# Several colors palette are proposed. type piratepal(palett e= "all", action = "show")
png("#150_custom_pirate_plot.png" , width = 480, height = 480 )
pirateplot(formula = age ~ favorite.pirate, data = pirates, xlab = "Favorite Pirate", ylab = "Age", main = "",
           
           # Choose your color palette, or give common color vector
           pal = "drugs",
           
           # Set transparency of the elements:
           line.o = 0.1,
           bar.o = .1,
           bean.o = .3,
           point.o = .9,
           
           # Shape of point
           point.pch = 2,
           
           #Background color
           back.col = "white" )

dev.off()        

