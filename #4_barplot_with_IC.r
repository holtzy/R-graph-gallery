

#Let's build a dataset : height of 10 sorgho and poacee sample in 3 environmental conditions (A, B, C)
A=c(rep("sorgho" , 10) , rep("poacee" , 10) )
B=rnorm(20,10,4)
C=rnorm(20,8,3)
D=rnorm(20,5,4)
data=data.frame(A,B,C,D)
colnames(data)=c("specie","cond_A","cond_B","cond_C")

#Let's calculate the average value for each condition and each specie with the *aggregate* function
bilan=aggregate(cbind(cond_A,cond_B,cond_C)~specie , data=data , mean)
rownames(bilan)=bilan[,1]
bilan=as.matrix(bilan[,-1])

#Then it is easy to make a classical barplot :
lim=1.2*max(bilan)
ze_barplot = barplot(bilan , beside=T , legend.text=T , col=c("blue" , "skyblue") , ylim=c(0,lim))

#I becomes a bit more tricky when we want to add the error bar representing the confidence interval.
#First I create a smell function that takes...in entry
error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

#Then I calculate the standard deviation for each specie and condition :
stdev=aggregate(cbind(cond_A,cond_B,cond_C)~specie , data=data , sd)
rownames(stdev)=stdev[,1]
stdev=as.matrix(stdev[,-1]) * 1.96 / 10

I am ready to add the error bar on the plot using my "error bar" function !
png("#4_barplot_with_IC.png" ,  width = 480, height = 480)
ze_barplot = barplot(bilan , beside=T , legend.text=T , 
                  col=c("blue" , "skyblue") , ylim=c(0,lim) , ylab="height")
error.bar(ze_barplot,bilan, stdev)
dev.off()



