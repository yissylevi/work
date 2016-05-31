#load NSP
library(dplyr)
NSP <- read.csv("/Users/levibrackman/Documents/stats_march_2016/Purpose Navigator Machine Learning/NSP Section 2 data of users.csv")
NSP<-tbl_df(NSP)
NSP
#remove first four colunms
NSP <- subset(NSP, select = -c(First.Name, Last.Name, Email, X1.0) )
View(NSP)
library(data.table)
#show all the veriable (colunm) names (dput) without quotes (noquote)
noquote(dput(colnames(NSP)))
#cSplit(NSP, X2.0.1, ",")
install.packages("splitstackshape")
library(splitstackshape)
#rename the veriables
NSP <- rename(NSP, Passions_1  =  X1.0.1,  Passions_2 = X1.0.2, Passions_3 = X1.0.3, 
               Passions_4 = X1.0.4, Passions_5 = X1.0.5, Passions_6 = X1.0.6, Passions_7 = X1.0.7, 
               Passions_8 = X1.0.8, Passions_9 = X1.0.9, Passions_10 = X1.0.10, Passions_11 = X1.0.11, 
               Passions_12 = X1.0.12, Passions_13 = X1.0.13, Passions_14 = X1.0.14, aspects_1 = X1.2,
               aspects_2 = X1.3,aspects_3 =  X1.4)
#show all the veriable (colunm) names (dput) without quotes (noquote)
noquote(dput(colnames(NSP)))
#create a passion NSPset
passions<-select(NSP, Passions_1,  Passions_2,  Passions_3,  Passions_4,  Passions_5,  Passions_6,  Passions_7, 
                 Passions_8,  Passions_9,  Passions_10, Passions_11, Passions_12, Passions_13, Passions_14)
View(passions)
#Use cSplit to seperate each passion in each colunm into seperate colunms 
#that are seperated by a comma
passions1<-cSplit(passions, c("Passions_1", "Passions_2", "Passions_3", "Passions_4", "Passions_5", 
                              "Passions_6", "Passions_7", "Passions_8", "Passions_9", "Passions_10", 
                              "Passions_11", "Passions_12", "Passions_13", "Passions_14"), ",")
View(passions1)
dput(colnames(passions1))
library(tidyr)
#Change from wide to long
passionsNSP<-passions1 %>% gather(Passions, na.rm = FALSE, convert = FALSE)
str(passionsNSP)
#Just want the value colunm
passionsNSP<-select(passionsNSP, value)
#rename the value colunm
passionsNSP <- rename(passionsNSP, Passions = value)
#Remove NA
passionsNSP<-passionsNSP[complete.cases(passionsNSP),]
passionsNSP<-as.data.frame(passionsNSP)
passionsNSP <- rename(passionsNSP, passions = Passions)
View(passionsNSP)
library(NSP.table)

# Aspects -----------------------------------------------------------------

aspectsNSP<-select(NSP, aspects_1,  aspects_2,   aspects_3)
aspectsNSP1<-cSplit(aspectsNSP, c("aspects_1", "aspects_2", "aspects_3"), ",")
View(aspectsNSP1)
aspectsNSP2<-aspectsNSP1 %>% gather(aspectsNSP1, na.rm = FALSE, convert = FALSE)
View(aspectsNSP2)
str(aspectsv2)
#Just want the value colunm
aspectsNSP3<-select(aspectsNSP2, value)

#rename the value colunm
aspectsNSP3 <- rename(aspectsNSP3, aspects = value)
#Remove NA
aspectsNSP3<-aspectsNSP3[complete.cases(aspectsNSP3),]
str(aspects3)
aspectsNSP3<-as.data.frame(aspectsNSP3)
View(aspectsNSP3)
aspectsNSP3 <- rename(aspectsNSP3, aspects = aspectsNSP3)
