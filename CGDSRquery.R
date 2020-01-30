library('cgdsr')
mycgds = CGDS("https://www.cbioportal.org/")
Ttest = read.csv("cBioUserKey.csv", header= TRUE)
QueryResults = {}
geneName = colnames(Ttest[2])
for(i in Ttest[,2]){
  a = getMutationData(mycgds, paste(i,"_all", sep = ""),paste(i,"_mutations",sep=""),geneName)
  QueryResults = rbind(QueryResults,a)
}
write.csv(QueryResults,"cBioQuery.csv", row.names = FALSE)
