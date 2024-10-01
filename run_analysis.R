# Coursera "Getting and Cleaning Data" Course Project
library(tidyverse)

# Reading training data
xTrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
subjectsTrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

# Reading test dsata
xTest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subjectsTest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

# Reading features and activity labels
features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
activityLabels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

# Descriptive names for columns
colnames(xTrain) <- features[,2]
colnames(yTrain) <- "activityID"
colnames(subjectsTrain) <- "subjectID"

colnames(xTest) <- features[,2]
colnames(yTest) <- "activityID"
colnames(subjectsTest) <- "subjectID"

colnames(activityLabels) <- c('activityID','activityType')

# Merge test and train data
train <- cbind(yTrain, subjectsTrain, xTrain)
test <- cbind(yTest, subjectsTest, xTest)
mergedData <- rbind(train, test)

# Extract out columns with mean or standard deviationi (mean or std)
summaryColumns <- grepl("mean|std|activityID|subjectID", colnames(mergedData))
summaryData <- mergedData[, summaryColumns]

# Giving more descriptive names to activities in summaryData
descriptiveSummaryData <- merge(summaryData, activityLabels, by='activityID', all.x=TRUE)

# Second tidy data set with the average of each variable for each activity and each subject
tidySet <- descriptiveSummaryData %>%
  group_by(subjectID, activityID, activityType) %>%
  summarise_all(mean)

# Write tidySet to a text file
write.table(tidySet, "tidySet.txt", row.name=FALSE)

