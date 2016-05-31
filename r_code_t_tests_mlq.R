Reddam_T1
reddemmlq<-select(Reddam_T1, MLQ_1, MLQ_4, MLQ_5, MLQ_6, MLQ_9)
reddemmlq<- as.data.frame(reddemmlq[-1,])
reddemmlq<- data.frame(apply(reddemmlq,2, as.numeric))
items<-c("MLQ_1", "MLQ_4", "MLQ_5", "MLQ_6", "MLQ_9")
scaleKey<-c(1 ,1,1,1,-1)
reddemmlq<-reddemmlq[complete.cases(reddemmlq[,]),]
reddemmlq$meanmlq<-scoreItems(scaleKey, items=reddemmlq[,items], delete = F)$score
summarise(reddemmlq, MLQ_1, MLQ_4, MLQ_5, MLQ_6, MLQ_9, meanmlq)
meanreddam<-(reddemmlq$meanmlq)
meanreddam

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
ttest<-t.test(meansb,meanreddam)
ttest
plot(ttest)

#searching for meaning
reddemmlq_s<-select(Reddam_T1, MLQ_2, MLQ_3, MLQ_7, MLQ_8, MLQ_10)
reddemmlq_s<- as.data.frame(reddemmlq_s[-1,])
reddemmlq_s<- data.frame(apply(reddemmlq_s,2, as.numeric))
reddemmlq_s<-tbl_df(reddemmlq_s)
reddemmlq_s
reddemmlq_s<-reddemmlq_s[complete.cases(reddemmlq_s[,]),]

reddemmlq_s$meanmlq<-apply(reddemmlq_s[,c("MLQ_2", "MLQ_3", "MLQ_7", "MLQ_8", "MLQ_10")], 1, mean, na.rm=T)

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