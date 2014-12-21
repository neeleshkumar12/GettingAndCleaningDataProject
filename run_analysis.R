library(plyr) 
 
# 1.Merges the training and the test sets to create one data set.


xTrainData <- read.table("UCI HAR Dataset/train/X_train.txt") 
xTestData <- read.table("UCI HAR Dataset/test/X_test.txt") 

# Merge 'x' data  
xMergeData <- rbind(xTrainData, xTestData)


yTrainData <- read.table("UCI HAR Dataset/train/y_train.txt") 
yTestData <- read.table("UCI HAR Dataset/test/y_test.txt")

# Merge 'y' data 
yMergeData <- rbind(yTrainData, yTestData) 

sTrainData <- read.table("UCI HAR Dataset/train/subject_train.txt") 
sTestData <- read.table("UCI HAR Dataset/test/subject_test.txt") 

# merge 'subject' data set 
sMergeData <- rbind(sTrainData, sTestData) 
 


#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
 
fTable <- read.table("UCI HAR Dataset/features.txt") 

# find the mean() and std()  
featureMeanAndStd <- grep("-(mean|std)\\(\\)", fTable[, 2]) 

xMergeData <- xMergeData[, featureMeanAndStd] 
names(xMergeData) <- fTable[featureMeanAndStd, 2] 


#3.Uses descriptive activity names to name the activities in the data set 

aTable <- read.table("UCI HAR Dataset/activity_labels.txt") 
yMergeData[, 1] <- aTable[yMergeData[, 1], 2] 
names(yMergeData) <- "activity" 


#4.Appropriately label the data set with descriptive variable names 
 
names(sMergeData) <- "subject" 
data <- cbind(xMergeData, yMergeData, sMergeData) 


#5.Create a second, independent tidy data set with the average of each variable for each activity and each subject 

averagedata <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66])) 

 
write.table(averagedata, "averagedata.txt", row.name=FALSE) 
