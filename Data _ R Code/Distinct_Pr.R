setwd("C:\\Users\\A0120066W\\Dropbox\\KE_DMM\\Data & R Code")

proj_data<-read.csv("Project Data.csv")

prod_rcy<-proj_data[,2:16]

prod_freq<-matrix(data=0,nrow(prod_rcy))

head(prod_freq)

i=1
j=1

for(i in 1:nrow(prod_rcy)){
  for(j in 1:ncol(prod_rcy)){
    if(prod_rcy[i,j]>0){
      prod_freq[i]=prod_freq[i]+1
    }    
  }
}

summary(prod_freq)

prod_freq<-cbind(proj_data[,1],prod_freq)

prod_freq<-prod_freq[-c(prod_freq[,3])]

head(prod_freq)

hist(prod_freq[,2],main="Distinct Products Purchased",xlab="Distinct Product Purchased")

tab<-table(prod_freq[,1],prod_freq[,2])

barplot(tab,main="Distinct Product Purchased vs Response",xlab="Distinct Products",legend=rownames(0,1),col=c("red","darkblue"))


