setwd("C:\\Users\\A0120066W\\Dropbox\\KE_DMM\\Data & R Code")

###############################
### PCA for original data set##
###############################
proj_data<-read.csv("Project Data.csv")

n=ncol(proj_data)

pca<-princomp(proj_data[,2:n])

loadings<-unclass(pca$loadings)

old_data<-data.matrix(proj_data)

dim(old_data)

new_data<-(old_data[,2:n]%*%loadings[,1:50])

new_data<-data.matrix(cbind(new_data,old_data[,1]))

write.csv(new_data,"PCA_Sample.csv")

head(new_data)

##########################
### PCA for new data set##
##########################

proj_data<-read.csv("Proj_Data_v130.csv")

dim(proj_data)

n=ncol(proj_data)

pca<-princomp(proj_data[,13:n])

loadings<-unclass(pca$loadings)

old_data<-data.matrix(proj_data)

new_data<-(old_data[,13:n]%*%loadings[,1:45])

new_data<-data.matrix(cbind(new_data,old_data[,1]))

write.csv(new_data,"PCA_Sample_130.csv")

head(new_data)

##########################
### PCA for secondary variables##
##########################

proj_data<-read.csv("Project_PCA.csv")
dim(proj_data)
n=ncol(proj_data)
pca<-princomp(proj_data[,33:n])
loadings<-unclass(pca$loadings)
old_data<-data.matrix(proj_data)
new_data<-(old_data[,33:n]%*%loadings[,1:15])
write.csv(cbind(proj_data[,1:32],new_data),"Proj_data_45.csv")


