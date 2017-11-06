
           
# -----------------------------------------------------------------------------------------------------------------------------------------------------

# Stream graph !
https://hrbrmstr.github.io/streamgraph/
html widget stream - graph
           
# ------- FOR ALL --------------           
#Library
library(streamgraph)
library("htmlwidgets")

# Create data:
year=rep(seq(1990,2016) , each=10)
name=rep(letters[1:10] , 27)
value=sample( seq(0,1,0.0001) , length(year))
data=data.frame(year, name, value)
#  --------------           




#  154 --------------           
# Basic stream graph: just give the 3 argument
sg=streamgraph(data, key="name", value="value", date="year")
saveWidget(sg, file="my_streamgraph1.html", selfcontained = TRUE)
#  --------------           


#  155 --------------           
# We can change the offset to
#‘silhouette’ (default), ‘wiggle’, ‘expand’ or ‘zero’
# Zero: change the baseline of the graph to 0
# Expand: take the whole screen --> rectangle
# silhouette = classeic stream graph.
sg=streamgraph(data, key="name", value="value", date="year" , 
	offset="zero"
	)
saveWidget(sg, file="my_streamgraph2.html", selfcontained = TRUE)

sg=streamgraph(data, key="name", value="value", date="year" , 
	offset="expand"
	)
saveWidget(sg, file="my_streamgraph3.html", selfcontained = TRUE)
#  --------------           



# 156 --------------           
# We can add a legend --> permits to highlight a desired name
sg=streamgraph(data, key="name", value="value", date="year" )%>%
  sg_legend(show=TRUE, label="names: ")
saveWidget(sg, file="my_streamgraph4.html", selfcontained = TRUE)
#  --------------           


# 157 --------------           
# Use line between each point instead of curve. You get a stacked area graph. Make it more pointy. interpolate argument, several possibilities.
sg=streamgraph(data, key="name", value="value", date="year" ,interpolate="linear" )
saveWidget(sg, file="my_streamgraph5.html", selfcontained = TRUE)

# With the same option, we can get a well known stacked barplot !
sg=streamgraph(data, key="name", value="value", date="year" ,interpolate="step" )
saveWidget(sg, file="my_streamgraph6.html", selfcontained = TRUE)
#  --------------           


#  158 --------------           
# Choose color --> choose a R colorBrewer palette !
sg=streamgraph(data, key="name", value="value", date="year"  )%>%
sg_fill_brewer("Blues")
saveWidget(sg, file="my_streamgraph7.html", selfcontained = TRUE)

# Choose color --> choose one by one in a vector
sg=streamgraph(data, key="name", value="value", date="year"  )%>%
sg_fill_manual(c(1:10))
saveWidget(sg, file="my_streamgraph8.html", selfcontained = TRUE)
#  --------------           



#  159 --------------           
# If you need a static image:
sg=streamgraph(data, key="name", value="value", date="year" , interactive=FALSE)
saveWidget(sg, file="my_streamgraph9.html", selfcontained = TRUE)
#  --------------           


#  160  --------------           
# If you need to save an interactive chart: 
library("htmlwidgets")
sg=streamgraph(data, key="name", value="value", date="year")
#saveWidget(sg, file="my_streamgraph.html", selfcontained = TRUE)
#  160  --------------           



#  161  --------------           
# To save a static one:
#library("htmlwidgets")
library(webshot)

#install phantom:
webshot::install_phantomjs()

#Make the graph in an object
sg=streamgraph(data, key="name", value="value", date="year" , interactive=TRUE )

# Make a webshot in pdf : high quality but can not choose printed zone
webshot("file:///var/folders/pw/tm196gd13_bbqx2ybbd0wnbw0000gq/T/RtmpRIxrXy/viewhtml31dc28cd3e5c/index.html" , "output.pdf", delay = 0.2)     #cliprect = c(440, 0, 1000, 10)

# Make a webshot in png : Low quality - but you can choose shape
webshot("file:///var/folders/pw/tm196gd13_bbqx2ybbd0wnbw0000gq/T/RtmpRIxrXy/viewhtml31dc28cd3e5c/index.html" , "output.pdf", delay = 0.2)     #cliprect = c(440, 0, 1000, 10)

# From .pdf to .png with image Magick
convert "output.pdf"  -resize 480x480\!  "output.png"

# Pour moi, pour faire les thumbnailes pour le site
open *html
#Je récupère tous les liens html et je les mets dans un fichier liste. Puis je vais modifier ce fichier liste
cat liste | sed 's/file/library(webshot)\; webshot("file/'    |      sed 's/html/html\" , \"output.pdf\", delay = 0.01)/'  > script.R
# A la main je renumérote les numéro des fichier de sortie
# Puis j'envoie
Rscript script.R
#Ensuite je dois convertir en png au bon format avec image magick
for i in out*pdf ; do
echo $i ; 
a=$(echo $i | sed 's/pdf/png/')
convert $i  -resize 480x480\!  $a
done





liste=read.table("liste")
a=0
for (i in liste) {a=a+1 ;  webshot(i , "output.pdf", delay = 0.2) }
 }


#  --------------           


