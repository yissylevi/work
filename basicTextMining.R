#### Required Packages ####
install.packages(c("xlsx", "tm", "RTextTools", "topicmodels", "slam", "wordcloud", "wesanderson"))
library(xlsx) #for reading in excel data
library(tm) # for creating corpus and cleaning
library(RTextTools) # for LDA analysisi
library(topicmodels) # Also LDA
library(slam) # Create cosine DISTANCE matrix
library(wordcloud) # make pretty pictures!
library(wesanderson)# get pretty colours


####NOTES####
#1. Assumes that you have a data.frame in which one or more of the variables are
#	qualitative resposes 
#2. Assumes data is spell checked but see comments on how to handle if it it not.

#### Data Preperation ####
#--------------------------------------------------------------------------
#Read in the data: Change this to where you saved the excel file!!!!!!!!!!!
#--------------------------------------------------------------------------
setwd("/Users/S00174626/Documents/Psychometric_study_data")
stemData <- read.csv("surveys_text.csv")
#Pick which qualitative question you want to work with
whyStem <- stemData[,]
#Keep a list of cases of who responded
#responders <- stemData[grep("[[:blank:]]", whyStem), ]
#Remove all the cases that didn't respond
#whyStem <- grep("[[:blank:]]", whyStem, value=TRUE)

#### Corpus Creation and Cleaning ####
# Text mining in R requires text to be in a doc structure called a Corpus
# The following coverts the data into this form.
myCorpus <- Corpus(VectorSource(whyStem))
#Coverts every word to lower case
myCorpus <- tm_map(myCorpus, content_transformer(tolower))
# Get rid of all the puctuation
myCorpus <- tm_map(myCorpus, content_transformer(removePunctuation))
#Get rid of all numbers
myCorpus <- tm_map(myCorpus, content_transformer(removeNumbers))
#Remove all boring words from the text (e.g., and, is, to, etc.)
myCorpus <- tm_map(myCorpus, removeWords, stopwords("english"))
# Looks like whoever inputted the data was kind enough to spell check the responses
# but in case you come across mispelt words. See:
# http://housesofstones.github.io/2012/09/13/automatic-cleaning-of-messy-text-data/
writeCorpus(myCorpus,path = "/Users/S00174626/Documents/Psychometric_study_data")
#This is how we look at the corpus
inspect(myCorpus[])

#When we want to cluster/do analysis by word use:
myDtm <- DocumentTermMatrix(myCorpus)
#When you want to cluster/do analysis by person use:
myDtm2 <- TermDocumentMatrix(myCorpus)

####Find similar people####
#This gives the inverse of the so-called cosine similarity matrix
#Values of 0 mean two people's responses are IDENTICAL
#Values of 1 mean they are completely different
#In this example case person 9 and 3 are pretty similar
cosine_dist_mat <- 1 - crossprod_simple_triplet_matrix(myDtm2)/(sqrt(col_sums(myDtm2^2) %*% t(col_sums(myDtm2^2))))
#So here are two people who are similar
cosine_dist_mat[10, 8]
#And here is what they said
inspect(myCorpus[])
## Eventually we will do a k-means of similar analysis on this to find cluster 
#	of likeminded individuals

#### Find patterns in the words ####
#What are the most frequent words
findFreqTerms(myDtm, lowfreq=3)
#What words frequently co-occur with career (correlation of at least .3)
findAssocs(myDtm, "life",.3)

#Create a word cloud based on term frequency
m = as.matrix(myDtm)#Get the data
v = sort(colSums(m), decreasing=TRUE)#get word frequency
myNames = names(v) # get words
d = data.frame(word=myNames, freq=v) #put into data.frame
wordcloud(d$word, d$freq, min.freq=3,
		  colors = wes_palette("GrandBudapest"))#draw pretty picture

#This is like a exploratory factor analysis but of words
#How many factors you want to extract
k <- 4
#Run the analysis
lda <- LDA(myDtm, k)
#Get the 10 highest loading terms
# Figure out how to intepret what the hell the topics mean
terms(lda, 4)
#Now get all words and which word most likely loads onto which topic
topics(lda)



#### More complicated example using different sampling methods
k <- 4
SEED <- 1234
my_TM <-
	list(VEM = LDA(myDtm, k = k, control = list(seed = SEED)),
		 VEM_fixed = LDA(myDtm, k = k,
		 				control = list(estimate.alpha = FALSE, seed = SEED)),
		 Gibbs = LDA(myDtm, k = k, method = "Gibbs",
		 			control = list(seed = SEED, burnin = 1000,
		 						   thin = 100, iter = 1000)),
		 CTM = CTM(myDtm, k = k,
		 		  control = list(seed = SEED,
		 		  			   var = list(tol = 10^-4), em = list(tol = 10^-3))));

Topic = topics(my_TM[["CTM"]], 1);

#top 5 terms for each topic in LDA
Terms <- terms(my_TM[["CTM"]], 2);
Terms
# Which topic does each word load most highly on
my_topics <-topics(my_TM[["Gibbs"]])
my_topics
