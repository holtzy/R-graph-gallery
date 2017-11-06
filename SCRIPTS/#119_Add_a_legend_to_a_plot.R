


# -----------------------------------------------------------------------------------------------------------------------------------------------------
#119 Gestion de la légende dans un graph

How can you add a legend to a plot with R? You have to use the "legend function". The arguments of this function are :

    "topright" = where do you want to add the legend ? You can put : "bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right", "center").
    legend = c("name1", "name2") : names you want to show.
    col = c("red", "blue") : colors of the symbols
    pch = 15 : type of symbols (see graph # to know what symbol number you need
    bty = "n" : If you don't want a box around the legend. Write "o" if you want one
    pt.cex = 2 : Size of the symbols
    cex = 0.8 : Size of the text
    text.col = "black" : color of the text
    horiz = TRUE : legend in column or in row ?
    inset = c(0.1, 0.1) : % (from 0 to 1) to draw the legend away from x and y axis
    You can also give the coordinate of the legend! : legend(3, 5, legend = c("A", "B") ...).

png("#119_Add_a_legend_to_a_plot.png" , width = 480, height = 480)

# Create data:
a=c(1:5)
b=c(5,3,4,5,5)
c=c(4,5,4,3,1)

# Make a basic graph
plot( b~a , type="b" , bty="l" , xlab="value of a" , ylab="value of b" , col=rgb(0.2,0.4,0.1,0.7) , lwd=3 , pch=17 , ylim=c(1,5) )
lines(c ~a , col=rgb(0.8,0.4,0.1,0.7) , lwd=3 , pch=19 , type="b" )

# Add a legend
legend("bottomleft", legend = c("Group 1", "Group 2"), col = c(rgb(0.2,0.4,0.1,0.7), rgb(0.8,0.4,0.1,0.7)), pch = c(17,19), bty = "n", pt.cex = 2, cex = 1.2, text.col = "black", horiz = F , inset = c(0.1, 0.1))

dev.off()




