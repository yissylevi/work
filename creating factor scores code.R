#Load dataset
data <- read.csv("~/Psychometric_study_data/allsurveysYT1.csv")
#select scale
#data<-select(data, LS_1, LS_2, LS_3,  LS_4,  LS_5)
data <-tbl_df(data)
#Create scale scores for each scale
data %>% mutate( LS_mean = rowMeans(cbind(LS_1, LS_2, LS_3,  LS_4,  LS_5)),
                 RES_mean = rowMeans(cbind(RES.1, RES.2, RES.3))) %>%
        select(LS_mean, OS_mean)-> data_mean
#Create corolation table
cor(data$LS_means, data$LOT_mean)
cor(data_mean, use = "complete.obs")
