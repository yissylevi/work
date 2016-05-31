l = list(passions, passionsNSP)
allpassions<-rbindlist(l, use.names=TRUE, fill=FALSE, idcol=NULL)
str(allpassions)
#make all lower case
allpassions$passions <-tolower(allpassions$passions)
#Remove elements in sentances that are unhelpful
allpassions$passions <- gsub("\\d","", allpassions$passions)
allpassions$passions <- gsub("[:):]","", allpassions$passions)
allpassions$passions <- gsub("[:>:]","", allpassions$passions)
allpassions$passions <- gsub("[:<:]","", allpassions$passions)
allpassions$passions <- gsub("[:!:]","", allpassions$passions)
allpassions$passions <- gsub("[/]"," ", allpassions$passions)
allpassions$passions <- gsub("[-]"," ", allpassions$passions)
allpassions$passions <- gsub("i enjoy","", allpassions$passions)
allpassions$passions <- gsub("i like to","", allpassions$passions)
allpassions$passions <- gsub("i love","", allpassions$passions)
allpassions$passions <- gsub("i love to","", allpassions$passions)
allpassions$passions <- gsub("i like","", allpassions$passions)
allpassions$passions <- gsub("[:(:]","", allpassions$passions)

View(allpassions)
#remove rows that have more than four words
allpassionslong<-allpassions[sapply(gregexpr("\\W+", allpassions$passions), length) >4,]
View(allpassionslong)
#remove rows that have four four words or less
allpassionsshort<-allpassions[sapply(gregexpr("\\W+", allpassions$passions), length) <=4,]
View(allpassionsshort)
#remove dublicates
allpassionsNoDUPS<-allpassionsshort[!duplicated(allpassionsshort[,]),]
str(allpassions1)
allpassionsDUPS<-allpassionsshort[duplicated(allpassionsshort[,]),]
View(allpassionsNoDUPS)
View(allpassionsDUPS)


write.csv(allpassionsNoDUPS, "all_passions_nsp_pn_nodups.csv")
write.csv(allpassionsDUPS, "passions_nsp_pn_DUPS.csv")


# Aspects -----------------------------------------------------------------

A = list(aspects3, aspectsNSP3, aspectlist)
allaspects<-rbindlist(A, use.names=TRUE, fill=FALSE, idcol=NULL)
str(allaspects)
View(allaspects)
#make all lower case
allaspects$aspects <-tolower(allaspects$aspects)
#Remove elements in sentances that are unhelpful
allaspects$aspects <- gsub("\\d","", allaspects$aspects)
allaspects$aspects <- gsub("[:):]","", allaspects$aspects)
allaspects$aspects <- gsub("[:>:]","", allaspects$aspects)
allaspects$aspects <- gsub("[:<:]","", allaspects$aspects)
allaspects$aspects <- gsub("[:!:]","", allaspects$aspects)
allaspects$aspects <- gsub("[/]"," ", allaspects$aspects)
allaspects$aspects <- gsub("[-]"," ", allaspects$aspects)
allaspects$aspects <- gsub("i enjoy","", allaspects$aspects)
allaspects$aspects <- gsub("i like to","", allaspects$aspects)
allaspects$aspects <- gsub("i love","", allaspects$aspects)
allaspects$aspects <- gsub("i love to","", allaspects$aspects)
allaspects$aspects <- gsub("i like","", allaspects$aspects)
allaspects$aspects <- gsub("[:(:]","", allaspects$aspects)
allaspects$aspects <- gsub("abstract","", allaspects$aspects)
allaspects$aspects <- gsub("concrete","", allaspects$aspects)


View(allaspects)
#remove rows that have more than four words
allaspectslong<-allaspects[sapply(gregexpr("\\W+", allaspects$aspects), length) >3,]
View(allaspectslong)
#remove rows that have four four words or less
allaspectsshort<-allaspects[sapply(gregexpr("\\W+", allaspects$aspects), length) <=3,]
View(allaspectsshort)
#remove dublicates
allaspectsNoDUPS<-allaspectsshort[!duplicated(allaspectsshort[,]),]
str(allaspectsNoDUPS)
allaspectsDUPS<-allaspectsshort[duplicated(allaspectsshort[,]),]
View(allaspectsNoDUPS)
View(allaspectsDUPS)

#write to csv
write.csv(allaspectsNoDUPS, "all_paspects_nsp_pn_nodups.csv")
write.csv(allaspectsDUPS, "paaspects_nsp_pn_DUPS.csv")
