setwd("~/Dropbox/Wisconsin Study")
url <- "http://www.ssc.wisc.edu/wlsresearch/data/downloads/wls-pub-13.03.stata.zip"
f <- file.path(getwd(), "wls-pub-13.03.stata.zip")
download.file(url, f, mode = "wb")
unzip("wls-pub-13.03.stata.zip")
# input Stata file
library(foreign)
wisconsin <- read.dta("wls_pub_13_03.dta")
save(wisconsin, file = "wisconsin.RData")
###from now on will load from the Rdata file
load("wisconsin.RData")
dim(wisconsin)
str(wisconsin)
library("dplyr", lib.loc="~/Library/R/3.2/library")
wisconsin<-tbl_df(wisconsin)
purpose1992Mail<-select(wisconsin, idpub, sexrsp, mn039rer, mn049rer, mn041rer, mn042rer, mn043rer, mn044rer, mn045rer)
purpose1992Phone<-select(wisconsin, )
View(purpose)
