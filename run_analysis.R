# Description: Create a tidy data set from Human Activity Recognition Using Smartphones Data Set
# Output Files: 
#  "data_set_tidy.txt": tidy data set with mean and standard deviation variable names, activities labels, variables names.   
#  "data_set_with_averages.txt": average of each variable for each activity and each subject.
run_analysis <- function() {
  # loading files
  message("loading data...")
  activity_labels <- read.delim("activity_labels.txt", header=F, sep=" ")
  features <- read.delim("features.txt", header=F, sep=" ")
  test_set_X <- read.delim("test/X_test.txt", header=F, sep=" ")
  test_set_y <- read.delim("test/y_test.txt", header=F, sep=" ")
  test_set_subject <- read.delim("test/subject_test.txt", header=F, sep=" ")
  train_set_X <- read.delim("train/X_train.txt", header=F, sep=" ")
  train_set_y <- read.delim("train/y_train.txt", header=F, sep=" ")
  train_set_subject <- read.delim("train/subject_train.txt", header=F, sep=" ")
  
  # Merges the training and the test sets to create one data set.
  message("merging...")
  test_set <- cbind(test_set_X[1:2947,1:561], test_set_y, test_set_subject)
  train_set <- cbind(train_set_X[1:7352,1:561], train_set_y, train_set_subject)
  data_set <- rbind(test_set, train_set)

  # Appropriately labels the data set with descriptive variable names. 
  message("set names to variables...")
  names(data_set) <- factor(c(as.character(features[,2]), "y","subject"))

  # Uses descriptive activity names to name the activities in the data set
  message("set labels to activities...")
  data_set$activity_label <- factor(data_set$y, labels=activity_labels$V2)
  
  # Extracts only the measurements on the mean and standard deviation for each measurement. 
  message("creating tidy data set...")
  means_and_std <- grepl('std()', features$V2) | grepl('mean()', features$V2)
  data_set_tidy <- data_set[,means_and_std]

  # Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  message("creating data set with averages...")
  data_set_with_averages <- aggregate.data.frame(data_set, by=list(Activity=data_set$activity_label, Subject=data_set$subject), FUN=mean, na.rm=T)
  
  # Write output data set CSV files
  message("writing files...")
  write.table(data_set_tidy, "data_set_tidy.txt", sep="\t", row.names=T)
  write.table(data_set_with_averages, "data_set_with_averages.txt", sep="\t", row.names=T)

  message("done!")
}


