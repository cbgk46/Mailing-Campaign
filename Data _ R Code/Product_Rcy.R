setwd("C:\\Users\\A0120066W\\Dropbox\\KE_DMM\\Data & R Code")

proj_data<-read.csv("Project Data.csv")

prod_rcy<-proj_data[,2:16]
nrow(prod_rcy)
head(prod_rcy)

class(prod_rcy)

ncol(prod_rcy)

i=1

column_names<-substring(colnames(prod_rcy),2,3)

par(mfrow=c(1,1))

png(filename="Test.png",width=240,height=240,units="px")
par(mfrow=c(2,1))
plot(density(prod_rcy[,i]),main=paste("Density for Product",column_names[i],sep=" "),width=240,height=240,units="px")
hist(prod_rcy[,i],main=paste("Histogram for ",column_names[i],sep=" "),xlab=paste("Product",column_names[i],"values",sep=" "))
dev.off()

hist(prod_rcy[,1])

for(i in 1:ncol(prod_rcy)){
  png(filename=paste(paste("Product",column_names[i],sep=" "),".png",sep=""))
  par(mfrow=c(2,1))
  plot(density(prod_rcy[,i]),main=paste("Density for Product",column_names[i],sep=" "))
  hist(prod_rcy[,i],main=paste("Histogram for Product",column_names[i],sep=" "),xlab=paste("Product",column_names[i],"values",sep=" "))
  dev.off()
}
 

png(filename="Main.png")

for(i in 1:ncol(prod_rcy)){
  #plot(density(prod_rcy[,i]),main=paste("Density for Product",column_names[i],sep=" "))
  png(filename=paste(paste("Product",column_names[i],sep=" "),".png",sep=""))
  hist(prod_rcy[,i],main=paste("Histogram for Product",column_names[i],sep=" "),xlab=paste("Product",column_names[i],"values",sep=" "))
  dev.off()
}
dev.off()

i=1
j=1
for(i in 1:nrow(prod_rcy)){
  for(j in 1:ncol(prod_rcy)){
    if(prod_rcy[i,j] <=0.2)
      prod_rcy[i,j]=0
    else
      prod_rcy[i,j]=1
  }
}
