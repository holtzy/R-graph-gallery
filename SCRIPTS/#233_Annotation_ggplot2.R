
# -----------------------------------------------------------------------------------------------------------------------------------------------------
#233 Annotate pour ajouter des annotations

# library
library(ggplot2)
head(mtcars)

# basic graph
p=ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()

# Add text on a specific positions:
png("#233_Add_text_on_ggplot2_chart.png" , width = 480, height = 480 )
p + annotate("text", x = c(2,4.5), y = c(20,25), label = c("label 1", "label 2") , color="orange", size=5 , angle=45, fontface="bold")
dev.off()
# Warning, to add the text of a column, use geom_text !
# geom_text is used to add text from the data frame, and annotate is used to add a single text element.

# Add rectangles
png("#233_Add_rectangles_on_ggplot2_chart.png" , width = 480, height = 480 )
p + annotate("rect", xmin=c(2,4), xmax=c(3,5), ymin=c(20,10) , ymax=c(30,20), alpha=0.2, color="blue", fill="blue")
dev.off()

# Add segments
png("#233_Add_segments_on_ggplot2_chart.png" , width = 480, height = 480 )
p + annotate("segment", x = 1, xend = 3, y = 25, yend = 15, colour = "purple", size=3, alpha=0.6)
dev.off()

# Add arrow
png("#233_Add_arrow_on_ggplot2_chart.png" , width = 480, height = 480 )
p + annotate("segment", x = 2, xend = 4, y = 15, yend = 25, colour = "pink", size=3, alpha=0.6, arrow=arrow())
dev.off()


# Add abline
png("#233_Add_abline_on_ggplot2_chart.png" , width = 480, height = 480 )
p + geom_hline(yintercept=25, color="orange", size=1) + geom_vline(xintercept=3, color="orange", size=1)
dev.off()

# Add point and range
png("#233_Add_pointrange_on_ggplot2_chart.png" , width = 480, height = 480 )
p + annotate("pointrange", x = 3.5, y = 20, ymin = 12, ymax = 28,colour = "orange", size = 1.5, alpha=0.4)
dev.off()


# -----------------------------------------------------------------------------------------------------------------------------------------------------


