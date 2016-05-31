allsurveysYT1
all_surveys<-read.csv("allsurveysYT1.csv")
ADSQII=select(all_surveys, ASDQII_1, ASDQII_2, ASDQII_3, ASDQII_4, ASDQII_5, ASDQII_6, ASDQII_7, ASDQII_8,   ASDQII_9, ASDQII_10, ASDQII_11, ASDQII_12, ASDQII_13, ASDQII_14, ASDQII_15, ASDQII_16, ASDQII_17, ASDQII_18, ASDQII_19, ASDQII_20)
parallel<-fa.parallel(ADSQII, fm="ml",fa="fa")
fourfactor<-fa(ADSQII, nfactors=4, rotate="oblimin", fm="ml")
fourfactor


```

Target Rotation

```{r, echo=FALSE}
colnames(ASDQII) <- c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20")
#Target rotation: choose "simple structure" a priori and can be applied to oblique and orthogonal rotation based on 
#what paper says facotrs should be RES
Targ_key <- make.keys(20,list(f1=1:5,f2=6:10,f3=11:15,f4=16:20))
Targ_key <- scrub(Targ_key,isvalue=1)  #fix the 0s, allow the NAs to be estimated
Targ_key <- list(Targ_key)
RES_cor <- corFiml(ASDQII) # convert the raw data to correlation matrix uisng FIML
out_targetQ <- fa(RES_cor,4,rotate="TargetQ",n.obs = 1160,Target=Targ_key) #TargetT for orthogonal rotation
out_targetQ[c("loadings", "score.cor", "TLI", "RMSEA")]
out_targetQ
#The best fit to the data seems to be three factors. F1: questions 1,3,5,6. f2: 8,7,4. f3: 2,9
```
CFI
```{r}
1-((out_targetQ$STATISTIC - out_targetQ$dof)/(out_targetQ$null.chisq- out_targetQ$null.dof))
```

