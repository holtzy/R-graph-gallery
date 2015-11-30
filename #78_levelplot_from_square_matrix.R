
png("#78_levelplot_from_square_matrix.png" , width = 480, height = 480 )

par(mar=c(5,5,1,1))

# Lattice package
require (lattice)

#The lattice package provides a dataset named volcano. It's a square matrix looking like that :
head(volcano)

# The use of levelplot is really easy then :
levelplot(volcano)

dev.off()


