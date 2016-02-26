# --- The R graph Gallery --- #

### Exemple 1 : with only one factor
#Let's create datas. We will consider 7 varieties of wheat / 20 samples per variety / a degree of resistance to a disease (mark from 0 to 20) for each sample:

variety=c(rep("soldur", 20) , rep("silur", 20) , rep("lloyd", 20), rep("pescadou", 20),
        rep("X4582", 20) , rep("Dudur", 20) , rep("Classic", 20))
note=c( sample(2:5, 20 , replace=T) , sample(6:10, 20 , replace=T),
        sample(1:7, 30 , replace=T), sample(3:10, 70 , replace=T) )
data=data.frame(variety, note)

#Using R it is really easy to make a basic boxplot
png("#9_ordered_boxplot_step1.png" ,  width = 480, height = 480)
boxplot(data$note ~ data$variety , col="grey")
dev.off()

#Nevertheless, it is quite difficult to understand the results. It would be more clear if genotypes were ordered from the most sensible to the most resistant !  
#I'm gonna create a vector named "new_order" containing the desired order, and ask to boxplot using this vector !
new_order <- with(data, reorder(variety , note, median , na.rm=T))
png("#9_ordered_boxplot_step2.png" ,  width = 480, height = 480)
boxplot(data$note ~ new_order , ylab="sickness" , col="darkgreen",
        boxwex=0.4 , main="")
dev.off()




### EXEMPLE 2 : Multifactorial
#This time we still have several varieties of wheat. But each genotype have 20 samples grown in high temperature, and 20 in low temperature. So we have 2 factors : variety and treatment.
variety=c(rep("soldur" , 40), rep("silur" , 40), rep("lloyd" , 40), 
          rep("pescadou" , 40) , rep("X4582" , 40) , 
          rep("Dudur" , 40) , rep("Classic" , 40))

treatment= rep(c(rep("high" , 20) , rep("low" , 20)) , 7)

note=c( rep(c(sample(0:4, 20 , replace=T) , sample(1:6, 20 , replace=T)),2), 
          rep(c(sample(5:7, 20 , replace=T), sample(5:9, 20 , replace=T)),2), 
          c(sample(0:4, 20 , replace=T) , sample(2:5, 20 , replace=T), 
          rep(c(sample(6:8, 20 , replace=T) , sample(7:10, 20 , replace=T)),2) ))

data=data.frame(variety, treatment ,  note)


#I reorder the variety from the most sensible to the most resistant. (mixing low and high treatments for the calculations)
new_order <- with(data, reorder(variety , note, mean , na.rm=T))

#Then I make the boxplot, asking to use the 2 factors : variety (in the good order) AND treatment :
png("#9_ordered_boxplot_step3.png" ,  width = 480, height = 480)
par(mar=c(3,4,3,1))

#Make the boxplot
myplot=boxplot(note ~ treatment*new_order , data=data  , boxwex=0.4 , ylab="sickness",
        main="sickness of several wheat lines" , col=c("slateblue1" , "tomato") ,  xaxt="n")

#To add the label of x axis
my_names=sapply(strsplit(myplot$names , '\\.') , function(x) x[[2]] )
my_names=my_names[seq(1 , length(my_names) , 2)]
axis(1, at = seq(1.5 , 14 , 2), labels = my_names , tick=FALSE , cex=0.3)
for(i in seq(0.5 , 20 , 2)){ abline(v=i,lty=1, col="grey")}

#Add a legend
legend("bottomright", legend = c("High treatment", "Low treatment"), col=c("slateblue1" , "tomato"),
       pch = 15, bty = "n", pt.cex = 3, cex = 1.2,  horiz = F, inset = c(0.1, 0.1))

dev.off()

