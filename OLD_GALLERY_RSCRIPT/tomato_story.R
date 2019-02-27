# Initialisation du numéro de l'image
numero=1000

# Making the reference points of the background
xpot=c(2,8,6,4,2)
ypot=c(3,3,1,1,3)
xdecor=c(0,14,40)
ydecor=c(8,14,14)
xtige=c(5,5)
ytige=c(3,26)
xfeuille1=c(5,4,4,2,2,4,4)
yfeuille1=c(12,12,13,13,11,11,12)
yfeuille3=yfeuille1+14
xfeuille3=xfeuille1
xfeuille2=c(5,6,6,9,9,6,6)
yfeuille2=yfeuille1+7
xjambe=c(23,23,25,25,25,27,27)
yjambe=c(5,9,11,16,11,9,4)
xbras=c(20,31)
ybras=c(15,15)
xtete=c(22,22,29,29,22)
ytete=c(16,23,23,16,16)
xyeux=c(24,27)
yyeux=c(21,21)
xbouche=xyeux
ybouche=c(17,17)
xportetomate=c(5,10)
yportetomate=c(9,11)
xtomate=c(10)
ytomate=c(11)


# making the initial background
image_de_fond=function(){
plot(xpot,ypot,col="orangered",xlim=c(0,40),ylim=c(0,35),type="l",lwd=7,xaxt="n",yaxt="n",ylab="",xlab="              a Yan Holtz Production, copyright 2012")
points(xdecor,ydecor,col="black", type="l")
points(xfeuille1,yfeuille1,col="seagreen", type="l",lwd=4)
points(xfeuille2,yfeuille2,col="seagreen", type="l",lwd=4)
points(xfeuille3,yfeuille3,col="seagreen", type="l",lwd=4)
points(xtige,ytige,col="seagreen", type="l",lwd=4)
points(xjambe,yjambe,col="brown", type="l",lwd=2)
points(xbras,ybras,col="brown", type="l",lwd=2)
points(xtete,ytete,col="brown", type="l",lwd=2)
points(xyeux,yyeux,col="blue", type="p",lwd=7)
points(xbouche,ybouche,col="brown", type="l",lwd=2)
points(xportetomate,yportetomate,col="seagreen", type="l",lwd=4)
points(xtomate,ytomate,col="red", type="p",lwd=10)
}


#use the function
for(i in c(1:10)){
	numero=numero+1
	filename=paste("image_",numero,".png" , sep="")
	png(filename, bg="transparent", width=700, height=500)
	image_de_fond()
	dev.off()
}



# The guy think
phrase1= "hmmmm, let's see what I could do with this tomato plant...?"
for (i in 1:70){
	numero=numero+1
	filename=paste("image_",numero,".png" , sep="")
	png(filename, bg="transparent", width=700, height=500)
image_de_fond()
text(10,35,substr(phrase1,1,i/6))
	dev.off()
	}




# The guy walk until the plant
for(i in 1:80)
{
	numero=numero+1
	filename=paste("image_",numero,".png" , sep="")
	png(filename, bg="white", width=700, height=500)

plot(xpot,ypot,col="orangered",xlim=c(0,40),ylim=c(0,35),type="l",lwd=7,xaxt="n",yaxt="n",ylab="",xlab="              a Yan Holtz Production, copyright 2012")
points(xdecor,ydecor,col="black", type="l")
points(xfeuille1,yfeuille1,col="seagreen", type="l",lwd=4)
points(xfeuille2,yfeuille2,col="seagreen", type="l",lwd=4)
points(xfeuille3,yfeuille3,col="seagreen", type="l",lwd=4)
points(xtige,ytige,col="seagreen", type="l",lwd=4)
points(xjambe-0.11*i,yjambe-i%%5,col="brown", type="l",lwd=2)
points(xbras-0.11*i,ybras-i%%5,col="brown", type="l",lwd=2)
points(xtete-0.11*i,ytete-i%%5,col="brown", type="l",lwd=2)
points(xyeux-0.11*i,yyeux-i%%5,col="blue", type="p",lwd=7)
points(xbouche-0.11*i,ybouche-i%%5,col="brown", type="l",lwd=2)
points(xportetomate,yportetomate,col="seagreen", type="l",lwd=4)
points(xtomate,ytomate,col="red", type="p",lwd=10)
dev.off()
}

# The DNA arrives
xadn=c(10,10,10)
yadn=c(35,34,33)
for (i in 1:50)
{
	numero=numero+1
	filename=paste("image_",numero,".png" , sep="")
	png(filename, bg="white", width=700, height=500)

plot(xpot,ypot,col="orangered",xlim=c(0,40),ylim=c(0,35),type="l",lwd=7,xaxt="n",yaxt="n",ylab="",xlab="              a Yan Holtz Production, copyright 2012")
points(xdecor,ydecor,col="black", type="l")
points(xfeuille1,yfeuille1,col="seagreen", type="l",lwd=4)
points(xfeuille2,yfeuille2,col="seagreen", type="l",lwd=4)
points(xfeuille3,yfeuille3,col="seagreen", type="l",lwd=4)
points(xtige,ytige,col="seagreen", type="l",lwd=4)
points(xjambe-0.11*80,yjambe-80%%5,col="brown", type="l",lwd=2)
points(xbras-0.11*80,ybras-80%%5,col="brown", type="l",lwd=2)
points(xtete-0.11*80,ytete-80%%5,col="brown", type="l",lwd=2)
points(xyeux-0.11*80,yyeux-80%%5,col="blue", type="p",lwd=7)
points(xbouche-0.11*80,ybouche-80%%5,col="brown", type="l",lwd=2)
points(xportetomate,yportetomate,col="seagreen", type="l",lwd=4)
points(xtomate,ytomate,col="red", type="p",lwd=10)
points(xadn,yadn-0.46*i,col="pink",lwd=3,pch=4,cex=1.5)
	dev.off()
}

# The tomato gets bigger
for(i in 1 : 50)
{
	numero=numero+1
	filename=paste("image_",numero,".png" , sep="")
	png(filename, bg="white", width=700, height=500)

plot(xpot,ypot,col="orangered",xlim=c(0,40),ylim=c(0,35),type="l",lwd=7,xaxt="n",yaxt="n",ylab="",xlab="              a Yan Holtz Production, copyright 2012")
points(xdecor,ydecor,col="black", type="l")
points(xfeuille1,yfeuille1,col="seagreen", type="l",lwd=4)
points(xfeuille2,yfeuille2,col="seagreen", type="l",lwd=4)
points(xfeuille3,yfeuille3,col="seagreen", type="l",lwd=4)
points(xtige,ytige,col="seagreen", type="l",lwd=4)
points(xjambe-0.11*80,yjambe-80%%5,col="brown", type="l",lwd=2)
points(xbras-0.11*80,ybras-80%%5,col="brown", type="l",lwd=2)
points(xtete-0.11*80,ytete-80%%5,col="brown", type="l",lwd=2)
if ( i> 10 ) {
points(xyeux-0.11*80,yyeux-80%%5,col="blue", type="p",lwd=7,cex = 1+0.008*(i-5))
}else{
points(xyeux-0.11*80,yyeux-80%%5,col="blue", type="p",lwd=7)}
points(xbouche-0.11*80,ybouche-80%%5,col="brown", type="l",lwd=2)
points(xportetomate,yportetomate,col="seagreen", type="l",lwd=4)
points(xtomate,ytomate,col="red", pch=16, lwd=2+0.8*i ,cex=1+0.3*i)
points(xadn,yadn-0.023*1000,col="pink",lwd=3,pch=4,cex=1.5)
	dev.off()
}



# the man run and cry !
cri="AAAAHHHHHHHHHHHHHHHHHH !!!!!!!!"
for(i in 51 : 170)
{
	numero=numero+1
	filename=paste("image_",numero,".png" , sep="")
	png(filename, bg="white", width=700, height=500)

plot(xpot,ypot,col="orangered",xlim=c(0,40),ylim=c(0,35),type="l",lwd=7,xaxt="n",yaxt="n",ylab="",xlab="              a Yan Holtz Production, copyright 2012")
points(xdecor,ydecor,col="black", type="l")
points(xfeuille1,yfeuille1,col="seagreen", type="l",lwd=4)
points(xfeuille2,yfeuille2,col="seagreen", type="l",lwd=4)
points(xfeuille3,yfeuille3,col="seagreen", type="l",lwd=4)
points(xtige,ytige,col="seagreen", type="l",lwd=4)
points((xjambe-0.11*80)+0.05173333*(i-10),yjambe-i%%9,col="brown", type="l",lwd=2)
points((xbras-0.11*80)+0.05173333*(i-10),ybras-i%%9,col="brown", type="l",lwd=2)
points((xtete-0.11*80)+0.05173333*(i-10),ytete-i%%9,col="brown", type="l",lwd=2)
points((xyeux-0.11*80)+0.05173333*(i-10),yyeux-i%%9,col="blue", type="p",lwd=7,cex=2.25)
points((xbouche-0.11*80)+0.05173333*(i-10),ybouche-i%%9,col="brown", type="l",lwd=2)
points(xportetomate,yportetomate,col="seagreen", type="l",lwd=4)
points(xtomate,ytomate,col="red", pch=16,lwd=2+0.04*i,cex=1+15+0.01*i)
points(xadn,yadn-0.023*1000,col="pink",lwd=3,pch=4,cex=1.5)
text(15,30,substr(cri,1,(i-51)/8))
	dev.off()
}



# the tomato transforms itself
cri2=" A L'AIIIIIIIIIIIIIDDDDDDDDEEEEEEE !!!"
for (v in 1:100)
{
	numero=numero+1
	filename=paste("image_",numero,".png" , sep="")
	png(filename, bg="white", width=700, height=500)

xoeuil=c(12)
yoeuil=c(17)
xbouchemonstre1=c(21,10,21)
ybouchemonstre1=c(18,11,4)
xbouchemonstre2=c(21,10,21)
ybouchemonstre2=c(14,11,8)
xbouchemonstre3=c(21,10,21)
ybouchemonstre3=c(11,11,11)
plot(xpot,ypot,col="orangered",xlim=c(0,40),ylim=c(0,35),type="l",lwd=7,xaxt="n",yaxt="n",ylab="",xlab="              a Yan Holtz Production, copyright 2012")
points(xdecor,ydecor,col="black", type="l")
points(xfeuille1,yfeuille1,col="seagreen", type="l",lwd=4)
points(xfeuille2,yfeuille2,col="seagreen", type="l",lwd=4)
points(xfeuille3,yfeuille3,col="seagreen", type="l",lwd=4)
points(xtige,ytige,col="seagreen", type="l",lwd=4)
if(v<1000)
{points((xjambe-0.11*80)+0.05173333*(i-10),yjambe-i%%9,col="brown", type="l",lwd=2)
points((xbras-0.11*80)+0.05173333*(i-10),ybras-i%%9,col="brown", type="l",lwd=2)
points((xtete-0.11*80)+0.05173333*(i-10),ytete-i%%9,col="brown", type="l",lwd=2)
points((xyeux-0.11*80)+0.05173333*(i-10),yyeux-i%%9,col="blue", type="p",lwd=7,cex=2.25)
points((xbouche-0.11*80)+0.05173333*(i-10),ybouche-i%%9,col="brown", type="l",lwd=2)}
points(xportetomate,yportetomate,col="seagreen", type="l",lwd=4)
points(xtomate+0.21*v,ytomate,col="red", pch=16,lwd=2+0.04*i,cex=1+0.01*750+0.13*(i-10)+v*15/100)
points(xadn+0.21*v,yadn-0.023*1000,col="pink",lwd=3,pch=4,cex=1.5)
if(v<1000)
{text(28,30,substr(cri2,1,(v-10)/5))}
if(v%%3==1)
{points(xbouchemonstre1+0.21*v,ybouchemonstre1,type="l",lwd=4)
}else{
if(v%%3==2)
{points(xbouchemonstre2+0.21*v,ybouchemonstre2,type="l",lwd=4)
}else{
if(v%%3==0)
{points(xbouchemonstre3+0.21*v,ybouchemonstre3,type="l",lwd=4)}}}
points(xoeuil+0.21*v,yoeuil,col="orange",lwd=4,cex=3)
	dev.off()

}




# conclusion
m1="................"
m2=" ATTENTION  "
m3=" rÈflÈchissez toujours ‡ ce que vous faites......."
lesmorales=c(m1,m2,m3)

num=35
for (v in lesmorales)
{
num=num-3

for (i in 1:70)
{
text(i/2+15,num,substr(v,i,i),lwd=7,col="purple")
Sys.sleep(0.08)
}
}



  
    
    
    
    
    
    
#Transformer en un format GIF:
export MAGICK_HOME="/Users/holtz//Documents/PROGRAMMES/IMAGE_MAGIK/ImageMagick-6.8.9/"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"
convert -delay 10 image_1*.png -loop 0 pic.gif