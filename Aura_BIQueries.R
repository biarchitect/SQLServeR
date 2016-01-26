
### - DecisionTreee SQL.

SQL<-"SELECT DISTINCT Decision
, d.MaxSeverityCD
,a.GndrCD 
,bd.AGE_BAND_NM
,drg.DrugClass
--,rle.CategoryCode+'-'+rle.RuleNbr Rle
,rle.CategoryCode [Rule]
from [DM].[DimDecision] d
INNER JOIN [DM].[FctResponse] r
ON d.DecisionID = r.DecisionID
INNER JOIN [DM].[DimApplicant] a
ON a.ApplID = r.ApplID
INNER JOIN [dbo].[AGE_BAND_DEF] bd
ON a.Age BETWEEN [AGE_BAND_STRT_NBR] AND [AGE_BAND_END_NBR]
AND [AGE_BAND_GRP_NM] = 'Standard'
INNER JOIN [DM].[DimApplDrug] ad
ON r.RespID = ad.RespID
INNER JOIN [DM].[DimDrug] drg
ON ad.DrugID = drg.DrugID
INNER JOIN [DM].[DimApplRule] ar
ON r.RespID = ar.RespID
INNER JOIN [DM].[DimRule] rle
ON ar.RuleID = rle.RuleID"

#### Severity Code SQL.
SQL1<-"SELECT [Decision]
,d.MaxSeverityCD
,CASE WHEN d.Severity_0 = 1 THEN 'Y' ELSE 'N' END AS Severity_0
,CASE WHEN d.Severity_1 = 1 THEN 'Y' ELSE 'N' END AS Severity_1
,CASE WHEN d.Severity_1N = 1 THEN 'Y' ELSE 'N' END AS Severity_1N
,CASE WHEN d.Severity_2 = 1  THEN 'Y' ELSE 'N' END AS Severity_2
,CASE WHEN d.Severity_3 = 1 THEN 'Y' ELSE 'N' END AS Severity_3
,CASE WHEN d.Severity_4 = 1 THEN 'Y' ELSE 'N' END AS Severity_4
,CASE WHEN d.Severity_5 = 1 THEN 'Y' ELSE 'N' END AS Severity_5
,CASE WHEN d.Severity_6 = 1 THEN 'Y' ELSE 'N' END AS Severity_6
,CASE WHEN d.Severity_7 = 1 THEN 'Y' ELSE 'N' END AS Severity_7
,CASE WHEN d.Severity_8 = 1 THEN 'Y' ELSE 'N' END AS Severity_8
,CASE WHEN d.Severity_9 = 1 THEN 'Y' ELSE 'N' END AS Severity_9
,CASE WHEN d.Severity_10 = 1 THEN 'Y' ELSE 'N' END AS Severity_10
FROM DM.DimDecision d"

####Decision Applicant SQL 

SQL2<-"SELECT [Decision]
,b.AGE_BAND_NM
,a.GndrCD
,d.MaxSeverityCD
,CASE WHEN d.Severity_0 = 1 THEN 'Y' ELSE 'N' END AS Severity_0
,CASE WHEN d.Severity_1 = 1 THEN 'Y' ELSE 'N' END AS Severity_1
,CASE WHEN d.Severity_1N = 1 THEN 'Y' ELSE 'N' END AS Severity_1N
,CASE WHEN d.Severity_2 = 1  THEN 'Y' ELSE 'N' END AS Severity_2
,CASE WHEN d.Severity_3 = 1 THEN 'Y' ELSE 'N' END AS Severity_3
,CASE WHEN d.Severity_4 = 1 THEN 'Y' ELSE 'N' END AS Severity_4
,CASE WHEN d.Severity_5 = 1 THEN 'Y' ELSE 'N' END AS Severity_5
,CASE WHEN d.Severity_6 = 1 THEN 'Y' ELSE 'N' END AS Severity_6
,CASE WHEN d.Severity_7 = 1 THEN 'Y' ELSE 'N' END AS Severity_7
,CASE WHEN d.Severity_8 = 1 THEN 'Y' ELSE 'N' END AS Severity_8
,CASE WHEN d.Severity_9 = 1 THEN 'Y' ELSE 'N' END AS Severity_9
,CASE WHEN d.Severity_10 = 1 THEN 'Y' ELSE 'N' END AS Severity_10
FROM DM.DimDecision d 
INNER JOIN [DM].[FctResponse] f  ON d.DecisionID = f.DecisionID 
INNER JOIN [DM].[DimApplicant] a ON a.ApplID = f.ApplID
INNER JOIN dbo.AGE_BAND_DEF b ON a.Age BETWEEN b.AGE_BAND_STRT_NBR AND b.AGE_BAND_END_NBR
WHERE b.AGE_BAND_GRP_NM = 'Standard'"

SQL3<-"SELECT DISTINCT [Decision]
,b.AGE_BAND_NM
,a.GndrCD
,d.MaxSeverityCD
,r.CategoryCode
,drg.DrugCategory
,CASE WHEN d.Severity_0 = 1 THEN 'Y' ELSE 'N' END AS Severity_0
,CASE WHEN d.Severity_1 = 1 THEN 'Y' ELSE 'N' END AS Severity_1
,CASE WHEN d.Severity_1N = 1 THEN 'Y' ELSE 'N' END AS Severity_1N
,CASE WHEN d.Severity_2 = 1  THEN 'Y' ELSE 'N' END AS Severity_2
,CASE WHEN d.Severity_3 = 1 THEN 'Y' ELSE 'N' END AS Severity_3
,CASE WHEN d.Severity_4 = 1 THEN 'Y' ELSE 'N' END AS Severity_4
,CASE WHEN d.Severity_5 = 1 THEN 'Y' ELSE 'N' END AS Severity_5
,CASE WHEN d.Severity_6 = 1 THEN 'Y' ELSE 'N' END AS Severity_6
,CASE WHEN d.Severity_7 = 1 THEN 'Y' ELSE 'N' END AS Severity_7
,CASE WHEN d.Severity_8 = 1 THEN 'Y' ELSE 'N' END AS Severity_8
,CASE WHEN d.Severity_9 = 1 THEN 'Y' ELSE 'N' END AS Severity_9
,CASE WHEN d.Severity_10 = 1 THEN 'Y' ELSE 'N' END AS Severity_10
FROM DM.DimDecision d 
INNER JOIN [DM].[FctResponse] f  ON d.DecisionID = f.DecisionID 
INNER JOIN [DM].[DimApplicant] a ON a.ApplID = f.ApplID
INNER JOIN dbo.AGE_BAND_DEF b ON a.Age BETWEEN b.AGE_BAND_STRT_NBR AND b.AGE_BAND_END_NBR
INNER JOIN [DM].[DimApplRule] ar ON ar.RespID = f.RespID
INNER JOIN [DM].[DimRule] r ON ar.RuleID = r.RuleID
INNER JOIN [DM].[DimApplDrug] ad ON ad.RespID = f.RespID
INNER JOIN [DM].[DimDrug] drg ON drg.DrugID = ad.DrugID
WHERE b.AGE_BAND_GRP_NM = 'Standard'"


#Market Basket Analysis on the Drugs an applicant Discloses


SQL4<-"SELECT APPL_ID, [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20]
FROM
(SELECT DISTINCT
ad.APPL_ID
,d.DRUG_NM
,DENSE_RANK() OVER (PARTITION BY ad.APPL_ID ORDER BY CAST(LEN(d.DRUG_NM) AS NVARCHAR(250))+d.DRUG_NM) As RowNbr
FROM [DM].[D_APPL_DRUG] ad
INNER JOIN
[DM].[D_DRUG] d
ON ad.DRUG_ID = d.DRUG_ID) x
PIVOT
(MAX(DRUG_NM) 
FOR RowNbr IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20])) pvt
WHERE [20] IS NOT NULL
ORDER BY 1"

