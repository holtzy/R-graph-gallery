

# ---------------------------------------------------------------------------------------------------------------------------------------------------------

#################
GRAPH 271 ?: GGANIMATE
#################

# Example: https://github.com/dgrtwo/gganimate

# Get data:
library(gapminder)

# Charge libraries:
library(ggplot2)
#devtools::install_github("dgrtwo/gganimate")
library(gganimate)

# Make a ggplot, but add frame=year: one image per year
p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent, frame = year)) +
  geom_point() +
  scale_x_log10() +
  theme_bw()


# Make the animation!ç
gganimate(p)

# Save it to Gif
gganimate(p, "#271_gganimate.gif")

# ---------------------------------------------------------------------------------------------------------------------------------------------------------


