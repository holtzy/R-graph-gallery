chromo=c(rep("A",10) , rep("B",10) , rep("C",10) )
position=rep(seq(1:10) , 3)
LOD1=sample(seq(1:10) , 30 , replace=T)
LOD2=sample(seq(1:10) , 30 , replace=T)

data=data.frame(chromo=chromo, position=position, LOD1=LOD1 , LOD2=LOD2)

library(plotly)

#Easiest thing : represent just LOD1, don't take in account the chromosome
plot_ly(data , x=position , y=LOD1 , type="scatter" , mode="markers")

# Represent LOD 1, with one line per chromosome on the SAME plot :
plot_ly(data , x=position , y=LOD1 , type="scatter" , mode="line" , group=chromo)

# Represent LOD 1, with one line per chromosome on the SAME plot, but with ONE color only :
plot_ly(data , x=position , y=LOD1 , type="scatter" , mode="line" , group=chromo , line=list(color="blue") )

# Represent LOD 1, with one GRAPH per chromosome. I have to specify the xaxis term !!! :
data$id = as.integer(data$chromo)
p=plot_ly(data , x=position , y=LOD1 , type="scatter" , mode="line" , group=chromo , xaxis = paste0("x", id) )
subplot(p)

# Represent LOD 1, with one GRAPH per chromosome. But one below the other (not beside) :
data$id = as.integer(data$chromo)
p=plot_ly(data , x=position , y=LOD1 , type="scatter" , mode="line" , group=chromo , xaxis = paste0("x", id) , line=list(color="blue"))
subplot(p , nrows=3)%>% 
layout(
	yaxis = list( domain = c(0, 0.25)) , yaxis2 = list(domain = c(0.35, 0.6)) , yaxis3 = list(domain = c(0.7, 0.95))  
	)

# Represent LOD 1 & LOD2 on 3 distincts graph for every chromosomes
data$id = as.integer(data$chromo)
p=plot_ly(data , x=position , y=LOD1 , type="scatter" , mode="line" , group=chromo , line=list(color="blue") , xaxis = paste0("x", id))
p=add_trace(p , y=LOD2 , type="scatter" , mode="line" , group=chromo , line=list(color="red") , xaxis = paste0("x", id))
subplot(p , nrows=3)%>% 
layout(
	yaxis = list( domain = c(0, 0.25)) , yaxis2 = list(domain = c(0.35, 0.6)) , yaxis3 = list(domain = c(0.7, 0.95))  
	)


