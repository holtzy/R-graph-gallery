
# library
library(ggplot2)

#Let's build a dataset : height of 10 sorgho and poacee sample in 3 environmental conditions (A, B, C)
specie=c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition=rep(c("normal" , "stress" , "Nitrogen") , 4)
value=abs(rnorm(12 , 0 , 15))
data=data.frame(specie,condition,value)

png("#48_basic_barplot_ggplot2.png" , width = 480, height = 480 )
#Let's plot it with ggplot2
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
	geom_bar(position="dodge", stat="identity")
dev.off()

png("#48_stacked_barplot_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
	geom_bar( stat="identity")
dev.off()

png("#48_stacked_percent_barplot_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
	geom_bar( stat="identity", position="fill")
dev.off()

# To change colors, see the basic barplot section
png("#48_colors_stacked_barplot_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
	geom_bar( stat="identity", position="fill") +	
	scale_fill_brewer(palette = "Set1")
dev.off()

# Do not forget that faceting is a good alternative
png("#48_faceting_instead_of_barplot_ggplot2.png" , width = 480, height = 480 )
ggplot(data, aes(y=value, x=specie, color=specie, fill=specie)) + 
	geom_bar( stat="identity") +	
	facet_wrap(~condition)
dev.off()


