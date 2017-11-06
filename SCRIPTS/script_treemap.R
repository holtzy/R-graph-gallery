
# -----------------------------------------------------------------------------------------------------------------------------------------------------
# EXEMPLE 4: INTERACTIVE TREEMAP

# library
library(treemap)
library(d3treeR)
library(htmlwidgets)


# Most basic example
group=c(rep("group-1",4),rep("group-2",2),rep("group-3",3))
subgroup=paste("subgroup" , c(1,2,3,4,1,2,1,2,3), sep="-")
value=c(13,5,22,12,11,7,3,1,23)
data=data.frame(group,subgroup,value)

# basic treemap
p=treemap(data,
            index=c("group","subgroup"),
            vSize="value",
            type="index"
            )            

# make it interactive:
inter=d3tree2( p ,  rootname = "General" )
saveWidget(inter, file="#236_interactive_treemap.html", selfcontained = T)


# -----------------------------------------------------------------------------------------------------------------------------------------------------


