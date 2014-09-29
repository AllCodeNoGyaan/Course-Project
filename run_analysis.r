## To be answered 
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## PS: I am working on windows platform , so the path are set accordingly

## Adding the library
library(plyr)
library(dplyr)

## Download the dataset

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="data.zip")

## Unzip the File to Raw data folder :: Good Practice
unzip("data.zip",exdir = ".//Data//Raw")

## Import the files
activity_labels <- read.table("Data//Raw//UCI HAR Dataset//activity_labels.txt")
features  <- read.table("Data//Raw//UCI HAR Dataset//features.txt")

## Train set

X_train <- read.table("Data//Raw//UCI HAR Dataset//train//X_train.txt")
y_train <- read.table("Data//Raw//UCI HAR Dataset//train//y_train.txt")
subject_train <- read.table("Data//Raw//UCI HAR Dataset//train//subject_train.txt")

## Creating Training Dataset By multiple merges


train_activity <- tbl_df(y_train)
colnames(train_activity) <- c("ActivityNumber")

train_activity <- merge(train_activity,activity_labels,by.x="ActivityNumber"
                        ,by.y="V1",sort=FALSE)
train_activity <- rename(train_activity, c("V2" = "ActivityName"))

## Dumping all the features in the table

## Naming the table columns
colnames(X_train) <- as.character(features$V2)

## Used formula concatenation in excel to generate the huge list ( quick and dirty shortcut :( )
## write.table(features,file="myfile.xls",row.names=FALSE) use to quickly write huge list in excel


## Getting the Correct Columns

train_features <- cbind(as.data.frame(X_train[,1]),X_train[,2],X_train[,3],X_train[,4],X_train[,5],X_train[,6],
                        X_train[,41],X_train[,42],X_train[,43],X_train[,44],X_train[,45],X_train[,46],X_train[,81],
                        X_train[,82],X_train[,83],X_train[,84],X_train[,85],X_train[,86],X_train[,121],X_train[,122],X_train[,123],
                        X_train[,124],X_train[,125],X_train[,126],X_train[,161],X_train[,162],X_train[,163],X_train[,164],X_train[,165],
                        X_train[,166],X_train[,201],X_train[,202],X_train[,214],X_train[,215],X_train[,227],X_train[,228],
                        X_train[,240],X_train[,241],X_train[,253],X_train[,254],X_train[,266],X_train[,267],X_train[,268],
                        X_train[,269],X_train[,270],X_train[,271],X_train[,345],X_train[,346],X_train[,347],X_train[,348],
                        X_train[,349],X_train[,350],X_train[,424],X_train[,425],X_train[,426],X_train[,427],X_train[,428],
                        X_train[,429],X_train[,503],X_train[,504],X_train[,516],X_train[,517],X_train[,529],X_train[,530],X_train[,542],
                        X_train[,543])


colnames(train_features) <- 
  c("tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z","tBodyAcc-std-X","tBodyAcc-std-Y","tBodyAcc-std-Z","tGravityAcc-mean-X",
    "tGravityAcc-mean-Y","tGravityAcc-mean-Z","tGravityAcc-std-X","tGravityAcc-std-Y","tGravityAcc-std-Z",
    "tBodyAccJerk-mean-X","tBodyAccJerk-mean-Y","tBodyAccJerk-mean-Z","tBodyAccJerk-std-X","tBodyAccJerk-std-Y",
    "tBodyAccJerk-std-Z","tBodyGyro-mean-X","tBodyGyro-mean-Y","tBodyGyro-mean-Z","tBodyGyro-std-X","tBodyGyro-std-Y",
    "tBodyGyro-std-Z","tBodyGyroJerk-mean-X","tBodyGyroJerk-mean-Y","tBodyGyroJerk-mean-Z","tBodyGyroJerk-std-X",
    "tBodyGyroJerk-std-Y","tBodyGyroJerk-std-Z","tBodyAccMag-mean","tBodyAccMag-std","tGravityAccMag-mean",
    "tGravityAccMag-std","tBodyAccJerkMag-mean","tBodyAccJerkMag-std","tBodyGyroMag-mean","tBodyGyroMag-std",
    "tBodyGyroJerkMag-mean","tBodyGyroJerkMag-std","fBodyAcc-mean-X","fBodyAcc-mean-Y","fBodyAcc-mean-Z",
    "fBodyAcc-std-X","fBodyAcc-std-Y","fBodyAcc-std-Z","fBodyAccJerk-mean-X","fBodyAccJerk-mean-Y","fBodyAccJerk-mean-Z",
    "fBodyAccJerk-std-X","fBodyAccJerk-std-Y","fBodyAccJerk-std-Z","fBodyGyro-mean-X","fBodyGyro-mean-Y","fBodyGyro-mean-Z",
    "fBodyGyro-std-X","fBodyGyro-std-Y","fBodyGyro-std-Z","fBodyAccMag-mean","fBodyAccMag-std","fBodyBodyAccJerkMag-mean",
    "fBodyBodyAccJerkMag-std","fBodyBodyGyroMag-mean","fBodyBodyGyroMag-std",
    "fBodyBodyGyroJerkMag-mean","fBodyBodyGyroJerkMag-std")

## Adding activity labels and features
train_activity <- cbind(train_activity,train_features)

## Adding the Subject Data

colnames(subject_train) <- c("subject")
train_activity <- cbind(subject_train,train_activity)



## Following the same steps for the Test data set


X_test <- read.table("Data//Raw//UCI HAR Dataset//test//X_test.txt")
y_test <- read.table("Data//Raw//UCI HAR Dataset//test//y_test.txt")
subject_test <- read.table("Data//Raw//UCI HAR Dataset//test//subject_test.txt")

## Creating testing Dataset By multiple merges


test_activity <- tbl_df(y_test)
colnames(test_activity) <- c("ActivityNumber")

test_activity <- merge(test_activity,activity_labels,by.x="ActivityNumber"
                        ,by.y="V1",sort=FALSE)
test_activity <- rename(test_activity, c("V2" = "ActivityName"))

## Dumping all the features in the table

## Naming the table columns
colnames(X_test) <- as.character(features$V2)

## Used formula concatenation in excel to generate the huge list ( quick and dirty shortcut :( )
## write.table(features,file="myfile.xls",row.names=FALSE) use to quickly write huge list in excel


## Getting the Correct Columns

test_features <- cbind(as.data.frame(X_test[,1]),X_test[,2],X_test[,3],X_test[,4],X_test[,5],X_test[,6],
                        X_test[,41],X_test[,42],X_test[,43],X_test[,44],X_test[,45],X_test[,46],X_test[,81],
                        X_test[,82],X_test[,83],X_test[,84],X_test[,85],X_test[,86],X_test[,121],X_test[,122],X_test[,123],
                        X_test[,124],X_test[,125],X_test[,126],X_test[,161],X_test[,162],X_test[,163],X_test[,164],X_test[,165],
                        X_test[,166],X_test[,201],X_test[,202],X_test[,214],X_test[,215],X_test[,227],X_test[,228],
                        X_test[,240],X_test[,241],X_test[,253],X_test[,254],X_test[,266],X_test[,267],X_test[,268],
                        X_test[,269],X_test[,270],X_test[,271],X_test[,345],X_test[,346],X_test[,347],X_test[,348],
                        X_test[,349],X_test[,350],X_test[,424],X_test[,425],X_test[,426],X_test[,427],X_test[,428],
                        X_test[,429],X_test[,503],X_test[,504],X_test[,516],X_test[,517],X_test[,529],X_test[,530],X_test[,542],
                        X_test[,543])


colnames(test_features) <- 
  c("tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z","tBodyAcc-std-X","tBodyAcc-std-Y","tBodyAcc-std-Z","tGravityAcc-mean-X",
    "tGravityAcc-mean-Y","tGravityAcc-mean-Z","tGravityAcc-std-X","tGravityAcc-std-Y","tGravityAcc-std-Z",
    "tBodyAccJerk-mean-X","tBodyAccJerk-mean-Y","tBodyAccJerk-mean-Z","tBodyAccJerk-std-X","tBodyAccJerk-std-Y",
    "tBodyAccJerk-std-Z","tBodyGyro-mean-X","tBodyGyro-mean-Y","tBodyGyro-mean-Z","tBodyGyro-std-X","tBodyGyro-std-Y",
    "tBodyGyro-std-Z","tBodyGyroJerk-mean-X","tBodyGyroJerk-mean-Y","tBodyGyroJerk-mean-Z","tBodyGyroJerk-std-X",
    "tBodyGyroJerk-std-Y","tBodyGyroJerk-std-Z","tBodyAccMag-mean","tBodyAccMag-std","tGravityAccMag-mean",
    "tGravityAccMag-std","tBodyAccJerkMag-mean","tBodyAccJerkMag-std","tBodyGyroMag-mean","tBodyGyroMag-std",
    "tBodyGyroJerkMag-mean","tBodyGyroJerkMag-std","fBodyAcc-mean-X","fBodyAcc-mean-Y","fBodyAcc-mean-Z",
    "fBodyAcc-std-X","fBodyAcc-std-Y","fBodyAcc-std-Z","fBodyAccJerk-mean-X","fBodyAccJerk-mean-Y","fBodyAccJerk-mean-Z",
    "fBodyAccJerk-std-X","fBodyAccJerk-std-Y","fBodyAccJerk-std-Z","fBodyGyro-mean-X","fBodyGyro-mean-Y","fBodyGyro-mean-Z",
    "fBodyGyro-std-X","fBodyGyro-std-Y","fBodyGyro-std-Z","fBodyAccMag-mean","fBodyAccMag-std","fBodyBodyAccJerkMag-mean",
    "fBodyBodyAccJerkMag-std","fBodyBodyGyroMag-mean","fBodyBodyGyroMag-std",
    "fBodyBodyGyroJerkMag-mean","fBodyBodyGyroJerkMag-std")

## Adding activity labels and features
test_activity <- cbind(test_activity,test_features)

## Adding the Subject Data

colnames(subject_test) <- c("subject")
test_activity <- cbind(subject_test,test_activity)



### Finally Merging the two big datasets
tidy_data <- rbind(train_activity,test_activity)


## Question 5 Average Summary 

tidier_data <- tidy_data %>% group_by(subject,ActivityName)%>% summarise_each(funs(mean))
 
## Write to file


write.table(tidier_data,file="tidyData.txt",row.names=FALSE)



