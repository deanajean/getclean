---
title: "Getting and Cleaning Data Project Code Book"
author: "Deana"
date: "November 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
Getting and Cleaning Data project using smartphone data set available here:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Purpose of the project is to test being able to get a dataset, understand and prepare and clean. 
Project deliverables are:

Run_Analysis.R - a scrip that does these things:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 

A tidy data set - this is the output of step 4  with the average of each variable for each activity and each subject.


.
###Cleaning of the data
#reads in 3 test and training data sets (X test and train, y test and train, and Subject test and train)
# combines each test and training set
# uses features to assign names to X
# extracts the measurements for xyz std() and mean() using grep from 66 of 561 possilbe columsn
# removes the | and lower cases the colum names
# gets the names of the activities from activity.txt
# combines all three datasets (10299 rows    68 columns)


###Guide to create the tidy data file
#convert the data frame to a data table using data.table()
#use lapply to do the mean of each column grouped by subject and activity
#set the key to subject and activity to order the table

##Description of the data
#measurements are the mean() and std() of these features. These come from the accelerometer 
and gyroscope 3-axial raw signals tAcc-XYZ. These signals were used to estimate variables
of the feature vector for each pattern:
and tGyro-XYZ
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
###


##Description of the variables in the tiny_data.txt file
# for each of 30 subjects, there are 6 activities (180 rows). 68 variables.
  V1                V2
1  1           walking
2  2   walkingupstairs
3  3 walkingdownstairs
4  4           sitting
5  5          standing
6  6            laying

