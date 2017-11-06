# libraries:
library(tidyverse)
library(tweenr)
library(gganimate)

# Make 2 basic barplots
a=data.frame(group=c("A","B","C"), values=c(3,2,4), frame=rep('a',3))
b=data.frame(group=c("A","B","C"), values=c(5,3,7), frame=rep('b',3))
data=rbind(a,b)	

# Basic barplot:
ggplot(a, aes(x=group, y=values, fill=group)) + 
  geom_bar(stat='identity')

# Interpolate data with tweenr
ts <- list(a, b, a)
tf <- tween_states(ts, tweenlength = 0.02, statelength = 0.001, ease = c('cubic-in-out'), nframes = 30)
tf

# Make a barplot with frame
p=ggplot(tf, aes(x=group, y=values, fill=group, frame= .frame)) + 
  geom_bar(stat='identity', position = "identity")
gganimate(p, interval = .1, title_frame = F, filename="#288_barplot_animation.gif", ani.width=480, ani.height=480)


