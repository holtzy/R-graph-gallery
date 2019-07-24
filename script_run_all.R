fileNames <- Sys.glob("*.Rmd")
for( i in fileNames){
	tryCatch({
		rmarkdown::render(i, output_format="html_document", quiet=TRUE)
	}, error=function(e){print(i)})
}
