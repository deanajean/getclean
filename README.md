# getclean
getting and cleaning data coursera

1. Download and unzip (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. Set working directory to direcory where files are: UCI HAR Dataset\
3. run_analysis.R should be in your working directory
4. source("working directory path\run_analysis.R")
5. DT<- run_analysis.R

DT is tidy dataset with 180 rows (30 subjects and 6 activities) and 68 variables. The variables are the mean of the measurement means and standard deviations

Assumes packages dplyr and data.table are installed
