

png("#70_Boxplot_with_Categories_on_multiple_line.png" , width = 480, height = 480 )

par(mar=c(5,5,1,1))

# Create 2 vectors
a=sample(2:24, 20 , replace=T)
b=sample(4:14, 8 , replace=T)

# Make a list of these 2 vectors
C=list(a,b)

# Change the names of the elements of the list :
names(C)=c(paste("Category 1\n n=" , length(a) , sep=""), paste("Category 2\n n=" , length(b) , sep=""))

#I change the mgp argument to avoid the text overlays the x axis
par(mgp=c(3,2,0))

# Final Boxplot !
boxplot(C , col=rgb(0.3,0.2,0.5,0.6) , ylab="value" )

dev.off()

