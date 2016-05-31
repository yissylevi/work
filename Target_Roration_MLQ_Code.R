library(GPArotation)
library(psych)
library(dplyr)
# data preparation
all_surveys<-read.csv("allsurveys.csv")
MLQ<-select(all_surveys, MLQ_1, MLQ_4,MLQ_5,MLQ_6,MLQ_9,MLQ_2,MLQ_3,MLQ_7,MLQ_8,MLQ_10)
MLQ<- as.data.frame(MLQ[-1,])
MLQ<- data.frame(apply(MLQ,2, as.numeric))
MLQ<-tbl_df(MLQ)
MLQ
str(MLQ)
colnames(MLQ) <- c("1","2", "3", "4", "5", "6", "7", "8", "9", "10")
MLQ<-MLQ[complete.cases(MLQ[,]),]
#Target rotation: choose "simple structure" a priori and can be applied to oblique and orthogonal rotation based on 
#what paper says facotrs should be
#MLQ
Targ_key <- make.keys(10,list(f1=1:5,f2=6:10))
Targ_key <- scrub(Targ_key,isvalue=1)  #fix the 0s, allow the NAs to be estimated
Targ_key <- list(Targ_key)
out_targetQ <- fa(MLQ,2,rotate="TargetQ",Target=Targ_key) #TargetT for orthogonal rotation
out_targetQ[c("loadings", "score.cor", "TLI", "RMSEA")]
out_targetQ
