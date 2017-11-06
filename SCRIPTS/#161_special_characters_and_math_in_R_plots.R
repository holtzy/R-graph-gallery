


# -----------------------------------------------------------------------------------------------------------------------------------------------------
Ecrire des expressions dans le texte d'un graphe ?
more example here
https://stat.ethz.ch/R-manual/R-devel/library/grDevices/html/plotmath.html



png("#161_special_characters_and_math_in_R_plots.png" , width = 480, height = 480 )
par(mar=c(1,1,1,1))
plot(1,1,col="white" , xaxt="n" , yaxt="n", xlab="" , ylab="" ) 

# Subscript
text(0.8,1.2, expression('subscript'[2]) , cex=2 )

# Exponent
text(0.8,1, expression('subscript'^2) , cex=2 )

# multiple subscripts in one text --> use the star(*) to separate the sections:
text(0.8,0.8, expression('hi'[5]*'there'[6]^8*'you'[2]) , cex=2 )

# Mathematical expression
text(1.2, 1.2, expression(paste(frac(1, sigma*sqrt(2*pi)), " ", plain(e)^{frac(-(x-mu)^2, 2*sigma^2)})), cex = 2)

# Special symbol:
text(1.2, 1, expression(symbol("\305")) , cex=2)

# Pi
text(1.2, 0.8, expression( -hat(pi)/2 ) , cex=2)

dev.off()
