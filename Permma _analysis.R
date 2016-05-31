library(lavaan)
library(semPlot)

#loadthedata
data <- read.csv("~/Psychometric_study_data/allsurveysT1.csv")
View(data)

#create the models
seven.model= 'Acomplishment =~ PERMA_1  + PERMA_6 + PERMA_12
              Engagement =~ PERMA_2 +  PERMA_8 + PERMA_15 
              Positive Emotion =~ PERMA_3 + PERMA_7 + PERMA_16
              Relationship =~ PERMA_4 + PERMA_11 + PERMA_13 
              Negative Emotion =~ PERMA_5 + PERMA_10 + PERMA_14
              Lonely =~ PERMA_9  
              Happy =~ PERMA_17'

one.model= seven.model= 'Acomplishment =~ PERMA_1  + PERMA_2 + PERMA_3 + PERMA_4 +  PERMA_5 + PERMA_6 + PERMA_7 + PERMA_8 + PERMA_9 + 
PERMA_10 + PERMA_11 + PERMA_12 + PERMA_13 + PERMA_14 + PERMA_15 + PERMA_16  + PERMA_17'

#run the models
seven.fit=cfa(seven.model, data=data)
one.fit=cfa(one.model, data=data)

#create pictures
semPaths(seven.fit, whatLabels = "std", layout = "tree")
semPaths(one.fit, whatLabels = "std", layout = "tree")

#summaries
summary(seven.fit, standardized = TRUE, rsquare=TRUE)
summary(one.fit, standardized = TRUE, rsquare=TRUE)

#Residual correlations
correl = residuals(seven.fit, type="cor")
correl
View(correl$cor)
correl1 = residuals(one.fit, type="cor")
correl1
View(correl1$cor)
#zscore correlation anything over 1.96 is going to be statistically significant at the .05 level 
zcorrels = residuals(seven.fit, type = "standardized")
View(zcorrels$cov)
zcorrels1 = residuals(one.fit, type = "standardized")
View(zcorrels1$cov)
#Modification indicies
modindices(seven.fit, sort. = TRUE, minimum.value = 3.84)
modindices(one.fit, sort. = TRUE, minimum.value = 3.84)
#Fit Measures
fitmeasures(seven.fit)
fitmeasures(one.fit)

