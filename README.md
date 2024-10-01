# Getting-and-Cleaning-Data-Project

Data can be downloaded at  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


run_analysis.R can be run when located inside the folder extracted from the .zip (getdata_projectfiles_UCI HAR Dataset)

It works by: 
1. Reading data in from both the test and training data sets
2. Giving the data column names from the features.txt file
3. Merging the test and training data into one
4. Creating a condensed dataframe of only the means and standard deviation values
5. Creating and writing to .txt a separate tidy data set with average of each variable for each activity and each subject
