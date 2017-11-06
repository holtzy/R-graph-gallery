png("#138_Green_world.png" , units="in", width=11, height=7, res=500 )

set.seed(92)
library(ggplot2)
library(RColorBrewer)
ngroup=20
names=paste("G_",seq(1,ngroup),sep="")
DAT=data.frame()

for(i in seq(1:50)){
	data=data.frame( matrix(0, ngroup , 3))
	data[,1]=i
	data[,2]=sample(names, nrow(data))
	data[,3]=prop.table(sample( c(rep(0,100),c(1:ngroup)) ,nrow(data)))
	DAT=rbind(DAT,data)
	}
colnames(DAT)=c("Year","Group","Value")
DAT=DAT[order( DAT$Year, DAT$Group) , ]

ggplot(DAT, aes(x=Year, y=Value, fill=Group )) + 
	geom_area(alpha=1 , color="transparent" )+
	theme_bw() +
    scale_fill_brewer(palette="greens", breaks=rev(levels(DAT$Group)))+
 	theme(line = element_blank(),
        text = element_blank(),
        line = element_blank(),
        title = element_blank(),
        legend.position="none",
        panel.border = element_blank(),
        panel.background = element_blank())

dev.off()	
	
