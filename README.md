getting-cleaning-data-course-project
====================================

Course Project for Coursera's Getting and Cleaning Data

## Instructions:

Clone the project to *git_clone_dir*:
```shell
git clone https://github.com/guilhermeando/getting-cleaning-data-course-project.git
```

Download [FUCI dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "FUCI dataset") and extract to *git_clone_dir*.


In RStudio or R console:
```R
setwd("<git_clone_dir>")
source("run_analysis.R")
run_analysis()
```

The analysis should generate two files:
* data_set_tidy.txt: tidy data set with mean and standard deviation variable names, activities labels, variables names.
* data_set_with_averages.txt: average of each variable for each activity and each subject.
