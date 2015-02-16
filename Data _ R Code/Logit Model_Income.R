setwd("C:\\Users\\A0120066W\\Dropbox\\KE_DMM\\Data & R Code")
coeff<-matrix(c(0.0006,0.0055,0.0082),nrow=3,ncol=1)

income_data<-read.csv("SpendwIncome.csv")

proj_data<-read.csv("Project data.csv")


income_data<-income_data[,1:3]

income_data<-data.matrix(income_data)

head(income_data)

dim(income_data)

dim(coeff)

hypothesis<-1/(1+exp(-(income_data%*%coeff)))

class(income_data)

write.csv(cbind(income_data,hypothesis),"Income Class Predicted.csv")

plot(density(income_data[,1]))

hist(income_data[,1],main="Total Spend Distribution",xlab="Amount Spent($)")

hist(income_data[,2],main="Transaction Distribution",xlab="Number of transactions")

hist(income_data[,3])

tenure_response<-cbind(income_data[,3],proj_data[,1])

tenure_res_tab<-table(tenure_response)

head(tenure_response)

tenure_res_tab


barplot(tenure_res_tab)