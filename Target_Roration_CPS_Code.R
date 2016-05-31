library(GPArotation)
library(psych)
library(dplyr)
# data preparation
all_surveys<-read.csv("allsurveys.csv")
CPS<-select(all_surveys, CPS_1, CPS_2,CPS_3,CPS_4,CPS_5,CPS_6,CPS_9,CPS_10,CPS_7,CPS_8)
CPS<- as.data.frame(CPS[-1,])
CPS<- data.frame(apply(CPS,2, as.numeric))
CPS<-tbl_df(CPS)
CPS
str(CPS)
colnames(CPS) <- c("1","2", "3", "4", "5", "6", "7", "8", "9", "10")
CPS<-CPS[complete.cases(CPS[,]),]
#Target rotation: choose "simple structure" a priori and can be applied to oblique and orthogonal rotation based on 
#what paper says facotrs should be
#CPS
Targ_key <- make.keys(10,list(f1=1:5,f2=6:8,f3=9:10))
Targ_key <- scrub(Targ_key,isvalue=1)  #fix the 0s, allow the NAs to be estimated
Targ_key <- list(Targ_key)
out_targetQ <- fa(CPS,3,rotate="TargetQ",Target=Targ_key) #TargetT for orthogonal rotation
out_targetQ[c("loadings", "score.cor", "TLI", "RMSEA")]
out_targetQ

#Try in taking out 3rd factor
# data preparation
all_surveys<-read.csv("allsurveys.csv")
CPS<-select(all_surveys, CPS_1, CPS_2,CPS_3,CPS_4,CPS_5,CPS_6, CPS_7, CPS_8, CPS_9,CPS_10)
CPS<- as.data.frame(CPS[-1,])
CPS<- data.frame(apply(CPS,2, as.numeric))
CPS<-tbl_df(CPS)
CPS
str(CPS)
colnames(CPS) <- c("1","2", "3", "4", "5", "6", "7", "8", "9", "10")
CPS<-CPS[complete.cases(CPS[,]),]
#Target rotation: choose "simple structure" a priori and can be applied to oblique and orthogonal rotation based on 
#what paper says facotrs should be
#CPS
Targ_key <- make.keys(10,list(f1=2:5,f2=6:10))
Targ_key <- scrub(Targ_key,isvalue=1)  #fix the 0s, allow the NAs to be estimated
Targ_key <- list(Targ_key)
out_targetQ <- fa(CPS,2,rotate="TargetQ",Target=Targ_key) #TargetT for orthogonal rotation
out_targetQ[c("loadings", "score.cor", "TLI", "RMSEA","uniquenesses")]
out_targetQ

#Try in taking out 3rd factor
# data preparation
all_surveys<-read.csv("allsurveys.csv")
CPS<-select(all_surveys, CPS_1, CPS_2,CPS_3,CPS_4,CPS_5,CPS_6, CPS_7, CPS_8, CPS_9,CPS_10)
CPS<- as.data.frame(CPS[-1,])
CPS<- data.frame(apply(CPS,2, as.numeric))
CPS<-tbl_df(CPS)
CPS
str(CPS)
colnames(CPS) <- c("1","2", "3", "4", "5", "6", "7", "8", "9", "10")
CPS<-CPS[complete.cases(CPS[,]),]
#Target rotation: choose "simple structure" a priori and can be applied to oblique and orthogonal rotation based on 
#what paper says facotrs should be
#CPS
Targ_key <- make.keys(10,list(f1=2:5,f2=6:10))
Targ_key <- scrub(Targ_key,isvalue=1)  #fix the 0s, allow the NAs to be estimated
Targ_key <- list(Targ_key)
out_targetQ <- fa(CPS,2,rotate="TargetQ",Target=Targ_key) #TargetT for orthogonal rotation
out_targetQ[c("loadings", "score.cor", "TLI", "RMSEA","uniquenesses")]
out_targetQ

#Try in taking out 3rd factor
# data preparation
all_surveys<-read.csv("allsurveys.csv")
CPS<-select(all_surveys, CPS_2, CPS_3,CPS_4,CPS_6, CPS_8, CPS_10)
CPS<- as.data.frame(CPS[-1,])
CPS<- data.frame(apply(CPS,2, as.numeric))
CPS<-tbl_df(CPS)
CPS
str(CPS)
colnames(CPS) <- c("1","2", "3", "4", "5", "6", "7")
CPS<-CPS[complete.cases(CPS[,]),]
#Target rotation: choose "simple structure" a priori and can be applied to oblique and orthogonal rotation based on 
#what paper says facotrs should be
#CPS
Targ_key <- make.keys(6,list(f1=1:6))
Targ_key <- scrub(Targ_key,isvalue=1)  #fix the 0s, allow the NAs to be estimated
Targ_key <- list(Targ_key)
out_targetQ <- fa(CPS,1,rotate="TargetQ",Target=Targ_key) #TargetT for orthogonal rotation
out_targetQ[c("loadings", "score.cor", "TLI", "RMSEA","uniquenesses")]
out_targetQ
