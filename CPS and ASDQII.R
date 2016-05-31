#read in the full dataset
setwd("/Users/levibrackman/Google Drive/R")
data <- read.csv("Purpose_Surveys 9.csv")
#Drop the first 26 cases and the initial text case
data<- as.data.frame(data[-c(1:25),])
#This next bit is complicated as it is a mixture of R and a language called regular expressions so ignore BUT
#what I am doing is just extracting your scale items plus the meaning/purpose ones


View(data2)
#Factor analysis on JUST the ASDQII
fa(data2[,1:20], 1,rotate="varimax")#Ok clearly not one scale
fa.parallel(data2[,1:20])#special graph to decide how many factors needed suggests between 3 and 4
#with 2 factors
fa(data2[,c(1:20)],2, rotate="varimax")
fa(data2[,1:20], 4,rotate="varimax")
#just doing the last five "SCHOOL SBJECTS as a factor on its own
fa(data2[,16:20], 1,rotate="varimax")
How does it work with your CPS scale.
#the list in the c() is just getting the items we want. i.e. one meaning factor and your scale minus the two negatively worded items
fa(data2[,c(2:8, 10, 12,13,17,18,20)],3)#works really well.
fa(data2[,c(2:8, 10, 12,13,17,18,20)],1)#works really well.
?varimax
glb(data2[,c(1:20)])
?glb
#Looking at CPS and ASDQII together
data3<- data.frame(apply(data[grep("^CPS.*|^ASDQII.*",names(data))],2, as.numeric))
View(data3)
fa(data3[,c(1:20, 22:28,)],6,rotate="varimax")
#Looking at CPS on its own
fa(data3[,c(22:24,28, 30)],1,rotate="varimax")
fa(data3[,c(25,26,27)],1,rotate="varimax")
#Reliability student
glb(data3[,c(22:24,28, 30)])
#Reliability teacher
glb(data3[,c(25,26,27)])
#Reverse coding the negative items on CPS
data3$CPS_1_R <- 9- data3$CPS_1;
data3$CPS_9_R <- 9- data3$CPS_9;

Nsingle = 23
single=c()
while (sum(single)!=Nsingle/2){
  single=sample(0:1, Nsingle, replace=TRUE)
}
#Number of couples
Ncoup = 23
couple=c()
while (sum(couple)!=Ncoup/2){
  couple=sample(0:1, Ncoup, replace=TRUE)
}
Ncoup
couple
single
