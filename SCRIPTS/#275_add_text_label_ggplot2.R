

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 275: SCATTERPLOT ADD TEXT LABELS GGPLOT2
#################

# library
library(ggplot2)

# The mtcars dataset is proposed in R
data=head(mtcars, 30)

# add text with geom_text, use nudge to nudge the text
png("#275_add_text_label_ggplot2_1.png" , width = 480, height = 480 )
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + 
  geom_text(label=rownames(data), nudge_x = 0.25, nudge_y = 0.25, check_overlap = T)
dev.off()

# to improve readability, use geom_label
png("#275_add_text_label_ggplot2_2.png" , width = 480, height = 480 )
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + 
  geom_label(label=rownames(data), nudge_x = 0.25, nudge_y = 0.2)
dev.off()


#A really basic boxplot.
png("#275_add_text_label_ggplot2_3.png" , width = 480, height = 480 )
ggplot(data, aes(x=wt, y=mpg, fill=cyl)) +
  geom_label(label=rownames(data), color="white", size=5)
dev.off()

# ---------------------------------------------------------------------------------------------------------------------------------------------------------


