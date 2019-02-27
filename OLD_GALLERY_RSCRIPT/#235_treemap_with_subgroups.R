

# -----------------------------------------------------------------------------------------------------------------------------------------------------
# EXEMPLE 2: 2 LEVELS

# library
library(treemap)

# Most basic example
group=c(rep("group-1",4),rep("group-2",2),rep("group-3",3))
subgroup=paste("subgroup" , c(1,2,3,4,1,2,1,2,3), sep="-")
value=c(13,5,22,12,11,7,3,1,23)
data=data.frame(group,subgroup,value)

# treemap
png("#235_treemap_with_subgroups.png" , width = 480, height = 480 )
treemap(data,
            index=c("group","subgroup"),
            vSize="value",
            type="index"
            )            
dev.off()
# -----------------------------------------------------------------------------------------------------------------------------------------------------


