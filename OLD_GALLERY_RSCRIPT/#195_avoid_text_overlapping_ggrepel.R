# -----------------------------------------------------------------------------------------------------------------------------------------------------
# Envoyé sur le site
# Proposed by Carlos Ortega - cof@qualityexcellence.es
# Vignette de ggrepel --> citer


png("#195_avoid_text_overlapping_ggrepel.png" , width = 480, height = 480 )

library(ggrepel) 
set.seed(42) 
ggplot(mtcars) + 
	geom_point(aes(wt, mpg), size = 5, color = 'grey') + 
	geom_label_repel( aes(wt, mpg, fill = factor(cyl), 
		label = rownames(mtcars)), 
		fontface = 'bold', 
		color = 'white', 
		box.padding = unit(0.35, "lines"), 
		point.padding = unit(0.5, "lines") ) + 
	theme_classic(base_size = 16)

dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------


