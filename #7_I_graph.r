#[Network analysis](https://en.wikipedia.org/wiki/Network_theory) is a every day task in data analysis. Indeed we often need to know who is linked with who (geographical distance ? Same kind of features ?...)
#[I graph](http://igraph.org/redirect.html) is the perfect package to represent link between objects. 


#Let's charge the Igraph package
library("igraph")


#Simulating Data : Mark of 9 students. 3 are known to be strong in Letters, 3 in Art and 3 in Math.
a=c(6,8,11,14,15,14,19,18,20)
b=c(20,20,19,18,18,18,2,4,8)
c=c(3,4,3,15,18,19,2,1,8)
data = matrix(c( a,a+1,a-sample(seq(1,3),9,replace=T) ,a-sample(seq(1,3),9,replace=T),
                 b,b-sample(seq(1,3),9,replace=T),b+sample(seq(1,3),9,replace=T),c,
                 c-sample(seq(1,3),9,replace=T),(b+c)/2) , 9 , 9)
colnames(data)=c("charline", "JP", "Kath", "Gary", "Conor", "Marion", "JB", "gui", "Vincent")
rownames(data)=c("french","phylo","latin","musique","art","sport","math","stat","R")

#Let's have a look to the rough data
library(xtable)
print(xtable(data , caption="rough data", digits=0 ), type = "latex", include.rownames = T , 
      comment=FALSE )


#I calculte correlation between student's Marks. I Want to see who has the same kind of Mark structure
dist=cor(data)
dist[dist<0.5]=0
diag(dist)=0



#Let's make the I-Graph. All the students with a correlation > 0.5 will be linked one to each other on the graph. Students with strong correlation will be closer. People with strong skills in letters, art and math will be Highlighted.
# First I ask to Igraph to calculate the best position of each individuals, doing iterations
g1<-graph.adjacency(dist,weighted="TRUE",mode="undirected")
lay<-layout.fruchterman.reingold(grap=g1,niter=6000)

png("#7_I_graph.png")
par(mar=c(0.5,0.5,0.5,0.5))

# Then I make the plot. I ask to show the know structure of the population
plot.igraph(g1, 
            mark.shape=1 , 
            mark.groups=list(c(1:3) , c(4:6) , c(7:9) ) , 
            layout=lay,vertex.label=rownames(dist) ,
            vertex.color="green" , 
            vertex.size=0.5 , 
            edge.arrow.size=13 , 
            main="")

#Finally I add a legend
legend("bottomleft", legend = c("Letter lovers" , "art lovers" , "math lovers"), 
       col = rainbow(3, alpha = 0.3) , 
       pch = 15, bty = "n",  pt.cex = 1.5, cex = 0.8 , 
       text.col = "black", horiz = FALSE, inset = c(0.1, 0.1))


#There we can see that the known structure  is relevant. Nevertheless, it looks like the student JB, who is supposed to be strong in Math, is really close to people that are strong in Art. Actually he is strong in both !


