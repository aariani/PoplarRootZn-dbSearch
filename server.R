## server.R

source('helper.R')

h3k4=read.table('data/final_k4db.csv', sep='\t', quote='', header=T)

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
			'Control' = 'control', 
			'1mM-Zn' = 'treatment'
			)
		})

#### Filter data with the panel
####	zntreat=filterTreat(data(), treatment())
	

	expressionclass=reactive({
		switch(input$exp,
			'All' = 'all', 
			'High' = 'high', 
			'Medium' = 'medium', 
			'Low' = 'low', 
			'Not-Expressed' = 'no_exp'
			)
		})
	
	data_final=reactive({
		zntreat=filterTreat(data(), treatment())
		if (expressionclass() =='all') return(zntreat)
		filterExp(zntreat, expressionclass())
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
