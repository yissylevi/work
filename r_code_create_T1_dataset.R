#Read in data sets

most <- read.csv("Psychometic_surveys.csv",header=T,sep=",")
Perma <- read.csv("PERMA_Psychometic.csv",header=T,sep=",")
SDQIII <- read.csv("SDQIII_Surveys.csv",header=T,sep=",")
SDQIIP <- read.csv("SDQIIP_Surveys.csv",header=T,sep=",")
GRIT <- read.csv("GRIT_Psychometic.csv",header=T,sep=",")
Big5<-read.csv("Big5_Surveys.csv",header=T,sep=",")
CPSN<-read.csv("CPS_Negatiive Question.csv",header=T,sep=",")


#Put them into managable table

Perma<-tbl_df(Perma)
most<-tbl_df(most)
SDQIII<-tbl_df(SDQIII)
SDQIIP<-tbl_df(SDQIIP)
GRIT<-tbl_df(GRIT)
BIG5<-tbl_df(Big5)
CPSn<-tbl_df(CPSN)

#Check the veriables
Perma
most
SDQIII
SDQIIP
GRIT
BIG5
CPSn
ADULTGRIT
ADULTPERMA

#Remove identifying colunms

Perma<-select(Perma, Dataset, PERMA_1  , PERMA_2  , PERMA_3  , PERMA_4  , PERMA_5  , PERMA_6  , PERMA_7  , PERMA_8
              , PERMA_9  , PERMA_10  , PERMA_11  , PERMA_12  , PERMA_13  , PERMA_14  , PERMA_15  , PERMA_16  ,
              PERMA_17)
Perma <- Perma[grep("AST1|PSQUAL", Perma$Dataset),]
Perma<-select(Perma, PERMA_1  , PERMA_2  , PERMA_3  , PERMA_4  , PERMA_5  , PERMA_6  , PERMA_7  , PERMA_8
              , PERMA_9  , PERMA_10  , PERMA_11  , PERMA_12  , PERMA_13  , PERMA_14  , PERMA_15  , PERMA_16  ,
              PERMA_17)

most<-select(most, Dataset, ASDQII_1  , ASDQII_2  , ASDQII_3  , ASDQII_4  , ASDQII_5  , ASDQII_6  , ASDQII_7  ,
             ASDQII_8  , ASDQII_9  , ASDQII_10  , ASDQII_11  , ASDQII_12  , ASDQII_13  , ASDQII_14  , ASDQII_15  ,
             ASDQII_16  , ASDQII_17  , ASDQII_18  , ASDQII_19  , ASDQII_20  , CPS_1  , CPS_2  , CPS_3  , CPS_4
             , CPS_5  , CPS_6  , CPS_7  , CPS_8  , CPS_9  , CPS_10  , MLQ_1  , MLQ_2  , MLQ_3  , MLQ_4
             , MLQ_5  , MLQ_6  , MLQ_7  , MLQ_8  , MLQ_9  , MLQ_10  , LET_1  , LET_2  , LET_3  , LET_4
             , LET_5  , LET_6  , PWB_1  , PWB_2  , PWB_3  , PWB_4  , PWB_5  , PWB_6  , PWB_7  , PWB_8
             , PWB_9  , APSI_1  , APSI_2  , APSI_3  , APSI_4  , APSI_5  , APSI_6  , APSI_7  , APSI_8  ,
             HAPPI.1_1  , HAPPI.2_1  , HAPPI.3_1  , HAPPI.4_1  , RES.1  , RES.2  , RES.3  , SDQI_1  , SDQI_2
             , SDQI_3  , SDQI_4  , SDQI_5  , SDQI_6  , SDQI_7  , SDQI_8  , SDQI_9  , SDQI_9.1  , LOT.R_1
             , LOT.R_2  , LOT.R_3  , LOT.R_4  , LOT.R_5  , LOT.R_6  , LOT.R_7  , LOT.R_8  , LOT.R_9  ,
             LOT.R_10  , LS_1  , LS_2  , LS_3  , LS_4  , LS_5  )
most <- most[grep("ASCGW1|AST1|PSQUAL|ASCGW1 |SBW1 |PSF |DJT1 |Mariah |RH1 |EG", most$Dataset),]
most<-select(most, ASDQII_1  , ASDQII_2  , ASDQII_3  , ASDQII_4  , ASDQII_5  , ASDQII_6  , ASDQII_7  ,
             ASDQII_8  , ASDQII_9  , ASDQII_10  , ASDQII_11  , ASDQII_12  , ASDQII_13  , ASDQII_14  , ASDQII_15  ,
             ASDQII_16  , ASDQII_17  , ASDQII_18  , ASDQII_19  , ASDQII_20  , CPS_1  , CPS_2  , CPS_3  , CPS_4
             , CPS_5  , CPS_6  , CPS_7  , CPS_8  , CPS_9  , CPS_10  , MLQ_1  , MLQ_2  , MLQ_3  , MLQ_4
             , MLQ_5  , MLQ_6  , MLQ_7  , MLQ_8  , MLQ_9  , MLQ_10  , LET_1  , LET_2  , LET_3  , LET_4
             , LET_5  , LET_6  , PWB_1  , PWB_2  , PWB_3  , PWB_4  , PWB_5  , PWB_6  , PWB_7  , PWB_8
             , PWB_9  , APSI_1  , APSI_2  , APSI_3  , APSI_4  , APSI_5  , APSI_6  , APSI_7  , APSI_8  ,
             HAPPI.1_1  , HAPPI.2_1  , HAPPI.3_1  , HAPPI.4_1  , RES.1  , RES.2  , RES.3  , SDQI_1  , SDQI_2
             , SDQI_3  , SDQI_4  , SDQI_5  , SDQI_6  , SDQI_7  , SDQI_8  , SDQI_9  , SDQI_9.1  , LOT.R_1
             , LOT.R_2  , LOT.R_3  , LOT.R_4  , LOT.R_5  , LOT.R_6  , LOT.R_7  , LOT.R_8  , LOT.R_9  ,
             LOT.R_10  , LS_1  , LS_2  , LS_3  , LS_4  , LS_5  )
SDQIII<-select(SDQIII,  SDQIII_1  , SDQIII_2  , SDQIII_3  , SDQIII_4  , SDQIII_5  , SDQIII_6  , SDQIII_7  ,
               SDQIII_8  , SDQIII_9  , SDQIII_10)

SDQIIP<-select(SDQIIP, SDQIIP_1  , SDQIIP_2  , SDQIIP_3  , SDQIIP_4  , SDQIIP_5  , SDQIIP_6  , SDQIIP_7  ,
               SDQIIP_8)
GRIT<-select(GRIT, Dataset, GRIT_4  , GRIT_5  , GRIT_6  , GRIT_7  , GRIT_8  , GRIT_9  , GRIT_10  , GRIT_11)
GRIT <- GRIT[grep("AST1|PSQUAL", GRIT$Dataset),]
GRIT<-select(GRIT, GRIT_4  , GRIT_5  , GRIT_6  , GRIT_7  , GRIT_8  , GRIT_9  , GRIT_10  , GRIT_11)
BIG5<-select(BIG5, B5F_1  , B5F_2  , B5F_3  , B5F_4  , B5F_5  , B5F_6  , B5F_7  , B5F_8  , B5F_9
             , B5F_10  , B5F_11  , B5F_12  , B5F_13  , B5F_14  , B5F_15 )

#create function that allows cbind to do so without having all dataframs at the same lenght
cbindPad <- function(...){
  args <- list(...)
  n <- sapply(args,nrow)
  mx <- max(n)
  pad <- function(x, mx){
    if (nrow(x) < mx){
      nms <- colnames(x)
      padTemp <- matrix(NA, mx - nrow(x), ncol(x))
      colnames(padTemp) <- nms
      if (ncol(x)==0) {
        return(padTemp)
      } else {
        return(rbind(x,padTemp))
      }
    }
    else{
      return(x)
    }
  }
  rs <- lapply(args,pad,mx)
  return(do.call(cbind,rs))
}
#combine all the dtatframes into one dataframe
allsurveysT1<-cbindPad(Perma, most, SDQIII, SDQIIP, GRIT, BIG5, CPSn) 
#The first row is text and we need to get rid of it
allsurveysT1<- as.data.frame(allsurveysT1[-1,])
#Turn into managable table
allsurveysT1<-tbl_df(allsurveysT1)
allsurveysT1
#Ok but now we need to see if the items are treated as factors or numeric
str(allsurveysT1)
#The data is treated as factors so need to change to numeric
allsurveysT1<- data.frame(apply(allsurveysT1,2, as.numeric))
#Now check to see if all numeric 
str(allsurveysT1)
#Descriptive statistics
summary(allsurveysT1)
write.csv(allsurveysT1, file="allsurveysT1.csv")
allsurveysT1<-(allsurveysT1)
##load packages
library(psych)
library(GPArotation)
library(missMDA)
library(FactoMineR)

#selec only time 1


res<-PCA(allsurveys)

nb<-estim_ncpPCA(allsurveys,ncp.min=0,ncp.max=5)
nb

res.impute<-imputePCA(allsurveys, ncp=2)
res.impute$completeObs

allsurveys_WI<-res.impute$completeObs
allsurveys_WI<-tbl_df(allsurveys_WI)



##EFA
##number of factors
##parallal analysis and scree plot
?corFiml
?fa.parallel
cor_fiml <- corFiml(allsurveys_WI)
parallel<-fa.parallel(corFiml(allsurveys[]),n.obs = 1263)
parallel<-fa.parallel(allsurveys_WI)

#two factors are greater than one Eigenvalue scree plot says there are two factors. Paralel analysis suggests 4 factors
#eigenvalues (kaiser)
parallel$fa.values
#over 1=2, over .7=2
parallel<-princomp(allsurveys_WI)#doign aprincipal components analysis to see how many factors there might be using that method
summary(parallel1)
plot(parallel1)##results show at least two factors
#simple structure
twofactor<-fa( allsurveys_WI, nfactors=2, rotate="oblimin", fm="ml")
twofactor
#question 15 is loading on both. so remove 15
allsurveysWO15<-select( allsurveys,  allsurveys_1: allsurveys_14,  allsurveys_16,  allsurveys_17)
allsurveysWO15<-tbl_df( allsurveysWO15)
allsurveysWO15
twofactorWO15<-fa( allsurveysWO15, nfactors=2, rotate="oblimin", fm="ml")
twofactorWO15
#CFI, should be slightly higher than the TLI
1-((twofactor$STATISTIC - twofactor$dof)/(twofactor$null.chisq- twofactor$null.dof))
##reliability
alpha( allsurveys[,c(1,2,3,4,6,7,8,11,12,13,16,17)])
alpha( allsurveys[,c(5,9,10,14)])
#What are the factors
#Factor 1 is positive emotions
#Factor 2 is negative emotions

##Try with three factors
#simple structure
threefactor<-fa( allsurveys, nfactors=3, rotate="oblimin", fm="ml")
threefactor
#question 15 is loading on both. so remove 15
allsurveysWO15<-select( allsurveys,  allsurveys_1: allsurveys_14,  allsurveys_16,  allsurveys_17)
allsurveysWO15<-tbl_df( allsurveysWO15)
allsurveysWO15
twofactorWO15<-fa( allsurveysWO15, nfactors=2, rotate="oblimin", fm="ml")
twofactorWO15
#CFI, should be slightly higher than the TLI
1-((twofactor$STATISTIC - twofactor$dof)/(twofactor$null.chisq- twofactor$null.dof))
##reliability
alpha( allsurveys[,c(1,2,3,4,6,7,8,11,12,13,16,17)])
alpha( allsurveys[,c(5,9,10,14)])
#What are the factors
#Factor 1 is positive emotions
#Factor 2 is negative emotions



