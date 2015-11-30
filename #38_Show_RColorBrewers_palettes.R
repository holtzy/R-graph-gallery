
Intro : 
     1. Sequential palettes are suited to ordered data that progress
     from low to high.  Lightness steps dominate the look of these
     schemes, with light colors for low data values to dark colors for
     high data values.
     2. Diverging palettes put equal emphasis on mid-range critical
     values and extremes at both ends of the data range. The critical
     class or break in the middle of the legend is emphasized with
     light colors and low and high extremes are emphasized with dark
     colors that have contrasting hues.
     3. Qualitative palettes do not imply magnitude differences between
     legend classes, and hues are used to create the primary visual
     differences between classes.  Qualitative schemes are best suited
     to representing nominal or categorical data.
    The sequential palettes names are
     Blues BuGn BuPu GnBu Greens Greys Oranges OrRd PuBu PuBuGn PuRd
     Purples RdPu Reds YlGn YlGnBu YlOrBr YlOrRd

     All the sequential palettes are available in variations from 3
     different values up to 9 different values.

     The diverging palettes are
     BrBG PiYG PRGn PuOr RdBu RdGy RdYlBu RdYlGn Spectral

     All the diverging palettes are available in variations from 3
     different values up to 11 different values.

     For qualitative palettes, the lowest number of distinct values
     available always is 3, but the largest number is different for
     different palettes. It is given together with the palette names in
     the following table.


library(RColorBrewer)
png("#38_Show_RColorBrewers_palettes.png" , width = 480, height = 480)
par(mar=c(3,4,2,2))
display.brewer.all()
dev.off()

