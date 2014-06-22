README
========================================================

This document explains the raw data files and the use of a script (run_analysis.R) to transform the raw data into a cleaned, tidy dataset (cleanedData).

The raw data is from the **Human Activity Recognition Using Smartphones Data Set** in the UCI Machine Learning Repository.  The raw data files include accelerometer and gyroscope readings along X, Y and Z axes, sampled at a constant rate of 50Hz.  There were 30 volunteer subjects in the study, and each case in the data set was labelled with the activity undertaken by the subject.  Each case included 561 variables.  Additional information can be found in the CodeBook.md file.

## Raw Data Files

These files should be placed in your current working directory before running the script:

* X_train.txt - training data
* y_train.txt - training activity for each training case
* subject_train.txt - subject id for each training case
* X_test.txt - test data
* y_test.txt - test activity for each test case
* subject_test.txt - subject id for each test case
* features.txt - names of each feature (variable) in the data
* activity_labels.txt - descriptions of the activities

## R Script File

Run the following code file in R to produce the tidy data file, XXXXXXX.

* run_analysis.R


## Data Codebook

See CodeBook.md for information about the raw data and its transformation into a tidy data file.

