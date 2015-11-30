png("#42_some_colors_name.png" , width = 480, height = 480 )
par(mar=c(0,0,0,0))
plot(0, 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
line=25
col=5
rect(  rep((0:(col - 1)/col),line) ,  sort(rep((0:(line - 1)/line),col),decreasing=T)   ,   rep((1:col/col),line) , sort(rep((1:line/line),col),decreasing=T),  border = "light gray" , col=colors()[seq(1,line*col)])
text(  rep((0:(col - 1)/col),line)+0.1 ,  sort(rep((0:(line - 1)/line),col),decreasing=T)+0.015 , colors()[seq(1,line*col)]  , cex=1)
dev.off()
