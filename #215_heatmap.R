
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 215 The heatmap function

# Data: mtcars:
head(mtcars)

# Run the function with default arguments:
data=as.matrix(mtcars)
png("#215_heatmap_most_basic.png" , width = 480, height = 480 )
heatmap(data)
dev.off()
# OK we have data row names in heatmap rownames

# But it is not really interesting --> We need to normalize. Expliquer que y a trop de variation d'une variable à l'autre.
png("#215_heatmap_use_normalization.png" , width = 480, height = 480 )
heatmap(data, scale="column")
dev.off()

# We need to notice that order of both rows and columns changed. This is because heatmap do a reordering using clusterisation.
# We can avoid it and just visualize the raw matrix
# We can remove the dendrogram, or keep only one. Note that thus, there is no reordering of data!
png("#215_heatmap_without_reordering.png" , width = 480, height = 480 )
heatmap(data, Colv = NA, Rowv = NA, scale="column")
dev.off()

# Custom colors
# native palette from R
png("#215_heatmap_custom_color_1.png" , width = 480, height = 480 )
heatmap(data, scale="column", col = cm.colors(256))
dev.off()
png("#215_heatmap_custom_color_2.png" , width = 480, height = 480 )
heatmap(data, scale="column", col = terrain.colors(256))
dev.off()
# Rcolorbrewer palette
library(RColorBrewer)
coul = colorRampPalette(brewer.pal(8, "PiYG"))(25)
png("#215_heatmap_custom_color_3.png" , width = 480, height = 480 )
heatmap(data, scale="column", col = coul)
dev.off()

# Add classic arguments like main title and axis title
png("#215_heatmap_custom_layout.png" , width = 480, height = 480 )
heatmap(data, Colv = NA, Rowv = NA, scale="column", col = coul, xlab="variable", ylab="car", main="heatmap")
dev.off()

# Add color on side --> usefull to show known groups! (apriori)
# Example, grouping from the first letter:
my_group=as.numeric(as.factor(substr(rownames(data), 1 , 1)))
my_col=brewer.pal(9, "Set1")[my_group]
png("#215_heatmap_add_side_color.png" , width = 480, height = 480 )
heatmap(data, Colv = NA, Rowv = NA, scale="column" , RowSideColors=my_col   )
dev.off()


# Custom x and y labels with cexRow and labRow (col respectively)
png("#215_heatmap_custom_labels.png" , width = 480, height = 480 )
heatmap(data, scale="column", cexRow=1.5, labRow=paste("new_", rownames(data),sep=""), col= colorRampPalette(brewer.pal(8, "Blues"))(25))
dev.off()
# -----------------------------------------------------------------------------------------------------------------------------------------------------


