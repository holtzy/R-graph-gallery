# -----------------------------------------------------------------------------------------------------------------------------------------------------

# Sympa!
# Carlos Ortega
# cof@qualityexcellence.es
# https://github.com/jbryer/likert

# library
library(likert) 

# Use a provided dataset
data(pisaitems) 
items28 <- pisaitems[, substr(names(pisaitems), 1, 5) == "ST24Q"] 

# Realize the plot
l28 <- likert(items28) 
summary(l28) 

png("#202_barplot_likert_package.png" , width = 480, height = 480 )
plot(l28)
dev.off()


