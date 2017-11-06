# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 211 : Basic GROUPED BARPLOT
#Ca se transforme vite en stacked barplot
# Faire un dessin du input d'entrée, en expliquant qu'est ce qui sera ou.

#Create data
set.seed(112)
data=matrix(sample(1:30,15) , nrow=3)
colnames(data)=c("A","B","C","D","E")
rownames(data)=c("var1","var2","var3")

# Get the stacked barplot
png("#211_basic_stacked_barplot.png" , width = 480, height = 480 )
barplot(data, col=colors()[c(23,89,12)] , border="white", space=0.04, font.axis=2, xlab="group")
dev.off()

# It is easy to add a legend:
# Add a link toward the LEGEND sheet
png("#211_basic_grouped_barplot.png" , width = 480, height = 480 )
barplot(data, col=colors()[c(23,89,12)] , border="white", font.axis=2, beside=T, legend=rownames(data), xlab="group", font.lab=2)
dev.off()

