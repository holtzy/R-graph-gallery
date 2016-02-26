
#---------------------------------------------------------------------#
## 1 --- CREATING DATA
data=matrix(0,300,3) ; num=0
for(i in c("A","B","C","D","E","F","G","H","I","J")){
	for(j in c(1:30)){
		num=num+1
		print(num)
		data[num,1]=paste("geno_",num,sep="")
		data[num,2]=paste(i,j,sep="-")
		a=sample(0:10,1)+as.numeric(j)
		data[num,3]=a/50*100
		}}
data=as.data.frame(data)
data[,3]=as.numeric(as.character(data[,3]))
#---------------------------------------------------------------------#




#---------------------------------------------------------------------#
# 2 --- BUILDING THE "represent field" FUNCTION
library(lattice)
represent_field=function(input, col_cadrillage, col_analyse , col_text){

	#column col_text is optionnal, check if it's filled or not
	if(missing(col_text)==T){col_text=NA}

	#reading the datas
	vect=sort(unique(substr(input[,col_cadrillage] , 1,1)))
	fun=function(x){which(vect==substr(x, 1,1))}
	input$X = length(vect)+1-as.numeric(lapply(input[,col_cadrillage] , fun))		
	fun2=function(x){strsplit(x,"-")[[1]][2] }
	input$Y = as.numeric(lapply(as.character(input[,col_cadrillage]) , fun2))	
	
	#choose features of the plot
	myPanel <- function(x, y, z, ...) {
    	panel.fill(col = "grey")
    	panel.levelplot(x,y,z,...)
    	if (!is.na(col_text)){panel.text(x, y, input[,col_text] , cex=0.5  ) }	
    	}
	
	#Make the plot !!!
	X11() ; levelplot(input[,col_analyse] ~ Y * X, input , main="representation of my variable among the field" , panel = myPanel , col.regions = heat.colors(100)[length(heat.colors(100)):1] , yaxt="n" , ylab=vect)
	}
#---------------------------------------------------------------------#




#---------------------------------------------------------------------#
# 3 --- CALL THE FUNCTION !
# You can add 4 arguments to the function :
#--- 1/ your dataset
#--- 2/ number of the geographical position column (must be on the "a-5" (for line1 column5 on field) format )
#--- 3/ column number of the variable you want to represent (must be numeric)
#--- 4/ [optional] column number containing a text you want to add to each position of the plot
represent_field(data , 2 , 3 )
