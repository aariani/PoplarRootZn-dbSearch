### helper function for script

filterTreat=function(d, treat){
#### function for filtering column by treatment
	newd=d[,c('Gene', treat, 'Gene_description')]
	newd=na.omit(newd)
	colnames(newd)=c('GeneID', 'Expression_class', 'Gene_description')
	return(newd)
	}


filterExp=function(dat, exp_class){
	n=subset(dat, dat$Expression_class==exp_class)
	return(n)
	}
