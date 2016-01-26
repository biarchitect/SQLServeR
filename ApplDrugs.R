applDrugs<-sqlQuery(odbcChannel,SQL4,as.is=T,stringsAsFactors=F)
ad<-applDrugs
for (i in 1:21) {ad[,i]<-as.factor(applDrugs[,i])}
trans.ad<-as(ad,"transactions")
inspect(trans.ad)
itemFrequencyPlot(trans.ad,topN=10,type="absolute")
