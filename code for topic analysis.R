#RTextTools bundles a host of functions for performing supervised learning on your data, but what about other methods like latent 
#Dirichlet allocation? With some help from the topicmodels package, we can get started with LDA in just five steps. Text in green can be 
#executed within R.

#Step 1: Install RTextTools + topicmodels
#We begin by installing and loading RTextTools and the topicmodels package into our R workspace.

install.packages(c("RTextTools","topicmodels"))
install.packages("lda")
install.packages(c("tm", "LDAvis", "syzuhet"))
library(RTextTools)
library(topicmodels)
library(lda)
setwd("/Users/S00174626/Documents/Psychometric_study_data")
#Step 2: Load the Data
surveys_text<-read.csv("surveys_text.csv")
surveys_text
data <- surveys_text[sample(1:23,size=23,replace=FALSE),]
data
#Step 3: Create a DocumentTermMatrix
#Using the create_matrix() function in RTextTools, we'll create a DocumentTermMatrix for use in the LDA() function from package topicmodels. 
#Our text data consists of the Instrument and Question columns of the survey data. We will be removing numbers, stemming words, and weighting the 
#DocumentTermMatrix by term frequency.

matrix <- create_matrix((data), language="english", stemWords=TRUE)
matrix
?weightTf

#Step 4: Perform Latent Dirichlet Allocation
#First we want to determine the number of topics in our data. In the case of the NYTimes dataset, the data have already been classified as a 
#training set for supervised learning algorithms. Therefore, we can use the unique() function to determine the number of unique topic 
#categories (k) in our data. Next, we use our matrix and this k value to generate the LDA model.

k <- length(unique(data))
lda <- LDA(matrix, k)

#Step 5: View the Results
#Last, we can view the results by most likely term per topic, or most likely topic per document.

terms(lda)
topics(lda)
?lda
lda.collapsed.gibbs.sampler(data, 4, )
data<-c("I live one day at a time and don't really think about the future",
       "I tend to focus on the present, because the future always brings me problems",
       "My daily activities often seem trivial and unimportant to me",
       "I don't have a good sense of what it is that I am trying to accomplish in my life",
       "I used to set goals for myself, but that now seems a waste of time",
       "I enjoy making plans for the future and working to make them a reality",
       "I am an active person in carrying out the plans I set for myself",
       "Some people wander aimlessly through life, but I am not one of them",
       "I sometimes feel as if I've done all there is to do in life",
       "I have a definite sense of purpose in life",
       "I have a firm sense of who I am",
       "I have a set of basic beliefs and values that guide my actions and decisions",
       "I know what I want out of life",
       "I have a clear set of personal values or moral standards",
       "I don't know where I fit in the world",
       "I have specific personal goals for the future",
       "I have a clear sense of who I want to be when I am an adult",
       "There is not enough purpose in my life",
       "To me, the things I do are all worthwhile",
       "Most of what I do seems trivial and unimportant to me",
       "I value my activities a lot",
       "I don't care very much about the things I do",
       "I have lots of reasons for living")
corpus <- lexicalize(data, lower=TRUE)
corpus
to.keep <- corpus$vocab[word.counts(corpus$documents, corpus$vocab) >= 2]
documents <- lexicalize(data, lower=TRUE, vocab=to.keep)
documents
lda.collapsed.gibbs.sampler(documents, 10, vocab=to.keep, num.iterations=1, alpha=2,
                            eta, initial = NULL, burnin = NULL, compute.log.likelihood = FALSE,
                            trace = 0L, freeze.topics = FALSE)