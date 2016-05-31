setwd("~/Git/stats")
data2 <- read.csv("~/Git/stats/Purpose_Surveys_Model_Farms_Wave_1_.csv", , header = T, colClasses = "character")
PERMA2<- select(data2, PERMA_M1_1:PERMA_HPY_1)
Nameetc<- select(data2, Q32,Q33.1,Q35,Q37,Q3_1)
setnames(Nameetc, c("Q32","Q33.1","Q35","Q37","Q3_1"), c("First.Name","Last.Name","Gender", "Age", "Grade"))
PERMA2<-cbind(Nameetc, PERMA2)
PERMA2 <- data.frame(Dataset = NA, PERMA2)
PERMA2[is.na(PERMA2)] <- "MFW1"
PERMA2 <- PERMA2[-1,]
View(PERMA2)

CranbrookPerma <- read.csv("~/Git/stats/Cranbook Study/Purpose_Surveys__Post__Cranbrook.csv", header = T, colClasses = "character")
CranbrookPerma1<- select(CranbrookPerma, PERMA_M1_1:PERMA_HPY_1)
CranNameetc<- select(CranbrookPerma, Q32,Q33.1,Q35,Q37,Q3_1)
setnames(CranNameetc, c("Q32","Q33.1","Q35","Q37","Q3_1"), c("First.Name","Last.Name","Gender", "Age", "Grade"))
CranbrookPerma1<-cbind(CranNameetc, CranbrookPerma1)
CranbrookPerma1 <- data.frame(Dataset = NA, CranbrookPerma1)
CranbrookPerma1[is.na(CranbrookPerma1)] <- "CRANW2"
CranbrookPerma1 <- CranbrookPerma1[-1,]
View(CranbrookPerma1)
str(CranbrookPerma1)

PERMA1 <- read.csv("~/Git/stats/PERMA_Psychometic_youth_only.csv", header = T, colClasses = "character")
setnames(PERMA1, c("Q32", "Q33"), c("First.Name", "Last.Name"))
PERMA1 <- PERMA1[-1,]

library(dplyr)
data2<-full_join(PERMA1, PERMA2)
data2<-full_join(data2, CranbrookPerma1)
View(data2)
str(data2)
data3<-lapply(data2[,7:29], as.numeric)                       
data4<-select(data2, Dataset, First.Name, Last.Name, Gender, Age, Grade)
PERMAfinal<-bind_cols(data4, data3)
View(PERMAfinal)
