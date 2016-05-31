#combine ModelFarms with other psychometric youth data
setwd("/Users/levibrackman/Git/stats")
Model<-read.csv("Purpose_Surveys_Model_Farms_for_Psyc.csv")
All<-read.csv("allsurveysYT1.csv")
all_surveys<-full_join(Model, All)
View(all_surveys)
write.csv(all_surveys, "allsurveysYT1_Jan2016.csv")
