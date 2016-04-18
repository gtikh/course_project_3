# setting the working directory
setwd("C:\\Users\\tikhonova\\Desktop\\course_project_3")

# Merging the training and the test sets to create one data set

X_train<-read.table("UCI HAR Dataset\\train\\X_train.txt")
Y_train<-read.table("UCI HAR Dataset\\train\\Y_train.txt")
subject_train<-read.table("UCI HAR Dataset\\train\\subject_train.txt")

X_test<-read.table("UCI HAR Dataset\\test\\X_test.txt")
Y_test<-read.table("UCI HAR Dataset\\test\\Y_test.txt")
subject_test<-read.table("UCI HAR Dataset\\test\\subject_test.txt")

X<-rbind(X_train,X_test)
Y<-rbind(Y_train,Y_test)
subject<-rbind(subject_train,subject_test)

# Extracting only the measurements on the mean and standard deviation for each measurement

features<-read.csv("UCI HAR Dataset\\features.txt",sep = " ",header=FALSE)
use_features<-features$V1[union(grep("mean()",features$V2),grep("std()",features$V2))]
X_use<-X[,use_features]

# Uses descriptive activity names to name the activities in the data set

activity_labels<-read.csv("UCI HAR Dataset\\activity_labels.txt",sep = " ",header=FALSE)
activity_names<-factor(Y[,1],labels=activity_labels[,2])

# Appropriately labels the data set with descriptive variable names

features_names<-as.character(features$V2)
use_features_names<-as.character(features$V2[union(grep("mean()",features$V2),grep("std()",features$V2))])
names(X)<-features_names
names(X_use)<-use_features_names
data<-cbind(subject,activity_names,X_use)
names<-names(data)
names[1]<-"subject"
names[2]<-"activity"
names(data)<-names


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(dplyr)
library(lazyeval)
tidy_data<-data%>%group_by(subject,activity)%>%summarise_each(funs(mean))

names(tidy_data) <- gsub("\\()", "", names(tidy_data)) # Removing "()" in variable names
names(tidy_data) <- gsub("^t", "time", names(tidy_data)) # making variable names more descriptive
names(tidy_data) <- gsub("^f", "freq", names(tidy_data)) # making variable names more descriptive
write.csv(tidy_data,"tidy_data.txt",row.names=FALSE)