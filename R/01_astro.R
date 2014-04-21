# TODO: Add comment
# 
# Author: jbg
###############################################################################

# http://www.astrostatistics.psu.edu/RLectures/ClusClass.html
# http://astrostatistics.psu.edu/datasets/COMBO17.html

COMBO=read.table(
		c('http://astrostatistics.psu.edu/datasets/COMBO17.dat'
			, 'http://www.astro.psu.edu/users/edf/COMBO17.dat')[1]
			,header=T,fill=T)
dim(COMBO) ; names(COMBO)
loz_index=which((COMBO[,6]<0.3) & (COMBO[,12]<0) & (COMBO[,28]<0))
COMBO_loz=cbind(COMBO[loz_index,12],COMBO[loz_index,28] - COMBO[loz_index,12])
names(COMBO_loz)=c('M_B','M_280') ; dim(COMBO_loz) ; summary(COMBO_loz) 
par(mfrow=c(1,2))
plot(COMBO_loz,pch=20,cex=0.5,xlim=c(-22,-7), ylim=c(-2,2.5),xlab='M_B (mag)',ylab='M_280 - M_B (mag)',main='COMBO-17 galaxies (z<0.3)')

# Two-dimensional kernel-density estimator

library(MASS)
COMBO_loz_sm=kde2d(COMBO_loz[,1],COMBO_loz[,2], h=c(1.6,0.4),lims = c(-22,-7,-2,2.5), n=500)
image(COMBO_loz_sm,col=grey(13:0/15),xlab='M_B (mag)',ylab='M_280 - M_B (mag)',,xlim=c(-22,-7), ylim=c(-2,2.5),xaxp=c(-20,-10,2))
par(mfrow=c(1,1))

