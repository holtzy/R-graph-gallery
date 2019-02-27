
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# EXEMPLE 1: MOST BASIC

# library
library(treemap)

# Most basic example
group=c("group-1","group-2","group-3")
value=c(13,5,22)
data=data.frame(group,value)

# treemap
png("#234_basic_treemap.png" , width = 480, height = 480 )
treemap(data,
            index="group",
            vSize="value",
            type="index"
            )
dev.off()

# J'en profite pour faire une image portfolio
800x600
# Most basic example
group=c("group-1","group-2","group-3","group-4","group-5")
value=c(13,5,22,8,7)
data=data.frame(group,value)

# treemap
png("#234_treemap_portfolio.png" , width = 400, height = 300 )
treemap(data, index="group", vSize="value", type="index", title="")
dev.off()

# -----------------------------------------------------------------------------------------------------------------------------------------------------
         
