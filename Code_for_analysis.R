PERMA1<-select(PERMA_Psychometic,PERMA_1:PERMA_17)#selecting only the PERMA items
PERMA<-PERMA1[-1,]#removes row 1
##data screening
#The data is treated as factors so need to change to numeric
PERMA<- data.frame(apply(PERMA,2, as.numeric))
PERMA<-tbl_df(PERMA)#putting it into an easily accesible tabel
PERMA#looking at the data

PERMA<-PERMA[complete.cases(PERMA),]#removes NA and leaves complete cases, could also use: nomissing<-na.omit(PERMA)


##load packages
library(psych)
library(GPArotation)

##EFA
##number of factors
##parallal analysis and scree plot
parallel<-fa.parallel(PERMA, fm="ml",fa="fa")
#two factors are greater than one Eigenvalue scree plot says there are two factors. Paralel analysis suggests 4 factors
#eigenvalues (kaiser)
parallel$fa.values
#over 1=2, over .7=2
parallel1<-princomp(PERMA)#doign aprincipal components analysis to see how many factors there might be using that method
summary(parallel1)
plot(parallel1)##results show at least two factors
#simple structure
twofactor<-fa(PERMA, nfactors=2, rotate="oblimin", fm="ml")
twofactor
#question 15 is loading on both. so remove 15
PERMAWO15<-select(PERMA, PERMA_1:PERMA_14, PERMA_16, PERMA_17)
PERMAWO15<-tbl_df(PERMAWO15)
PERMAWO15
twofactorWO15<-fa(PERMAWO15, nfactors=2, rotate="oblimin", fm="ml")
twofactorWO15
#CFI, should be slightly higher than the TLI
1-((twofactor$STATISTIC - twofactor$dof)/(twofactor$null.chisq- twofactor$null.dof))
##reliability
alpha(PERMA[,c(1,2,3,4,6,7,8,11,12,13,16,17)])
alpha(PERMA[,c(5,9,10,14)])
#What are the factors
#Factor 1 is positive emotions
#Factor 2 is negative emotions

##Try with three factors
#simple structure
threefactor<-fa(PERMA, nfactors=3, rotate="oblimin", fm="ml")
threefactor
#question 15 is loading on both. so remove 15
PERMAWO15<-select(PERMA, PERMA_1:PERMA_14, PERMA_16, PERMA_17)
PERMAWO15<-tbl_df(PERMAWO15)
PERMAWO15
twofactorWO15<-fa(PERMAWO15, nfactors=2, rotate="oblimin", fm="ml")
twofactorWO15
#CFI, should be slightly higher than the TLI
1-((twofactor$STATISTIC - twofactor$dof)/(twofactor$null.chisq- twofactor$null.dof))
##reliability
alpha(PERMA[,c(1,2,3,4,6,7,8,11,12,13,16,17)])
alpha(PERMA[,c(5,9,10,14)])
#What are the factors
#Factor 1 is positive emotions
#Factor 2 is negative emotions


