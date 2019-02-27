png("#49_custom_pie_plot.png" , width = 480, height = 480 )

#Data

x <- c(15, 9, 75, 90, 1, 1, 11, 5, 9, 8, 33, 11, 11, 20, 14, 13, 10, 28, 33, 21, 24, 25, 11, 33)

#Fonction clock plot
clock.plot <- function (x, col = rainbow(n), ...) {
  if( min(x)<0 ) x <- x - min(x)
  if( max(x)>1 ) x <- x/max(x)
  n <- length(x)
  if(is.null(names(x))) names(x) <- 0:(n-1)
  m <- 1.05
  plot(0, 
       type = 'n', # do not plot anything
       xlim = c(-m,m), ylim = c(-m,m), 
       axes = F, xlab = '', ylab = '', ...)
  a <- pi/2 - 2*pi/200*0:200
  polygon( cos(a), sin(a) )
  v <- .02
  a <- pi/2 - 2*pi/n*0:n
  segments( (1+v)*cos(a), (1+v)*sin(a), 
            (1-v)*cos(a), (1-v)*sin(a) )
  segments( cos(a), sin(a), 
            0, 0, 
            col = 'light grey', lty = 3) 
  ca <- -2*pi/n*(0:50)/50
  for (i in 1:n) {
    a <- pi/2 - 2*pi/n*(i-1)
    b <- pi/2 - 2*pi/n*i
    polygon( c(0, x[i]*cos(a+ca), 0),
             c(0, x[i]*sin(a+ca), 0),
             col=col[i] )
    v <- .1
    text((1+v)*cos(a), (1+v)*sin(a), names(x)[i])
  }
}
clock.plot(x, 
  main = "Number of visitors to a web site for each hour of the day")
  
dev.off()
