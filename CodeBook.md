---
title: "Getting and Cleaning Data Project Code Book"
author: "deanajean"
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
 reads in 3 test and training data sets (X test and train, y test and train, and Subject test and train)
 combines each test and training set
 uses features to assign names to X
 extracts the measurements for xyz std() and mean() using grep from 66 of 561 possilbe columsn
 removes the | and lower cases the colum names
 gets the names of the activities from activity.txt
 combines all three datasets (10299 rows   68 columns)


###Guide to create the tidy data file
convert the data frame to a data table using data.table()
use lapply to do the mean of each column grouped by subject and activity
set the key to subject and activity to order the table

##Description of the data
measurements are the mean() and std() of these features. These come from the accelerometer 
and gyroscope 3-axial raw signals tAcc-XYZ. These signals were used to estimate variables
of the feature vector for each pattern (t is time, f is frequency:

Variables in tidy.
 [1] "subject"                      "activity"                     "timebodyacc-mean-x"          
 [4] "timebodyacc-mean-y"           "timebodyacc-mean-z"           "timebodyacc-std-x"           
 [7] "timebodyacc-std-y"            "timebodyacc-std-z"            "timegravityacc-mean-x"       
[10] "timegravityacc-mean-y"        "timegravityacc-mean-z"        "timegravityacc-std-x"        
[13] "timegravityacc-std-y"         "timegravityacc-std-z"         "timebodyaccjerk-mean-x"      
[16] "timebodyaccjerk-mean-y"       "timebodyaccjerk-mean-z"       "timebodyaccjerk-std-x"       
[19] "timebodyaccjerk-std-y"        "timebodyaccjerk-std-z"        "timebodygyro-mean-x"         
[22] "timebodygyro-mean-y"          "timebodygyro-mean-z"          "timebodygyro-std-x"          
[25] "timebodygyro-std-y"           "timebodygyro-std-z"           "timebodygyrojerk-mean-x"     
[28] "timebodygyrojerk-mean-y"      "timebodygyrojerk-mean-z"      "timebodygyrojerk-std-x"      
[31] "timebodygyrojerk-std-y"       "timebodygyrojerk-std-z"       "timebodyaccmag-mean"         
[34] "timebodyaccmag-std"           "timegravityaccmag-mean"       "timegravityaccmag-std"       
[37] "timebodyaccjerkmag-mean"      "timebodyaccjerkmag-std"       "timebodygyromag-mean"        
[40] "timebodygyromag-std"          "timebodygyrojerkmag-mean"     "timebodygyrojerkmag-std"     
[43] "freqbodyacc-mean-x"           "freqbodyacc-mean-y"           "freqbodyacc-mean-z"          
[46] "freqbodyacc-std-x"            "freqbodyacc-std-y"            "freqbodyacc-std-z"           
[49] "freqbodyaccjerk-mean-x"       "freqbodyaccjerk-mean-y"       "freqbodyaccjerk-mean-z"      
[52] "freqbodyaccjerk-std-x"        "freqbodyaccjerk-std-y"        "freqbodyaccjerk-std-z"       
[55] "freqbodygyro-mean-x"          "freqbodygyro-mean-y"          "freqbodygyro-mean-z"         
[58] "freqbodygyro-std-x"           "freqbodygyro-std-y"           "freqbodygyro-std-z"          
[61] "freqbodyaccmag-mean"          "freqbodyaccmag-std"           "freqbodybodyaccjerkmag-mean" 
[64] "freqbodybodyaccjerkmag-std"   "freqbodybodygyromag-mean"     "freqbodybodygyromag-std"     
[67] "freqbodybodygyrojerkmag-mean" "freqbodybodygyrojerkmag-std" 
> 

The tiday dataset has the mean of each of the mean and StdDev measurments above

##Description of the variables in the tiny_data.txt file
 for each of 30 subjects, there are 6 activities (180 rows). 68 variables.
 The activity variables are in V2
  V1                V2
1  1           walking
2  2   walkingupstairs
3  3 walkingdownstairs
4  4           sitting
5  5          standing
6  6            laying

The subject variables are integers 1 - 30 

