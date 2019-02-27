
# PIE PLOT
png("#131_Basic_Pie_Plot_demo.png" , width = 480, height = 480)
par(mfrow=c(3,3) , mar=c(0,0,0,0))

# Create Data
Prop=c(3,7,9,1,2)

# Make the default Pie Plot
pie(Prop)

# You can also custom the labels:
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E"))

# If you give a low value to the "edge" argument, you go from something circular to a shape with edges
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , edges=10)

# With the radius argument, you choose to zoom in (high values --> big pie) or out (low values --> small pie)
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , radius=10)
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , radius=0.2)

# The clockwise function to decide where you add the first group. If false, starts 90° right, it true, starts on the top of the pie
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , clockwise = FALSE)
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , clockwise = TRUE)

# The density arguments permits to add shading lines, and you can control the angle of this lines with "angle"
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , density=10 , angle=c(20,90,30,10,0))

# You can change the border of each area with the classical parameters:
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E")  , border="grey" )
dev.off()

png("#131_Basic_Pie_Plot.png" , width = 480, height = 480)
pie(Prop , labels = c("Gr-A","Gr-B","Gr-C","Gr-D","Gr-E") , radius=1)
dev.off()

