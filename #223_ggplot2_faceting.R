
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# 223 GGPLOT2: FACETING

# library
library(ggplot2)

# dataset:
head(mtcars)

# facet wrap: je mets les cases les unes après les autres
png("#223_ggplot2_faceting_1.png" , width = 480, height = 480 )
ggplot( mtcars , aes(x=mpg, y=wt )) + geom_point() +  facet_wrap(~cyl)
dev.off()
png("#223_ggplot2_faceting_2.png" , width = 480, height = 480 )
ggplot( mtcars , aes(x=mpg, y=wt )) + geom_point() +  facet_wrap(~cyl , dir="v")
dev.off()
png("#223_ggplot2_faceting_3.png" , width = 480, height = 480 )
ggplot( mtcars , aes(x=mpg, y=wt )) + geom_point() +  facet_wrap(~cyl , strip.position="bottom")
dev.off()
png("#223_ggplot2_faceting_4.png" , width = 480, height = 480 )
ggplot( mtcars , aes(x=mpg, y=wt )) + geom_point() +  facet_wrap(~cyl , scales="fixed" )
dev.off()


# Facet grid, je fais un cadrillage, et dis quelle variable en x, et la quelle en y
png("#223_ggplot2_faceting_5.png" , width = 480, height = 480 )
ggplot( mtcars , aes(x=mpg, y=wt )) + geom_point() +  facet_grid(. ~ cyl)
dev.off()
png("#223_ggplot2_faceting_6.png" , width = 480, height = 480 )
ggplot( mtcars , aes(x=mpg, y=wt )) + geom_point() +  facet_grid( cyl ~ .)
dev.off()
png("#223_ggplot2_faceting_7.png" , width = 480, height = 480 )
ggplot( mtcars , aes(x=mpg, y=wt )) + geom_point() +  facet_grid( cyl ~ gear)
dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------

