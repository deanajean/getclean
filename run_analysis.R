run_analysis <- function (){
  suppressMessages(library(dplyr))
  suppressMessages(library(data.table))
# Assumes thes files are in the working directory
# activity_labels.txt': Links the class labels with their activity name.
# train/X_train.txt': Training set
# train/y_train.txt': Training labels
# test/X_test.txt': Test set
# test/y_test.txt': Test labels
# train/subject_train.txt'  
# test/subject_test.txt  
# features.txt'  
#1 Merges the training and the test sets to create one data set.

  test <- read.table("./test/X_test.txt")
  train <- read.table("./train/X_train.txt")
  X <- rbind(test,train)
  
  test <- read.table("./test/y_test.txt")
  train <- read.table("./train/y_train.txt")
  Y <- rbind(test, train)
  
  test <- read.table("./test/subject_test.txt")
  train <- read.table("./train/subject_train.txt")  
  S <- rbind(test, train)
  names(S) <- c("subject")  
   
#2 Extracts only the measurements on the mean() and std() for each measurement xyz. 
  features <- read.table("./features.txt") 
# get index of columns you want  
  names(X) <- features$V2
  meanstdcols <- grep("mean\\(\\)|std\\(\\)", features[, 2])  
  X <- X[,meanstdcols]
  names(X) <- tolower(gsub("\\(|\\)", "", names(X)))
  names(X) <- gsub("^f", "freq", names(X))
  names(X) <- gsub("^t", "time", names(X))
  
#3 Uses descriptive activity names to name the activities in the data set
  activity <- read.table("./activity_labels.txt", stringsAsFactors = FALSE)
  activity[,2] <- tolower(gsub("\\_", "", activity[,2]))
  names(Y) <- "activity"
  Y[,1] = activity[Y[,1], 2]

  all <- cbind(S,Y,X)
#4 Appropriately labels the data set with descriptive variable names. 
  
  
#5 Create independent tidy data set created with write.table() using row.name=FALSE 
tidy <- data.table(all)
tidy <- tidy[, lapply(.SD, mean), by= .(subject, activity)]
setkey(tidy, subject, activity)
write.table(tidy, "tidy.txt", row.names = FALSE)  
  
# with the average of each variable for each activity and each subject.
tidy

}