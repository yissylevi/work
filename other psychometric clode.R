data2<- data.frame(apply(data[grep("^B5F.*",names(data))],2, as.numeric))
View(data2)
fa.parallel(data3[,1:15])
fa(data3[,1:15], 6,rotate="oblique")
fa(data3[,1:15],6, rotate="varimax")
data2$B5F_5_r <- 8-data2$B5F_5
data2$B5F_12_r <- 8-data2$B5F_12
data3 <- data.frame(data2[,-c(5,9,12)])
View(data3)
fa(data3[,1:15], 5,rotate="oblique")
fa(data3[,1:15],5, rotate="varimax")