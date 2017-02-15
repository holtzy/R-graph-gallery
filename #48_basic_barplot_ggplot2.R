png("#48_basic_barplot_ggplot2.png" , width = 480, height = 480 )
library(ggplot2)


#Let's build a dataset : height of 10 sorgho and poacee sample in 3 environmental conditions (A, B, C)
specie=c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition=rep(c("normal" , "stress" , "Nitrogen") , 4)
value=abs(rnorm(12 , 0 , 15))
data=data.frame(specie,condition,value)


#Let's plot it with ggplot2
p <- ggplot(data, aes(fill=condition, y=value, x=specie))
p + geom_bar(position="dodge", stat="identity")

dev.off()



