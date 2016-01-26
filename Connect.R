# #Assumes RODBC package
# #1. Create 32 Bit (x86) SQl Server ODBC User DSN from Administrative Tools
# install.packages("RODBC")
# library(RODBC)
# install.packages("RMySQL")
# 
# 
# drv<-dbDriver("SQLSERVER")
# 
# odbcChannel <-odbcConnect("Aura_BI")
# 
# #What Tables in ODS?
# sqlTables(odbcChannel,schema="DM")
# 
# 
# #Load a Table
# srvc_call<-sqlFetch(odbcChannel,"DimDecision")
# 
# 
# 
# odbcClose(odbcChannel)

#### The following works!
#install.packages("RODBC")
library(RODBC)
#User_DSN is required. Define it via ODBC 64 bit.
#In this case AURA_BI has been defined.

odbcChannel <-odbcConnect("Aura_BI")
sqlTables(odbcChannel,schema="DM")
#List of tables is the result.
#Fetch a specific table as a data_frame
decsn<-sqlFetch(odbcChannel,"DM.DimDecision")
dim(decsn)

decsn1<-sqlFetch(odbcChannel,"DM.DimDecision",stringsAsFactors=F)
d21<-decsn1[2:16]


aura<-sqlQuery(odbcChannel,SQL4,as.is=T,stringsAsFactors=F)

dec<-sqlQuery(odbcChannel,query)
dec1<-as(dec,"transactions")
decMB<-apriori(dec1)
inspect(head(sort(decMB, by="lift"),3));




