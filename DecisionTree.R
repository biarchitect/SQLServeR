##Decision Trees Library

library(rpart)
##DecisionTree much nicer Tree print
library(rpart.plot)





###With Drugs
dec3<-sqlQuery(odbcChannel,SQL3)
dec3A<-dec3[,c(-4,-7,-8,-9)]
fit3A<-rpart(Decision~.,data=dec3A)
prp(fit3A,extra=2,under=T,nn=T,varlen=25)
dec3B<-dec3A[!(dec3A$CategoryCode %in% c("ARR_DNO","IDR_DNO")),  ]
fit3B<-rpart(Decision~.,data=dec3B)
