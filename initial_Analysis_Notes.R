library(psych)
library(GPArotation)
library(lavaan)
?GPArotation
setwd("/Users/levibrackman/Desktop/R")
#First we will just load the data that just has your CPS scale
data <- read.csv("GRIT_Psychometic.csv")
data1<-select(data, 8:15)
data1<-tbl_df(data1)
data1
#The first row is text and we need to get rid of it
data<- as.data.frame(data[-1,])
#Ok but now we need to see if the items are treated as factors or numeric
str(data1)
#The data is treated as factors so need to change to numeric
data2<- data.frame(apply(data1,2, as.numeric))
#Now check to see if 
str(data2)#It works so we are good
summary(data2)#Descriptive statistics
cor(data2)
data2<-data2[complete.cases(data2),]#removes NA and incomplete cases
#Now for factor analysis
#One factor - extraction
fa(data2, 2)#The results suggest this is a poor fit to the data
#Two factor - extraction
fa(data2, 2)#Results negatively worded items are no good
#so lets drop the negatively worded items
dataPos <- data.frame(data2[,-c(1,9)])
#Ok redo factor analysis without negatively worded items
#One Factor
fa(dataPos, 1)#does not work
#Two Factors
fa(dataPos, 2, rotate="varimax")#Does work suggests a clear student and clear teacher scale

dataPosStudent <- data.frame(data2[,-c(1,5,6,7,9)])
fa(dataPosStudent, 1, rotate="varimax")
#Now to check Reliability
#Student scale
glb(dataPos[, c(1:3, 7:8)])
#teacher scale
glb(dataPos[,4:6])
#Creat scale scores which are an average of the items
#Scale scores
dataPos$studentPurpose <- rowMeans(dataPos[, c(1:3, 7:8)])
dataPos$teacherPurpose <- rowMeans(dataPos[, 4:6])
#Summary statistics of those scale scores
describe(dataPos[,9:10])
#pretty graphs
hist(dataPos$studentPurpose)
hist(dataPos$teacherPurpose)
plot(dataPos[,9:10])
cor(dataPos[,9:10])
#clear-up and remove everything
rm(list=ls(all=TRUE))
#-------------------------------------------------------##
#Enter in the full data set
#------------------------------------------------------##
#read in the full dataset
setwd("/Users/levibrackman/Desktop/R")
data <- read.csv("Purpose_Surveys 9.csv")
#Drop the first 10 cases and the initial text case
data<- as.data.frame(data[-c(1:26),])
#This next bit is complicated as it is a mixture of R and a language called regular expressions so ignore BUT
#what I am doing is just extracting your scale items plus the meaning/purpose ones
data2<- data.frame(apply(data[grep("^CPS.*|^MLQ.*",names(data))],2, as.numeric))
#Factor analysis on JUST the MLQ
data2$MLQ_9_r <- 8-data2$MLQ_9
fa(data2[,11:20], 1,rotate="varimax")#Ok clearly not one scale
fa.parallel(data2[,11:20])#special graph to decide how many factors needed suggests between 3 and 4
fa(data2[,11:20], 2,rotate="varimax")#Three suggested by program but really only looks like two meaningful ones and one kind of shady one
#Ok now we have a got meaning scale. How does it work with your CPS scale.
#the list in the c() is just getting the items we want. i.e. one meaning factor and your scale minus the two negatively worded items
fa(data2[,c(2:8, 10, 12,13,17,18,20)],3)#works really well.
fa(data2[,c(2:8, 10, 12,13,17,18,20)],1)#works really well.
??key
View(data2)

#####Using Lavaan#####
library(lavaan)
GRIT.model <- ' GRIT_4  =~ GRIT_5 + GRIT_6 + GRIT_7 + GRIT_8 + GRIT_9 + GRIT_10 + GRIT_11'
fit <- cfa(GRIT.model, data = data2)
summary(fit, fit.measures = TRUE)

fa2<-factanal(data2, factor=1)
fa2


fa1<-factanal(data2, factor=4)
fa1

library(FactoMineR)
?MFA
FA<-MFA(data2)

data3<-princomp(data2)
summary(data3)
plot(data3)     
