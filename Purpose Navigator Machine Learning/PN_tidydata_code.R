#load data
library(dplyr)
data <- read.csv("/Users/levibrackman/Documents/stats_march_2016/Purpose Navigator Machine Learning/PN Section 2 data of students.csv")
data<-tbl_df(data)
data
#remove first four colunms
data <- subset(data, select = -c(First.Name, Last.Name, Email, X2.0) )
View(data)
library(data.table)
#show all the veriable (colunm) names (dput) without quotes (noquote)
noquote(dput(colnames(data)))
#cSplit(data, X2.0.1, ",")
install.packages("splitstackshape")
library(splitstackshape)
#rename the veriables
data <- rename(data, Passions_1  =  X2.0.1,  Passions_2 = X2.0.2, Passions_3 = X2.0.3, 
                Passions_4 = X2.0.4, Passions_5 = X2.0.5, Passions_6 = X2.0.6, Passions_7 = X2.0.7, 
               Passions_8 = X2.0.8, Passions_9 = X2.0.9, Passions_10 = X2.0.10, Passions_11 = X2.0.11, 
               Passions_12 = X2.0.12, Passions_13 = X2.0.13, Passions_14 = X2.0.14, aspects_1 = X2.2,
               aspects_2 = X2.3,aspects_3 =  X2.4)
#show all the veriable (colunm) names (dput) without quotes (noquote)
noquote(dput(colnames(data)))
#create a passion dataset
passions<-select(data, Passions_1,  Passions_2,  Passions_3,  Passions_4,  Passions_5,  Passions_6,  Passions_7, 
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
passions<-passions1 %>% gather(Passions, na.rm = FALSE, convert = FALSE)
str(passions)
#Just want the value colunm
passions<-select(passions, value)
#rename the value colunm
passions <- rename(passions, Passions = value)
#Remove NA
passions<-passions[complete.cases(passions),]
passions<-as.data.frame(passions)
View(passions)
library(data.table)
aspects<-select(data, aspects_1,  aspects_2,   aspects_3)


# Aspects -----------------------------------------------------------------

aspects<-select(data, aspects_1,  aspects_2,   aspects_3)
aspects1<-cSplit(aspects, c("aspects_1", "aspects_2", "aspects_3"), ",")
View(aspects1)
aspects2<-aspects1 %>% gather(aspects1, na.rm = FALSE, convert = FALSE)
View(aspects2)
str(aspects2)
#Just want the value colunm
aspects3<-select(aspects2, value)

#rename the value colunm
aspects3 <- rename(aspects3, aspects = value)
#Remove NA
aspects3<-aspects3[complete.cases(aspects3),]
str(aspects3)
aspects3<-as.data.frame(aspects3)
View(aspects3)
aspects3 <- rename(aspects3, aspects = aspects3)
