#Liste des RGB
#Colonne vide=que des 0
png("#43_RGB_colors.png" , width = 480, height = 480 )
par(mar=c(1,1,1,1))
plot(0, 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
line=18
col=12
red=sort(rep(rep(c(0,0.2,0.4,0.6,0.8,1),col),3))
green=rep(sort(rep(c(0,0.2,0.4,0.6,0.8,1),2)),line)
blue=  rep(c(rep(c(0,0.2),6) , rep(c(0.4,0.6),6) , rep(c(0.8,1),6)) , 6)
colors=rgb(red,green,blue,1)
rect(  rep((0:(col - 1)/col),line) ,  sort(rep((0:(line - 1)/line),col),decreasing=T)   ,   rep((1:col/col),line) , sort(rep((1:line/line),col),decreasing=T),  border = "light gray" , col=colors)
mtext(c("red","green") , side=c(2,3) , line=0.05)
axis(2 , at=c(17,14,11,8,5,2)/18-0.035 , labels=c("0","0.2","0.4","0.6","0.8","1") , tick=F , lty=6 , pos=0.01)
axis(3 , at=c(1.5 , 3.5 , 5.5 , 7.5 , 9.5 , 11.5)/12-0.045 , labels=c("0","0.2","0.4","0.6","0.8","1") , tick=F , pos=0.98)
text( rep(c(11/12-0.04 ,12/12-0.04 ),3) , c(3/18,3/18,2/18,2/18,1/18,1/18)-0.025, c("0" , "0.2" , "0.4" , "0.6" , "0.8" , "1"))
 text( 10/12-0.04 , 2/18-0.025 , "green : ")
dev.off()


