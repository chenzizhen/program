load("c6RData")
library("survival")
library("survminer")
H <- coef(result[[3]])
survival <- read.delim("~/Desktop/czz/生信文章/beataml/survival1.txt", stringsAsFactors=FALSE)
H <- t(H)
allpatient<-data.frame(rownames(H))
colnames(allpatient)<-c("ID")
#建立所有样品生存曲线和survival矩阵i
allsurvival <- merge(allpatient,survival,by.x="ID",by.y="LabId")
ID<-as.character(allsurvival$ID)
time<-as.integer(allsurvival$time)
status<-as.integer(allsurvival$status)
group=result$group
distanceMatrix<-result$distanceMatrix
p_value=survAnalysis(mainTitle = "AML",time,status,group,distanceMatrix,similarity = 1)
i<-cbind.data.frame(ID,time,status,group,stringsAsFactors=0)

FSpatient <- read.csv("./patients/a.txt", sep="")
i1<-merge(FSpatient,i,by.x="LabId",by.y="ID")
Sur <- Surv(i1$time/365*12, i1$status)
sfit <- survfit(Sur ~ group, data = i1)
ggsurvplot(sfit,pval=TRUE,palette = "jco",pval.method = T)+labs(x = "a")
