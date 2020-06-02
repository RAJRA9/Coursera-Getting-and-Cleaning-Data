# Coursera-Getting-and-Cleaning-Data
My submission for **Peer-graded Assignment: Getting and Cleaning Data Course Project.**

#### Before running the code, please do the following.
* Download the data for the project from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
* Create a new folder named `Data` in the working directory.
* Copy/move the following files to the folder `Data`.
    * activity_labels.txt
    * features.txt
    * subject_test.txt
    * X_test.txt
    * y_test.txt
    * subject_train.txt
    * X_train.txt
    * y_train.txt 

#### In the next step, run the R script `run_analysis.R`, which does the following.
* Loads the required libraries (tidyverse and data.table)
* Reads the list of file names in the folder `Data`.
* Reads the data in all the file names and stores them into separate data tables.
* Assigns appropriate column names in all the data tables, as required in ***Step-4*** of the project.
* Creates temporary data tables named `test` and `train` by merging subject, X & y files.
* Merges the `test` and `train` data tables and subsequently joins the result with `activity_labels` to create one data set, as required in ***Step-1 & Step-3*** of the project.
* Extracts the list of columns with measurements on the mean and standard deviation for each measurement into the character vector `mean_std`.
* Creates `data_set_1` with columns `subject`, `activity_name` and all the columns in `mean_std`, as required in ***Step-2*** of the project.
* Using `data_set_1`, creates a second, independent tidy data set `data_set_2`, with the average of each variable for each activity and each subject, as required in ***Step-5*** of the project.
* Saves `data_set_2` into `tidy_data.txt` in the working directory.
