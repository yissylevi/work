#Resilience questions taken from Herb's PERMA questions
data$T1RES <- apply(data[, c("RES1.x",  "RES2.x", "RES3.x")], 1, mean, na.rm = TRUE)
data$T2RES <- apply(data[, c("RES1.y",  "RES2.y", "RES3.y")], 1, mean, na.rm = TRUE)

plot(data$T1RES, data$T2RES, ylab = "Pre", xlab = "Post", main = "Resilience")
# pre test plots
bwplot(GROUP.x ~ T1RES, ylab = "GROUP", xlab = "RES", main = "Pre test", 
       data = data)
# post test plots
bwplot(GROUP.x ~ T2RES, ylab = "Group", xlab = "RES", main = "Post test", 
       data = data)
# Pre test
t.test(T1RES ~ GROUP.x, data = data)
t.test(T2RES ~ GROUP.x, data = data)
# Ancova, Model for LET
RES_ANCOVA <- lm(T2RES ~ as.factor(GROUP.x) + T1RES, data = data)
# check assumptions visually
plot(RES_ANCOVA)
# see results
summary(RES_ANCOVA)

