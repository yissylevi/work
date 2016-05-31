getwd()
setwd("/Users/S00174626/Documents/Psychometric_study_data")
after_school_CG_W1=read.csv("After_School_control_Group_1_Wave_1.csv")
after_school_CG_W2=read.csv("After_School_control_Group_1_Wave_2.csv")
after_school_IG_W1=read.csv("After_School_Intervention_Group_1_Wave_1.csv")
after_school_IG_W2=read.csv("After_School_Intervention_Group_1_Wave_2_.csv")
SB_W1=read.csv("St_Bishoy_Wave_1.csv")
Online_Purpose_Surveys=read.csv("Purpose_Surveys.csv")
DJ_T1=read.csv("Purpose_Surveys__DJ_201415_T1.csv")
Online_Purpsoe_Surveys2=read.csv("Purpose_Surveys__Final.csv")
DJ_T2=read.csv("Purpose_Surveys__Final__DJ_Post.csv")
Mariah=read.csv("Purpose_Surveys__Pre__Mariah.csv")
Reddam_T1=read.csv("Purpose_Surveys__Pre__Reddam_House.csv")
Emily_Griffith=read.csv("EmilyGriffith_all.csv")
Cranbrook_T1=read.csv("Purpose_Surveys__Pre__Cranbrook.csv")

library(gtools)

Psychometic_Youth<-rbind.fill(after_school_CG_W1,
                         after_school_CG_W2,
                         after_school_IG_W1,
                         after_school_IG_W2,
                         SB_W1,
                         Online_Purpose_Surveys,
                         Online_Purpsoe_Surveys2,
                         DJ_T1,
                         DJ_T2,
                         Mariah,
                         Reddam_T1,
                         Emily_Griffith,
                         Cranbrook_T1)
head(Psychometic_Youth)

after_school_CG_W1<-tbl_df(after_school_CG_W1)
after_school_CG_W1
after_school_CG_W2<-tbl_df(after_school_CG_W2)
after_school_IG_W1<-tbl_df(after_school_IG_W2)
after_school_IG_W2<-tbl_df(after_school_IG_W2) 
SB_W1<-tbl_df(SB_W1) 
Online_Purpose_Surveys<-tbl_df(Online_Purpose_Surveys)
Online_Purpsoe_Surveys2<-tbl_df(Online_Purpsoe_Surveys2) 
DJ_T1<-tbl_df(DJ_T1) 
DJ_T2<-tbl_df(DJ_T2)
Mariah<-tbl_df(Mariah) 
Reddam_T1<-tbl_df(Reddam_T1) 
Emily_Griffith<-tbl_df(Emily_Griffith)
Cranbrook_T1<-tbl_df(Cranbrook_T1)

after_school_CG_W1
after_school_CG_W2
after_school_IG_W1
after_school_IG_W2
SB_W1
Online_Purpose_Surveys
Online_Purpsoe_Surveys2
DJ_T1
DJ_T2
Mariah
Reddam_T1
Emily_Griffith
Cranbrook_T1

Psychometic_Youth<-rbind(Online_Purpsoe_Surveys2, SB_T1)
Psychometic_Youth

write.csv(Psychometic_Youth, file="Psychometic_Youth_all.csv")

library(plyr)
Big5_Surveys<-select(Online_Purpose_Surveys,Dataset, Q32, Q33, Q35, Q37, Q3_1, B5F_1, B5F_2, B5F_3, B5F_4, B5F_5, B5F_6, B5F_7, B5F_8, B5F_9, B5F_10, B5F_11, B5F_12, B5F_13, B5F_14, B5F_15)
write.csv(Big5_Surveys, file="Big5_Surveys.csv")


SDQIIP_Surveys<-select(Online_Purpose_Surveys,Dataset, Q32, Q33, Q35, Q37, Q3_1, SDQIIP_1, SDQIIP_2, SDQIIP_3, SDQIIP_4, SDQIIP_5, SDQIIP_6, SDQIIP_7, SDQIIP_8)
write.csv(SDQIIP_Surveys, file="SDQIIP_Surveys.csv")

SDQII-P_1

MLQ_Bronk_Items<-select(Online_Purpose_Surveys,Dataset, Q32, Q33, Q35, Q37, Q3_1, MLQ_11, MLQ_12, MLQ_13, MLQ_14, MLQ_15, MLQ_16)
write.csv(MLQ_Bronk_Items, file="MLQ_Bronk_addition_Surveys.csv")

SDQII-P_Surveys<-select(Online_Purpose_Surveys,Dataset, Q32, Q33, Q35, Q37, Q3_1, SDQIII_1, SDQIII_2, SDQIII_3, SDQIII_4, SDQIII_5, SDQIII_6, SDQIII_7, SDQIII_8, SDQIII_9, SDQIII_10)
write.csv(SDQIII_Surveys, file="SDQIII_Surveys.csv")


SDQI_Surveys<-select(Online_Purpose_Surveys,Dataset, Q32, Q33, Q35, Q37, Q3_1, SDQI_1, SDQI_2, SDQI_3, SDQI_4, SDQI_5, SDQI_6, SDQI_7, SDQI_8, SDQI_9, SDQI_10)
write.csv(SDQI_Surveys, file="SDQI_Surveys.csv")


PERMA_1

PERMA_Surveys<-select(Online_Purpose_Surveys,Dataset, Q32, Q33, Q35, Q37, Q3_1, PERMA_1, PERMA_2, PERMA_3, PERMA_4, PERMA_5, PERMA_6, PERMA_7, PERMA_8, PERMA_9, PERMA_10, PERMA_11, PERMA_12, PERMA_13,PERMA_14, PERMA_15,PERMA_16, PERMA_17)
write.csv(PERMA_Surveys, file="PERMA_Surveys.csv")

GRIT_Surveys<-select(Online_Purpose_Surveys,Dataset, Q32, Q33, Q35, Q37, Q3_1, GRIT_4, GRIT_5, GRIT_6, GRIT_7, GRIT_8, GRIT_9, GRIT_10, GRIT_11)
write.csv(GRIT_Surveys, file="GRIT_Surveys.csv")

Adult_studies=read.csv("adult_study.csv")
ADULT_GRIT_Surveys<-select(Adult_studies, Dataset, Q32, Q33, Q35, Q37, Q3_1, GRIT4, GRIT5, GRIT6, GRIT7, GRIT8, GRIT9, GRIT10, GRIT11)
write.csv(ADULT_GRIT_Surveys, file="Adult_GRIT_Surveys.csv")

Adult_PERMA_Surveys<-select(Adult_studies,Dataset, Q32, Q33, Q35, Q37, Q3_1, PERMA1, PERMA2, PERMA3, PERMA4, PERMA5, PERMA6, PERMA7, PERMA8, PERMA9, PERMA10, PERMA11, PERMA12, PERMA13, PERMA14, PERMA15,PERMA16, PERMA17)
write.csv(Adult_PERMA_Surveys, file="Adult_PERMA_Surveys.csv")
PERMA_Surveys<-read.csv("PERMA_Surveys.csv")
Adult_PERMA_Surveys<-read.csv("Adult_PERMA_Surveys.csv")
GRIT_Psychometic<-rbind.fill(ADULT_GRIT_Surveys, GRIT_Surveys)
PERMA_Psychometic<-rbind.fill(Adult_PERMA_Surveys, PERMA_Surveys)
write.csv(PERMA_Psychometic, file="PERMA_Psychometic.csv")
ADULT_GRIT_Surveys<-read.csv("Adult_GRIT_Surveys.csv")
GRIT_Surveys<-read.csv("GRIT_Surveys.csv")
GRIT_Psychometic<-rbind.fill(ADULT_GRIT_Surveys, GRIT_Surveys)
GRIT_Psyc<-tbl_df(GRIT_Psychometic)
GRIT_Psychometic
write.csv(GRIT_Psychometic, file="GRIT_Psychometic1.csv")
                      