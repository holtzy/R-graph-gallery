#upload library
library(VennDiagram)

#Then generate 3 sets of words.There I generate 3 times 200 SNPs names.
SNP_pop_1=paste(rep("SNP_" , 200) , sample(c(1:1000) , 200 , replace=F) , sep="")
SNP_pop_2=paste(rep("SNP_" , 200) , sample(c(1:1000) , 200 , replace=F) , sep="")
SNP_pop_3=paste(rep("SNP_" , 200) , sample(c(1:1000) , 200 , replace=F) , sep="")

#The goal of the Venn Diagram is to count how many words are common between SNP_pop_1 and SNP_pop_2, between SNP_pop_1 and SNP_pop_3 and so on...
#The venn.diagram function do it automatically and draw it! (you will get a png file in your current working directory)

venn.diagram(
x = list(SNP_pop_1 , SNP_pop_2 , SNP_pop_3),
category.names = c("SNP pop 1" , "SNP pop 2 " , "SNP pop 3"),
filename = '#14_venn_diagramm.png',
	output = TRUE ,
  	imagetype="png" ,
	height = 480 , 
	width = 480 , 
	resolution = 300,
	compression = "lzw",
	lwd = 2,
	lty = 'blank',
	fill = c('yellow', 'purple', 'green'),
	cex = 1,
	fontface = "bold",
	fontfamily = "sans",
	cat.cex = 0.6,
	cat.fontface = "bold",
	cat.default.pos = "outer",
	cat.pos = c(-27, 27, 135),
	cat.dist = c(0.055, 0.055, 0.085),
	cat.fontfamily = "sans",
	rotation = 1
	)



