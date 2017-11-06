
################
TUCKEY TEST ON HISTOGRAMME
###############

#Introduction
Tukey's test is a single-step multiple comparison procedure and statistical test. It is a post-hoc analysis, what means that it is used in conjunction with an ANOVA.
It allows to find means of a factor that are significantly different from each other, comparing all possible pairs of means with a t-test like method. 

Results are usually drawn in a boxplot. Levels that are not significantly different one each other are represented with the same letter.

synonymous: Tukey's range test / Tukey method / Tukey's honest significance test / Tukey's HSD (honest significant difference) test / Tukey–Kramer method


lien wiki :
https://en.wikipedia.org/wiki/Tukey's_range_test
Bonne ref pour comprendre les calculs :
http://vassarstats.net/textbook/ch14pt2.html


# library
library(multcompView)

# Create data
treatment=c(rep("A", 20) , rep("B", 20) , rep("C", 20), rep("D", 20) ,  rep("E", 20))
value=c( sample(2:5, 20 , replace=T) , sample(6:10, 20 , replace=T), sample(1:7, 20 , replace=T), sample(3:10, 20 , replace=T) , sample(10:20, 20 , replace=T) )
data=data.frame(treatment,value)

# What is the effect of the treatment on the value ?
model=lm( data$value ~ data$treatment )
ANOVA=aov(model)

# Tukey test to study each pair of treatment :
TUKEY <- TukeyHSD(x=ANOVA, 'data$treatment', conf.level=0.95)

# Tuckey test representation :
png("#84_1_Tukey_test.png" , width = 480, height = 480 )
par(mar=c(5,5,5,1))
plot(TUKEY , las=1 , col="brown" )
dev.off()

# I need to group the treatments that are not different each other together.
generate_label_df <- function(TUKEY, variable){

     # Extract labels and factor levels from Tukey post-hoc 
     Tukey.levels <- TUKEY[[variable]][,4]
     Tukey.labels <- data.frame(multcompLetters(Tukey.levels)['Letters'])
	 
	 #I need to put the labels in the same order as in the boxplot :
	 Tukey.labels$treatment=rownames(Tukey.labels)
	 Tukey.labels=Tukey.labels[order(Tukey.labels$treatment) , ]
	 return(Tukey.labels)
	 }

# Apply the function on my dataset
LABELS=generate_label_df(TUKEY , "data$treatment")


# A panel of colors to draw each group with the same color :
my_colors=c( rgb(143,199,74,maxColorValue = 255),rgb(242,104,34,maxColorValue = 255), rgb(111,145,202,maxColorValue = 255),rgb(254,188,18,maxColorValue = 255) , rgb(74,132,54,maxColorValue = 255),rgb(236,33,39,maxColorValue = 255),rgb(165,103,40,maxColorValue = 255))

# Draw the basic boxplot
png("#84_2_Tukey_test.png" , width = 480, height = 480 )
par(mar=c(4,5,1,1))
a=boxplot(data$value ~ data$treatment , ylim=c(min(data$value) , 1.1*max(data$value)) , col=my_colors[as.numeric(LABELS[,1])] , ylab="value" , main="")

# I want to write the letter over each box. Over is how high I want to write it.
over=0.1*max( a$stats[nrow(a$stats),] )

#Add the labels
text( c(1:nlevels(data$treatment)) , a$stats[nrow(a$stats),]+over , LABELS[,1]  , col=my_colors[as.numeric(LABELS[,1])] )
dev.off()


