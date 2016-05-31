#read in
aspectlist<- read.csv("/Users/levibrackman/Documents/stats_march_2016/Purpose Navigator Machine Learning/aspects_from_list.csv", 
                      header = F, na.strings=c(""," ","NA"))
#remove the a, b, c etc from before aspects
aspectlist$V1 <- gsub("^[a-z]",	"", aspectlist$V1)
#remove numbers from before aspects
aspectlist$V1 <- gsub("^[0-9]",	"", aspectlist$V1)
#remove periods
aspectlist$V1 <- gsub("^[:.:]", "", aspectlist$V1)
#removespaces
aspectlist$V1 <- gsub("\\s", "", aspectlist$V1)

View(aspectlist)
#select only one colunm
aspectlist<-select(aspectlist, V1)
#remove empty rows
aspectlist<-aspectlist[complete.cases(aspectlist),]
#remake as dataframe
aspectlist<-as.data.frame(aspectlist)
#rename colunm, to fit in with the other dataframs
aspectlist<-rename(aspectlist, aspects = aspectlist)
str(aspectlist)
#write CSV
write.csv(aspectlist, "AspectList.csv")
