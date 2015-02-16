## Code for variable categorization

setwd("C:\\Users\\A0120066W\\Dropbox\\KE_DMM\\Data & R Code")

proj_data<-read.csv("Project Data.csv")

colnames(proj_data)

education_data<-cbind(proj_data$bsl9to13nc,proj_data$bslg9,proj_data$bslnunivc,proj_data$bslunivdeg,proj_data$bslunivnc,proj_data$bslunivnd)

education_data<-data.matrix(education_data)

colnames(education_data)<-colnames(matrix(proj_data$bsl9to13nc,proj_data$bslg9,proj_data$bslnunivc,proj_data$bslunivdeg,proj_data$bslunivnc,proj_data$bslunivnd))

education_data_mean<-matrix(data=0,nrow=1,ncol=ncol(education_data))

education_data_mean<-colMeans(education_data)

new_education_values<-matrix(data=0,nrow=nrow(education_data),ncol=ncol(education_data))

reduced_education<-matrix(data=0,nrow=nrow(education_data),ncol=1)

write.csv(education_data,"Education Variables.csv")

i=1
j=1

for(i in 1:nrow(education_data)){
  for(j in 1:ncol(education_data)){
    new_education_values[i,j]=((education_data[i,j]-education_data_mean[j])/education_data_mean[j])
  }
  reduced_education[i]=max_index(matrix(c(new_education_values[i,]),nrow=1,ncol=ncol(education_data)))  
  j=1
}

write.csv(new_education_values,"Education Variables.csv")

new_education_values<-abs(new_education_values)

max_index<-function(x){
  k=1
  index=1
  pos_count=0
  neg_count=0
  for(k in 1:ncol(x)){
    if(x[k]>0)
      pos_count=pos_count+1
    else if(x[k]<0)
      neg_count=neg_count+1
  }
  if(pos_count==ncol(x)){
    k=1
    for(k in 1:ncol(x)){
      if(x[k]>x[index])
        index=k
    }
  }
  else if(neg_count==ncol(x)){
    k=1
    for(k in 1:ncol(x)){
      if(x[k]<x[index])
        index=k
    }
  }
  else{
    k=1
    for(k in 1:ncol(x)){
      if(x[k]>0 && x[k]>x[index])
        index=k    
  }
  }    
  return(index)
}

  