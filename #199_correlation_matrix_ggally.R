
# 199
# Chris
# rct3master@web.de
# http://chrisk91.me

# Quick display of two cabapilities of GGally, to assess the distribution and correlation of variables 
library(GGally)

# Create data 
sample_data <- data.frame( v1 = 1:100 + rnorm(100,sd=20), v2 = 1:100 + rnorm(100,sd=27), v3 = rep(1, 100) + rnorm(100, sd = 1)) 
sample_data$v4 = sample_data$v1 ** 2 
sample_data$v5 = -(sample_data$v1 ** 2) 

# Check correlation between variables
cor(sample_data) 

# Check correlations (as scatterplots), distribution and print corrleation coefficient 
png("#199_correlation_matrix_ggally_1.png" , width = 480, height = 480 )
ggpairs(sample_data) 
dev.off()

# Nice visualization of correlations
png("#199_correlation_matrix_ggally_2.png" , width = 480, height = 480 )
ggcorr(sample_data, method = c("everything", "pearson")) 
dev.off()


