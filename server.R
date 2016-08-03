## server.R

source('helper.R')

h3k4=read.table('data/final_k4db.csv', sep='\t', quote='', header=T)
h3k27=read.table('data/final_k27db.csv', sep='\t', quote='', header=T)
h3k27up=read.table('data/final_k27updb.csv', sep='\t', quote='', header=T)

shinyServer(function(input, output){

#### Select data to show
	data=reactive({
		switch(input$chipdata,
			'H3K4me3'= h3k4,
			'H3K27me3' = h3k27,
			'H3K27me3-upstream'=h3k27up
			)
		})

#### select treatment	
	treatment=reactive({
		switch(input$treat,
			'Both' = 'all',
			'Control' = 'Control_Expression_Group', 
			'1mM-Zn' = 'Treatment_Expression_Group'
			)
		})

#### Select Expression class
	expressionclass=reactive({
		switch(input$exp,
			'All' = 'all', 
			'High' = 'High Expression', 
			'Medium' = 'Medium Expression', 
			'Low' = 'Low Expression', 
			'Not-Expressed' = 'Not Expressed'
			)
		})
	
### Filter data for output
### First it filter for treatment class. the filterTreat function wil handle the
### Option of all the treament selected
### The the filterExp will handle the filtering by expression class
### the filterExp need the treatment() parameter because the function will handle the selection on 1 column or two
	data_final=reactive({
		zntreat=filterTreat(data(), treatment())
		if (expressionclass() =='all') return(zntreat)
		filterExp(zntreat, expressionclass(), treatment())
		})	


	output$finaldata=renderDataTable({
			data_final()
			})

	output$downloaddata=downloadHandler(
		filename=function(){
			paste('PopZnroot_db-', input$chipdata, '-', input$treat, '-', input$exp, '-', Sys.Date(), '.csv', sep='')
			},
		content=function(file){
			write.table(data_final(), file, sep='\t', col.names=T, row.names=F, quote=F)
			}
		)
	})
