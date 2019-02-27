# -----------------------------------------------------------------------------------------------------------------------------------------------------

# HIVE PLOT
library(HiveR)
library(dplyr)
library(stringr)
library(RColorBrewer)
library(grid)

# for readability, rows are added via rbind
# generates an edgelist
# In this example we assume, that we have regulator, which are causing proteins to be produced
# These proteins in turn use up substrates, which are in turn manipulating the regulators
# In this case we have one master regulator (Regulator 4), which affects all proteins.
# Protein 1 uses all substrates
# There are hoever only two substrates, which alter our regulators


sample_data <- data.frame(source = "Regulator 1", target = "Protein 1", weight = 1, stringsAsFactors = F)
sample_data <- rbind(sample_data, c("Regulator 1", "Protein 2", 1))
sample_data <- rbind(sample_data, c("Regulator 1", "Protein 3", 1))
sample_data <- rbind(sample_data, c("Regulator 1", "Protein 4", 1))

sample_data <- rbind(sample_data, c("Regulator 2", "Protein 2", 1))
sample_data <- rbind(sample_data, c("Regulator 2", "Protein 3", 1))

sample_data <- rbind(sample_data, c("Regulator 3", "Protein 4", 1))
sample_data <- rbind(sample_data, c("Regulator 3", "Protein 1", 1))

sample_data <- rbind(sample_data, c("Protein 1", "Substrate 1", 1))
sample_data <- rbind(sample_data, c("Protein 1", "Substrate 2", 1))
sample_data <- rbind(sample_data, c("Protein 1", "Substrate 3", 1))

sample_data <- rbind(sample_data, c("Protein 2", "Substrate 2", 1))
sample_data <- rbind(sample_data, c("Protein 3", "Substrate 3", 1))
sample_data <- rbind(sample_data, c("Protein 4", "Substrate 1", 1))

sample_data <- rbind(sample_data, c("Substrate 2", "Regulator 1", 1))
sample_data <- rbind(sample_data, c("Substrate 2", "Regulator 2", 1))
sample_data <- rbind(sample_data, c("Substrate 3", "Regulator 3", 1))

sample_data$weight = as.numeric(sample_data$weight)

hpd <- edge2HPD(sample_data, axis.cols = c("red", "green", "blue")) # turn edgelist into a workable object

# We need to split the edges onto their own axis. The axis has to be an integer (and NOT a numeric)

hpd$nodes[grep("Protein", hpd$nodes$lab), "axis"] = as.integer(2) # Assign all "Proteins" to axis 2
hpd$nodes[grep("Substrate", hpd$nodes$lab), "axis"] = as.integer(3) # Substrates will be on axis 3

# Now we define the position on the axis (= radius)
hpd$nodes$radius = as.numeric(str_sub(hpd$nodes$lab,-1,-1))
# The radius (position on the axis) is determined by the "number" of the Substrate/Protein/Regulator
# e.g. Protein 1 has a radius of 1, Substrate 3 a radius of 3

color_lookup = c("Protein" = "Greens", "Regulator" = "Reds", "Substrate" = "Blues") # assign each type a unique color palette (will be used with ColorBrewer below)
color_counts = c("Protein" = 4, "Regulator" = 3, "Substrate" = 3) # these numbers are used in ColorBrewer to determine the number of colors in each category

# Helper function to color the edges according to the origin
determine_line_color <- function(id1)
{
  source = hpd$nodes[id1, "lab"]
  
  type = str_sub(source, 1, -3) # extract the "Protein", "Regulator" or "Substrate" part
  number = as.numeric(str_sub(source, -1, -1)) # extraxt the "id"
  
  color = brewer.pal(color_counts[type], color_lookup[type])[number]
  
  return(color)
}

hpd$edges$color <- sapply(hpd$edges$id1, determine_line_color) # assign colors to the lines based on the source


# Create the hive plot
png("#197_HivePlot.png" , width = 480, height = 480 )
plotHive(hpd,axLabs = c("Regulator", "Protein", "Substrate"), bkgnd = "black", axLab.gpar = gpar(col = "#bbbbbb"))
dev.off()

