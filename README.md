# PoplarRootZn-dbSearch


R shiny web app for searching and downloading results from a ChIP-Seq and RNA-Seq experiment in *Populus*.


=================================================================================

## How to run PoplarRootZn-dbSearch web application

For running this web application you will need to instal [R] (www.r-project.org) on your Personal Computer

After installing R you you need to install R shiny. Open R and type:

	install.packages('shiny')


For more information about R shiny please visit the [Shiny webpage] (http://shiny.rstudio.com/)


### Run the app remotely within R 

For runnig this app open the R environment and type:

	library(shiny)
	runGitHub('PoplarRootZn-dbSearch', 'aariani')


### Run the app locally

For runnign the app locally you need to download the entire repo

You can download everything in zip format by clicking the `Clone or download` button on this web page. Save and unpack the zip archive in your working directory

Alternatively you can clone with git by typing from the terminal: 

	git clone https://github.com/aariani/PoplarRootZn-dbSearch

Within the PoplarRootZn-dbSearch folder open R and type:
	
	library(shiny)
	runApp()


### How to cite this app

If you will use this app for your research please cite [our published manuscript] (http://www.sciencedirect.com/science/article/pii/S0098847216301630) in Environmental and Experimental Botany:

	Ariani, A., Romeo, S., Groover, A.T., Sebastiani, L., 2016. Comparative epigenomic and transcriptomic analysis of Populus roots under excess Zn. 
	Environ. Exp. Bot. 132, 16–27. doi:10.1016/j.envexpbot.2016.08.005



