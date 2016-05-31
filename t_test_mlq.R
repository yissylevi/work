#Read in Data
Reddam_T1 <- read.csv("Reddam_T1.csv")
#Select sense of purpose scale form MLQ
reddemmlq<-select(Reddam_T1, MLQ_1, MLQ_4, MLQ_5, MLQ_6, MLQ_9)
#Remove forst line that has questions in them
reddemmlq<- as.data.frame(reddemmlq[-1,])
#remove factor and change to as numeric
reddemmlq<- data.frame(apply(reddemmlq,2, as.numeric))
#Reverse code item 9
items<-c("MLQ_1", "MLQ_4", "MLQ_5", "MLQ_6", "MLQ_9")
scaleKey<-c(1 ,1,1,1,-1)
#remove the missing data
reddemmlq<-reddemmlq[complete.cases(reddemmlq[,]),]
#Add a colunm that has the mean of all MLQ
reddemmlq$meanmlq<-scoreItems(scaleKey, items=reddemmlq[,items], delete = F)$score
#Summerise
summarise(reddemmlq, MLQ_1, MLQ_4, MLQ_5, MLQ_6, MLQ_9, meanmlq)
#Create a datafram with just the mean colunm
meanreddam<-(reddemmlq$meanmlq)
#Print
meanreddam

###Do same for St Bishoy
#Read in Data
sb <- read.csv("SB_baseline.csv")
#Select sense of purpose scale form MLQ
sb<-select(SB_baseline, MLQ_1, MLQ_4, MLQ_5, MLQ_6, MLQ_9)
sb<- as.data.frame(sb[-1,])
sb<- data.frame(apply(sb,2, as.numeric))
items<-c("MLQ_1", "MLQ_4", "MLQ_5", "MLQ_6", "MLQ_9")
scaleKey<-c(1 ,1,1,1,-1)
sb<-sb[complete.cases(sb[,]),]
sb$meanmlq<-scoreItems(scaleKey, items=sb[,items], delete = F)$score
summarise(sb, MLQ_1, MLQ_4, MLQ_5, MLQ_6, MLQ_9, meanmlq)
meansb<-(sb$meanmlq)
meansb
summary(meansb)
summary(meanreddam)

#T-test
ttest<-t.test(meansb,meanreddam)
ttest
plot(ttest)

#do the sma fro searching for meaning scale
reddemmlq_s<-select(Reddam_T1, MLQ_2, MLQ_3, MLQ_7, MLQ_8, MLQ_10)
reddemmlq_s<- as.data.frame(reddemmlq_s[-1,])
reddemmlq_s<- data.frame(apply(reddemmlq_s,2, as.numeric))
reddemmlq_s<-tbl_df(reddemmlq_s)
reddemmlq_s
reddemmlq_s<-reddemmlq_s[complete.cases(reddemmlq_s[,]),]

reddemCPS_s$meanmlq<-apply(reddemmlq_s[,c("MLQ_2", "MLQ_3", "MLQ_7", "MLQ_8", "MLQ_10")], 1, mean, na.rm=T)

summarise(reddemmlq_s, MLQ_2, MLQ_3, MLQ_7, MLQ_8, MLQ_10, meanmlq)
meanreddam_s<-(reddemmlq_s$meanmlq)
meanreddam_s

sbmlq_s<-select(SB_baseline, MLQ_2, MLQ_3, MLQ_7, MLQ_8, MLQ_10)
sbmlq_s<- as.data.frame(sbmlq_s[-1,])
sbmlq_s<- data.frame(apply(sbmlq_s,2, as.numeric))
sbmlq_s<-tbl_df(sbmlq_s)
sbmlq_s
sbmlq_s<-sbmlq_s[complete.cases(sbmlq_s[,]),]

sbmlq_s$meanmlq<-apply(sbmlq_s[,c("MLQ_2", "MLQ_3", "MLQ_7", "MLQ_8", "MLQ_10")], 1, mean, na.rm=T)

summarise(sbmlq_s, MLQ_2, MLQ_3, MLQ_7, MLQ_8, MLQ_10, meanmlq)
meansb_s<-(sbmlq_s$meanmlq)
meansb_s

summary(meansb_s)
summary(meanreddam_s)
ttest_s<-t.test(meansb_s,meanreddam_s)
ttest_s
plot(ttest)