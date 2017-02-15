
# -----------------------------------------------------------------------------------------------------------------------------------------------------
#121 - The color argument of plotly :

# Plotly's way to call color is very much inspired by the semantics of ggplot2. It is very powerful but requires
#to get the logic that controls it. This is a small tutorial inspired by the plotly's user guide. It gives 6 examples that
#explains how you can call color with plotly.


Sys.setenv("plotly_username"="holtzy")
Sys.setenv("plotly_api_key"="w916mo7a8t")


# Let's start by charging the plotly library and having a look to the iris dataset that we will use.
library(plotly)
head(iris)


# --- 1 / HAND GIVEN COLOR MAPPINGS
#This is the most basic way to set the color. graph we can do, with only purple points --> add the color argument IN the marker argument because it does not depend of another variable !
my_graph=plot_ly(iris, x = Petal.Length, y = Petal.Width , mode="markers" , marker=list(color="purple" , size=20 , opacity=0.5)  )
#What colors can you call ?
#tooltip="A string describing color. Supported formats: - hex (e.g. '#d3d3d3') - rgb (e.g. 'rgb(255, 0, 0)') - rgba (e.g. 'rgb(255, 0, 0, 0.5)') - hsl (e.g. 'hsl(0, 100%, 50%)') - hsv (e.g. 'hsv(0, 100%, 100%)') - named colors (full list: http://www.w3.org/TR/css3-color/#svg-color)"
plotly_POST(my_graph, filename = "#121_Manage_colors_in_plotly-1", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 2, out_file = "#121_Manage_colors_in_plotly-1.png")



# --- 2 / QUALITATIVE COLOR MAPPINGS
Qualitative color mappings :If a ordinal variable (aka a non-ordered factor variable) is assigned to color, then a qualitative color palette is used by default.
# So we put the argument color OUT of the marker arguments !
my_graph=plot_ly(iris, x = Petal.Length, y = Petal.Width,  mode = "markers" , color = Species , marker=list( size=20 , opacity=0.5)  )
plotly_POST(my_graph, filename = "#121_Manage_colors_in_plotly-2", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 2, out_file = "#121_Manage_colors_in_plotly-2.png")

# If you want to change the default palette, it's recommended that you provide a http://colorbrewer2.org qualitative pallette name (e.g., "Set1" or "Accent") to the colors argument. See graph xxx
my_graph=plot_ly(iris, x = Petal.Length, y = Petal.Width,  mode = "markers" , color = Species , colors = "Set1",  marker=list( size=20 , opacity=0.5)  )
plotly_POST(my_graph, filename = "#121_Manage_colors_in_plotly-3", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 2, out_file = "#121_Manage_colors_in_plotly-3.png")

# --- 3 / SEQUENTIAL COLOR MAPPINGS
#If either a numeric or an ordered factor is mapped to color, plot_ly() applies a sequential color scale by default.
my_graph=plot_ly(iris, x = Petal.Length, y = Petal.Width , mode = "markers", marker=list( size=20 , opacity=0.5), color = Sepal.Length)
plotly_POST(my_graph, filename = "#121_Manage_colors_in_plotly-4", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 2, out_file = "#121_Manage_colors_in_plotly-4.png")

# And you can change the color palette
my_graph=plot_ly(iris, x = Petal.Length, y = Petal.Width , mode = "markers", marker=list( size=20 , opacity=0.5), color = Sepal.Length , colors=c("green","blue") )
plotly_POST(my_graph, filename = "#121_Manage_colors_in_plotly-5", world_readable=TRUE)
plotly_IMAGE(my_graph, width = 480, height = 480, format = "png", scale = 2, out_file = "#121_Manage_colors_in_plotly-5.png")







=======
UPDATE DU AU CHANGEMENT DE PLOTLY

library(plotly)
head(iris)


1 -- / Hand chosen colors.

#121 Manage colors in plotly
 
 
a
This is the most basic way to set the color: you choose the color point by point or give one color for all the points. It works like a classic R graph. Add the color argument IN the marker argument because it does not depend of another variable!
 
There are several formats available with plotly for color names :
        - hex (e.g. '#d3d3d3')
        - rgb (e.g. 'rgb(255, 0, 0)')
        - rgba (e.g. 'rgb(255, 0, 0, 0.5)')
        - hsl (e.g. 'hsl(0, 100%, 50%)')
        - hsv (e.g. 'hsv(0, 100%, 100%)')
        - named colors (full list here)

plot_ly(iris, x = ~Petal.Length, y = ~Petal.Width , type="scatter", mode="markers" , marker=list(color="purple" , size=20 , opacity=0.5)  )

 
 
a
a
2 -- / Qualitative color mapping

#121 Manage colors in plotly#121 Manage colors in plotly
 
 
a
If a ordinal variable (AKA a non-ordered factor variable) is assigned to the coloR argument, then a qualitative color palette is used by default. So we put the argument color OUT of the marker arguments!
 
If you want to change the default palette, it's recommended that you provide a RColorBrewer qualitative pallette name (e.g., "Set1" or "Accent") to the colorS argument. See graph #38 to see the existing palettes.

# left
plot_ly(iris, x = ~Petal.Length, y = ~Petal.Width,  type="scatter", mode = "markers" , color = ~Species , 
         marker=list( size=20 , opacity=0.5)  )

# right
plot_ly(iris, x = ~Petal.Length, y = ~Petal.Width,  type="scatter", mode = "markers" , color = ~Species , 
         colors = "Set1",  
         marker=list( size=20 , opacity=0.5)  )

 
 
a
a
3 -- / Sequential color mapping

#121 Manage colors in plotly#121 Manage colors in plotly


If either a numeric or an ordered factor is mapped to the coloR argument, plot_ly() applies a sequential color scale by default.

You can also change the palette, giving the starting and ending colors to the colorS argument.

# left
plot_ly(iris, x = ~Petal.Length, y = ~Petal.Width , type="scatter", mode = "markers", 
        marker=list( size=20 , opacity=0.5), color = ~Sepal.Length)

# right
plot_ly(iris, x = ~Petal.Length, y = ~Petal.Width , type="scatter", mode = "markers", 
        marker=list( size=20 , opacity=0.5), color = ~Sepal.Length , 
        colors=c("green","blue") )



