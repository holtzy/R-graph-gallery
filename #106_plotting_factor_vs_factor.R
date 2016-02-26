
png("#106_plotting_factor_vs_factor.png",  width = 480, height = 480 )


# Color and Path
colset <- c("#B3E2CD", "#FDCDAC", "#CBD5E8")
path <- "http://www.sr.bham.ac.uk/~ajrs/R/datasets"

#--Data file as taken from XMM website, but with "#" added to comment lines
file <- paste(path, "ao7_otac_by_radec.txt", sep="/")

#--Read in data (default behaviour is to treat non-numeric entries as factors, which is what's required here)
A <- read.fwf(file, widths=c(8, -3, 1, -3, 31, 18, 10, -2, 10, -3, 6, -4, 1, -4, 1, -9, 1))
colnames(A) <- c("obsid", "cat", "PI", "target", "ra", "dec", "t.exp", "N", "pri", "fix")

#--Specify layout for 2 plots (1 for science category legend)
layout(matrix(1:2, 2, 1, byrow=TRUE), heights=c(1, 0.4))

#--Since the X & Y data are factors, "plot" produces a "spineplot()"
par(las=1)	# Orient all axis labels horizontally
par(mar=c(5, 4, 4, 2.2) + 0.1)	# Widen right margin slightly, to fit horizontal labels
plot(pri ~ cat, data=A, col=colset, main="XMM AO7 accepted proposals",
     xlab="Science Category", ylab="Priority")

#--Plot nothing at all, to allow legend to be added:
par(mar=c(0, 1, 0, 1)) # Reduce plot margins
plot.new()
legend(x="topleft", cex=0.7, c("A: Stars, White Dwarfs and Solar System",
 "B: White Dwarf Binaries, Neutron Star Binaries, Cataclysmic Variables, ULXs and Black Holes",
 "C: Supernovae, Supernova Remnants, Diffuse (galactic) Emission and Isolated Neutron Stars",
 "D: Galaxies and Galactic Surveys","E: Active Galactic Nuclei, Quasars and BL-Lac Objects",
 "F: Groups of Galaxies, Clusters of Galaxies and Superclusters",
 "G: Cosmology, Extragalactic Deep Fields and Area Surveys"))

dev.off()

