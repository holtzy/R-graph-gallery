png("#208_Basic_barplot.png" , width = 480, height = 480 )

# Let's create a vector of data:
my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")
# The most basic barplot you can do:
barplot(my_vector)

dev.off()
