
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 212 : Stacked percent barplot
#Ca se transforme vite en stacked barplot
# Faire un dessin du input d'entrée, en expliquant qu'est ce qui sera ou.

#Create data
set.seed(1124)
data=matrix(sample(1:30,15) , nrow=3)
colnames(data)=c("A","B","C","D","E")
rownames(data)=c("var1","var2","var3")

#create color palette:
library(RColorBrewer)
coul = brewer.pal(3, "Pastel2") 

#Transform this data in %
data_percentage=apply(data, 2, function(x){x*100/sum(x,na.rm=T)})

# Make a stacked barplot--> it will be in %!
png("#212_stacked_percent_barplot.png" , width = 480, height = 480 )
barplot(data_percentage, col=coul , border="white", xlab="group")
dev.off()




