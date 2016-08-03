### helper function for script

filterTreat=function(d, treat){
#### function for filtering column by treatment
	if (treat == 'all') return(d)
	newd=d[,c('GeneID', treat, 'Gene_description')]
	newd=na.omit(newd)
#	colnames(newd)=c('GeneID', 'Expression_class', 'Gene_description')
	return(newd)
	}


filterExp=function(dat, exp_class, treat){
	if (treat == 'all') {
		n=subset(dat, dat[,'Control_Expression_Group'] == exp_class | dat[,'Treatment_Expression_Group'] == exp_class)
		return(n)
		}
	n=subset(dat, dat[,treat]==exp_class)
	return(n)
	}
