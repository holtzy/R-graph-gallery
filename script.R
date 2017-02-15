

# -----------------------------------------------------------------------------------------------------------------------------------------------------
# #196 WORDCLOUD
# Package pour faire des wordcloud avec mots dans tous les sens + avec un filtre de forme!
# Aller voir: https://cran.r-project.org/web/packages/wordcloud2/vignettes/wordcloud.html
# Chiffon Lang
# dawei_lang@sina.cn
# https://github.com/Lchiffon/wordcloud2
# Faire un numéro avec plein d'image , puis section entiere dans la partie wordcloud!
# Le format d'entré ressemble à ca: 
         word freq
oil       oil   85
said     said   73
prices prices   48
# Options are:
# - size: general size of the wordcloud
# - minSize: threshold for the size of the smallest word

# For me
library(webshot)
webshot::install_phantomjs()
library("htmlwidgets")


# Need to refresh at first time in Rstudio Viewer 
#install.packages("wordcloud2") 
library(wordcloud2) 

# --- WORDCLOUD
# Wordcloud de Base:
ww=wordcloud2(demoFreq, size=1.6)
saveWidget(ww,"tmp.html",selfcontained = F)
webshot("tmp.html","196_wordcloud_ex1.png", vwidth = 480, vheight=480, delay =5)

# Change the color: everything is accepted, one color, several, palette and also 'random-dark' and 'random-light'
#give a palette
ww=wordcloud2(demoFreq, size=1.6, color='random-dark')
saveWidget(ww,"tmp.html",selfcontained = F)
webshot("tmp.html","196_wordcloud_ex2.png", vwidth = 480, vheight=480, delay =5)
#or a vector of colors. vector must be same length than input data
ww=wordcloud2(demoFreq, size=1.6, color=rep_len( c("green","blue"), nrow(demoFreq) ) )
saveWidget(ww,"tmp.html",selfcontained = F)
webshot("tmp.html","196_wordcloud_ex3.png", vwidth = 480, vheight=480, delay =5)

# Change the background color
ww=wordcloud2(demoFreq, size=1.6, color='random-light', backgroundColor="black")
saveWidget(ww,"tmp.html",selfcontained = F)
webshot("tmp.html","196_wordcloud_ex4.png", vwidth = 480, vheight=480, delay =5)

# Change the shape: Available: 'circle' (default), 'cardioid', 'diamond' (alias of square), 'triangle-forward', 'triangle', 'pentagon', and 'star')
ww=wordcloud2(demoFreq, size = 1.2, shape = 'star')
saveWidget(ww,"tmp.html",selfcontained = F)
webshot("tmp.html","196_wordcloud_ex5.png", vwidth = 480, vheight=480, delay =5)

# Change the shape using whatever form
ww=wordcloud2(demoFreq, figPath = "/Users/holtz/Documents/WORDPRESS/R_GRAPH/#196_WORDCLOUD2_PACKAGE/peace.png", size = 1.5,color = "skyblue", backgroundColor="black")
ww
#enregistrer en png: probleme_3.png

# Control how words are rotated:
ww=wordcloud2(demoFreq, size = 2.3, minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)
saveWidget(ww,"tmp.html",selfcontained = F)
webshot("tmp.html","196_wordcloud_ex7.png", vwidth = 480, vheight=480,  delay =5)

# Chinese version:
ww=wordcloud2(demoFreqC, size = 2, fontFamily = "微软雅黑", color = "random-light", backgroundColor = "grey")
 saveWidget(ww,"tmp.html",selfcontained = F)
webshot("tmp.html","196_wordcloud_ex8.png", vwidth = 480, vheight=480, delay =5)
          

# LETTERCLOUD ---

# Letter cloud = wordcloud en forme d'une lettre:
ww=letterCloud( demoFreq, word = "R", color='random-light' , backgroundColor="black")
ww
#enregistrer en probleme2. png

# Letter cloud = wordcloud en forme d'un mot:
ww=letterCloud( demoFreq, word = "PEACE", color="white", backgroundColor="pink")
#marche pas, il faut le faire à la main dans mozilla, click droit, enregistrer en png...
ww
#enregistrer en probleme1.png


# How To save as png, we need the webshot library & to install phantom
library(webshot)
webshot::install_phantomjs()
# Make the graph
my_graph=wordcloud2(demoFreq, size=1.5)
# save it in html
library("htmlwidgets")
saveWidget(my_graph,"tmp.html",selfcontained = F)
webshot("tmp.html","fig_1.pdf", delay =5)


