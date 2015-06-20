#Date: 06/20/1983
#Author: Dr. Sumanth Swaminathan
#Subject: Coursera Data Cleaning Project

run_analysis = function()

#Assignment Steps 1 & 4: merge the test and training data sets and apply variable names
  
# Read the training and test data sets
xtrain=read.table("X_train.txt", sep="",header=FALSE)
xtest=read.table("X_test.txt", sep="",header=FALSE)

#Read the training and test Activity data
ytrain=read.table("y_train.txt", sep="",header=FALSE)
ytest=read.table("y_test.txt", sep="",header=FALSE)

#Read the training and test Subject labels
subjecttrain=read.table("subject_train.txt", sep="",header=FALSE)
subjecttest=read.table("subject_test.txt", sep="",header=FALSE)

#Read the features text info (labels for the data columns)
featurelabels=read.table("features.txt", sep="",header=FALSE)

#Apply the feature labels to xtrain and xtest and label all other data
colnames(xtest)=as.character(featurelabels[,2])
colnames(xtrain)=as.character(featurelabels[,2])

colnames(ytrain)="Activity"
colnames(ytest)="Activity"

colnames(subjecttrain)="Subject"
colnames(subjecttest)="Subject"

#column bind the test and training data sets

testdata=cbind(ytest,subjecttest,xtest)
traindata=cbind(ytrain,subjecttrain,xtrain)

#create master dataset
mergeddata=rbind(testdata,traindata)

#Assignment Step 2: Extract only collumns related to mean() and std()

meangroup=grep("mean()", names(mergeddata))
stdgroup=grep("std()", names(mergeddata))
colindices=c(1,2,sort(union(meangroup,stdgroup)))
Newdata=mergeddata[,colindices]

#Assignment Step 3: Apply activity names to the different activities performed

#Read activity names from activity data
activitynames=read.table("activity_labels.txt", sep="",header=FALSE)
activitynames=as.character(activitynames[,2])

#loop over data and label activities
for (i in 1:dim(Newdata)[1]){
  if (Newdata[i,1]==1){
    Newdata[i,1]=activitynames[1]
  }
  else if (Newdata[i,1]==2){
    Newdata[i,1]=activitynames[2]
  }
  else if (Newdata[i,1]==3){
    Newdata[i,1]=activitynames[3]
  }
  else if (Newdata[i,1]==4){
    Newdata[i,1]=activitynames[4]
  }
  else if (Newdata[i,1]==5){
    Newdata[i,1]=activitynames[5]
  }
  else if (Newdata[i,1]==6){
    Newdata[i,1]=activitynames[6]
  }
}

#Assignement Step 5: calculate means by subject and activity

library(taRifx)
library(dplyr)

MasterData = as.data.frame(Newdata %>% group_by(Activity,Subject) %>% summarise_each(funs(mean)))

#Write data frame to a text file
file=tempfile()
write.table(MasterData, file="DataCleanMasterData.txt", row.names=FALSE)

