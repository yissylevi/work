# data preparation
all_surveys<-read.csv("allsurveys.csv")
summary(allsurveys)
CPS<-select(all_surveys, CPS_1, CPS_2,CPS_3,CPS_4,CPS_5,CPS_6,CPS_7,CPS_8,CPS_9,CPS_10)
CPS<- as.data.frame(CPS[-1,])
CPS<- data.frame(apply(CPS,2, as.numeric))
CPS<-tbl_df(CPS)
CPS
str(CPS)
colnames(CPS) <- c("1","2", "3", "4", "5", "6", "7", "8", "9", "10")

##load packages
library(psych)
library(GPArotation)

##EFA
##number of factors
##parallal analysis and scree plot
parallel<-fa.parallel(CPS, fm="ml",fa="fa")
#two factors are greater than one Eigenvalue scree plot says there are two factors. Paralel analysis suggests 4 factors
#eigenvalues (kaiser)
parallel$fa.values
#over 1=2, over .7=2
#doign aprincipal components analysis to see how many factors there might be using that method
#Deal with NA doing principle componant analysis
princomp(na.omit(CPS), cor = TRUE)
parallel2<-princomp(na.omit(CPS), cor = TRUE)
summary(parallel2)
plot(parallel2)##results show at least two factors
#simple structure
twofactor<-fa(CPS, nfactors=2, rotate="oblimin", fm="ml")
twofactor
#question 5 6 8 9 are loading on both. so remove 5 6 8 9
CPSWO5689<-select(CPS, 1,2, 3, 4, 7, 10)
CPSWO5689<-tbl_df(CPSWO5689)
CPSWO5689
twofactorCPSWO5689<-fa(CPSWO5689, nfactors=2, rotate="varimax", fm="ml")
twofactorCPSWO5689

#question 7 is loading on both. so remove 7
CPSWO5689<-select(CPS, 1,2, 3, 4, 7)
CPSWO5689<-tbl_df(CPSWO5689)
CPSWO5689
twofactorCPSWO5689<-fa(CPSWO5689, nfactors=2, rotate="varimax", fm="ml")
twofactorCPSWO5689
#CFI, should be slightly higher than the TLI
1-((twofactor$STATISTIC - twofactor$dof)/(twofactor$null.chisq- twofactor$null.dof))
##reliability
alpha(CPS[,c(1,2,3,4,6,7,8,11,12,13,16,17)])
alpha(CPS[,c(5,9,10,14)])
#What are the factors
#Factor 1 is positive emotions
#Factor 2 is negative emotions

##Try with three factors
#simple structure
threefactor<-fa(CPS, nfactors=3, rotate="oblimin", fm="ml")
threefactor
#question 15 is loading on both. so remove 15
CPSWO15<-select(CPS, CPS_1:CPS_14, CPS_16, CPS_17)
CPSWO15<-tbl_df(CPSWO15)
CPSWO15
twofactorWO15<-fa(CPSWO15, nfactors=2, rotate="oblimin", fm="ml")
twofactorWO15
#CFI, should be slightly higher than the TLI
1-((twofactor$STATISTIC - twofactor$dof)/(twofactor$null.chisq- twofactor$null.dof))
##reliability
alpha(CPS[,c(1,2,3,4,6,7,8,11,12,13,16,17)])
alpha(CPS[,c(5,9,10,14)])
#What are the factors
#Factor 1 is positive emotions
#Factor 2 is negative emotions
library(lavaan)
CPS.model <- 'Student  =~ CPS_2 + CPS_3 + CPS_4
              Teacher  =~ CPS_6 +  CPS_8 + CPS_10

'

fit <- cfa(CPS.model, data = CPS)
summary(fit, fit.measures = TRUE, standardized=T)
modindices(fit)

library(lavaan)
library(semPlot)
CPS.model <- 'Factor  =~ CPS_2 + CPS_3 + CPS_4 +CPS_6 + CPS_8 + CPS_10
             

'

fit <- cfa(CPS.model, data = CPS)
semPaths(fit, whatLabels="std", layout="tree")
summary(fit, fit.measures = TRUE, standardized=T)
modindices(fit)
