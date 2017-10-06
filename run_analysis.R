## This script merges two data sets (training & test sets),creating a new data set.
## Extracts the mean and standard deviation for each measurement, and labels the 
## data set with descriptive variables names.

## The resulting data set contains the average of each variable for each activity
## and each subject.

## loading requiered packages
library(data.table)

## Obtaining the data from
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- download.file(url, destfile = "dataset.zip")

## unzipping the file
unzip("dataset.zip") ## data stored in "UCI HAR Dataset"

## reading training data sets
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

## reading test data sets
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt") 
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")

## reading features and activities labels
features <- read.table("UCI HAR Dataset/features.txt")
activitylabel <- read.table("UCI HAR Dataset/activity_labels.txt")

## assigning new column names to the data sets
colnames(xtrain) <- features[ , 2]
colnames(ytrain) <- "activityid"
colnames(subjecttrain) <- "subjectid"

colnames(xtest) <- features[ , 2]
colnames(ytest) <- "activityid"
colnames(subjecttest) <- "subjectid"

colnames(activitylabel) <- c( "activityid", "activitytype")

## merging the training and test data sets into a new data set
newtrain <- cbind(ytrain, subjecttrain, xtrain)
newtest <- cbind(ytest, subjecttest, xtest)

newdata <- rbind(newtrain, newtest)

## extracting only the measurements on the mean and standard deviation for each 
## measurement. 

## create a vector for the column names from the new data to select the mean and
## standard deviation from
cnames <- colnames(newdata)

## create a logic vector with the subject's id, mean and standard deviation
meanandstd <- (grepl("activityid", cnames) |
                 grepl("subjectid", cnames) |
                 grepl("mean..", cnames) |
                 grepl("std..", cnames)
)

## substracting the results matching the logical vector above with the new data
meanandstddata <- newdata[ , meanandstd == TRUE]

## using descriptive activity names to name the activities in the data set
meanandstddatalabeled <- merge(meanandstddata, activitylabel, 
                               by = "activityid", all.x = TRUE)

## updating the cnames to include new columns in the data merged
cnames <- colnames(meanandstddatalabeled)

## cleaning up variable names
cnames <- gsub("[\\(\\)-]", "", cnames) ## removing special characters
cnames <- gsub("mean", "Mean", cnames)
cnames <- gsub("std", "StdDev", cnames)
cnames <- gsub("^t", "Time", cnames)
cnames <- gsub("^f", "Frequency", cnames)
cnames <- gsub("Acc", "Accelerometer", cnames)
cnames <- gsub("Gyro", "Gyroscope", cnames)
cnames <- gsub("Mag", "Magnitude", cnames)
cnames <- gsub("[Jj]erk", "Jerk", cnames)
cnames <- gsub("BodyBody", "Body", cnames) ## correcting typo error

## renaming variables with the lables assigned above
colnames(meanandstddatalabeled) <- cnames

## creating a second, independent tidy data set with the average of each variable
## for each activity and each subject.

tidydata <- meanandstddatalabeled[ , names(meanandstddatalabeled) != "activitytype"]
finaltidydata <- aggregate(.~subjectid + activityid, tidydata, mean)
finaltidydata <- finaltidydata[order(finaltidydata$subjectid, 
                                     finaltidydata$activityid), ]

## converting the new tidy data set into a text file
write.table(finaltidydata, "finaltidydataset.txt", row.names = FALSE)
