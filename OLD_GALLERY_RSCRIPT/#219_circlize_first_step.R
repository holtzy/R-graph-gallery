

# -----------------------------------------------------------------------------------------------------------------------------------------------------
# CIRCLIZE PACKAGE
# -----------------------------------------------------------------------------------------------------------------------------------------------------

# Why circlize:
	- important amount of information to visualize with with long axes or large amount of categories, + 
	- to visualize relations between elements.
# In R, c'est le circlize package, qui est inspiré du programme CIRCOS.

# Le principe c'est qu'on va garder les "lowlevel" fonction de circos et ajouter circos devant, genre circos.point
# Circos va faire la meme chose qu'un graphe normal, mais en rond plutot que sur un seul axe. 
# Il y a juste la fonction circos.link qui est à part: fait le lien entre section.

# Pour remplir tous les secteurs du graph circulaire on peut faire une boucle secteur par secteur, ou alors on peut utliser les fonction circos.track... qui implémentent cette boucle.

# Va falloir faire un shéma explicatif



# -----------------------------------------------------------------------------------------------------------------------------------------------------
------ #219 FIRST STEP

# Upload library
library(circlize)

#Create data
data = data.frame(
	factor = sample(letters[1:8], 1000, replace = TRUE),
	x = rnorm(1000), 
	y = runif(1000)
	)


# Initialise the chart. This part explains to R how we want to slice the window: how many area we want to build, and what we will show on axis
png("#219_circlize_first_step_1.png" , width = 480, height = 480 )
circos.initialize( factors=data$factor, x=data$x )

# Build the regions. 
circos.trackPlotRegion(factors = data$factor, y = data$y, panel.fun = function(x, y) {
	circos.axis()
	})
dev.off()

# Add points
png("#219_circlize_first_step_2.png" , width = 480, height = 480 )
circos.initialize( factors=data$factor, x=data$x )

# Build the regions. 
circos.trackPlotRegion(factors = data$factor, y = data$y, panel.fun = function(x, y) {
	circos.axis()
	})

circos.trackPoints(data$factor, data$x, data$y, col = "blue", pch = 16, cex = 0.5) 
dev.off()
# -----------------------------------------------------------------------------------------------------------------------------------------------------


