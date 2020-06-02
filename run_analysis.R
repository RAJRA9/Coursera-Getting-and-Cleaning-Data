# Loading required libraries
library(tidyverse)
library(data.table)

# Reading the data files
data_files <- as.list(list.files("./Data"))

for (i in seq_along(data_files)) {
  assign(
    str_replace(data_files[[i]],".txt",""),
    fread(paste0("./Data/",data_files[[i]]))
    )
}

# Adding variable names
names(X_test) <- features$V2
names(X_train) <- features$V2
names(y_test) <- "activity"
names(y_train) <- "activity"
names(subject_test) <- "subject"
names(subject_train) <- "subject"
names(activity_labels) <- c("activity", "activity_name")

# Merging test and train data sets
test <- cbind(subject_test, X_test, y_test)
train <- cbind(subject_train, X_train, y_train)

data_set_temp <- rbind(test, train)

data_set <- data_set_temp[activity_labels, on = .(activity=activity)]

# Dropping redundant objects
rm(list = ls()[ls() != "data_set"])

## Output 1
  # 1. Merges the training and the test sets to create one data set.
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  # 3. Uses descriptive activity names to name the activities in the data set
  # 4. Appropriately labels the data set with descriptive variable names.

mean_std <- str_subset(str_subset(names(data_set), "mean|std"), "Freq", negate = T)
data_set_1 <- cbind(data_set[,.(subject, activity_name)] ,data_set[,..mean_std])
rm(mean_std)

## Output 2
  # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data_set_2 <- data_set_1[, lapply(.SD, mean) ,by = .(subject, activity_name)]

# Appending "[Average]" to variable names in data_set_2
setnames(data_set_2, old = names(data_set_2[,-c(1,2)]), new = paste(names(data_set_2[,-c(1,2)]), "[Average]"))

# Ordering datasets
setorder(data_set_1, subject, activity_name)
setorder(data_set_2, subject, activity_name)
