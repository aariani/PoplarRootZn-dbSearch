## ui.R

shinyUI(fluidPage(
	titlePanel('Visualize ChIP-Seq and RNA-seq data of Poplar'),
	tags$hr(),
	sidebarPanel(
		helpText('Explore genes identified by an integrated approach using ChIP-Seq and RNA-Seq datasets of ', em('Populus'), ' roots under excess zinc'),
		tags$hr(),
		selectInput('chipdata', 
			'Select ChIP-Seq dataset',
			choices=c('H3K4me3', 'H3K27me3', 'H3K27me3-upstream')
			),
		tags$hr(),
		selectInput('treat', 
			'Selected Zn treatment',
			choices=c('Control', '1mM-Zn')
			),
		selectInput('exp', 
			'Select Expression class',
			choices=c('All', 'High', 'Medium', 'Low', 'Not-Expressed')
			),
		tags$hr(),
		downloadButton('downloaddata', 'Download')
		),
	mainPanel(
		dataTableOutput('finaldata')
		)
	)
)
		
