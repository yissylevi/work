#setting a parameters of Bi(n, p)
n <- 1000
p <- 0.4

#dataframe
df <- data.frame(bi = rbinom(n, 1, p)  ,count = 0, mean = 0)
ifelse(df$bi[1] == 1, df[1, 2:3] <- 1, 0)
for (i in 2 : n){
  df$count[i] <- ifelse(df$bi[i] == 1, df$count[i]<-df$count[i - 1]+1, df$count[i - 1])
  df$mean[i] <- df$count[i] / i
}

#graph
plot(df$mean, type='l',
     main = "Simulation of the Low of Large Numbers",
     xlab="Numbers", ylab="Sample mean")
abline(h = p, col="red")
#########
n.draws <- 1200
means <- rep(NA, n.draws) ## containers for the mean
sds <- rep(NA, n.draws) ## and standard deviation
## Begin by generating n.draws from the normal distribution
## See how the mean and standard deviation changes as
## we inlcude more of the draws
x <- rnorm(n=n.draws, mean=1, sd=3)

## simulation
for (i in 1:n.draws){
    means[i] <- mean(x[1:i]) ## mean of the first i draws
    sds[i] <- sd(x[1:i]) ## standard deviation of the first i draws
}

flips <- sample(c(0,1), 10, replace = TRUE, prob = c(0.5, 0.5))
## Plot the results
hist(flips, xlab="Number of Flips", main="Law of Large Numbers",
          col="blue", ylab="Mean and Standard Deviation", xlim=c(0, 1))
flips<-as.data.frame(flips)
flips$flips[flips$flips==1] <- 2
flips$flips[flips$flips==0] <- 1


require(ggplot2)
ggplot(flips, aes(x=flips)) +
  geom_histogram(binwidth=.6, colour="black", fill="Orange") +
   ggtitle("Law of Large Numbers") +
  xlab("Coin Outcomes") +
  ylab("Number of Times the Coin was Flipped") +
  scale_x_discrete(limits=c("Heads", "Tails")) +
  geom_vline(aes(xintercept=mean(flips, na.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)


G =  ggplot(flips, aes(x=flips)) +
  geom_bar(colour="black", fill=topo.colors(n=2)) +
  ggtitle("Law of Large Numbers Demonstration Histogram") +
  xlab("Coin Flip Outcomes") +
  ylab("Number of Times the Coin was Flipped") +
  scale_x_discrete(limits=c("Heads", "Tails")) +
  geom_vline(aes(xintercept=mean(flips, na.rm=F)),
             color="red", linetype="dashed", size=.5)
G




ggplot(flips, aes(x=flips)) + geom_histogram(binwidth=.5)

ggplot(flips, aes(x=rating)) + 
  geom_histogram(aes(y=..density..),      # Histogram with density instead of count on y-axis
                 binwidth=.5,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666")  # Overlay with transparent density plot
  
  