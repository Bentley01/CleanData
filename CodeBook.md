CodeBook
========================================================

## Data Collection

For this analysis we used the Samsung data on smartphone movements, posted at the UCI Machine Learning Repository, under the heading, **Human Activity Recognition Using Smartphones Data Set.** The data were downloaded on June 5, 2014 using the R programming language.

## Study Design

Thirty volunteer subjects were used to record movements using Samsung Galaxy S II smartphones.  The subjects carried out various activities, such as Walking, Walking Up, Walking Down, Sitting, Standing and Laying, with a smartphone attached to the hip.  Smartphones are equipped with an accelerometer, which measures linear movement in a three dimensional space (back/forward, up/down and left/right), and a gyroscope, which measures angular velocity in three planes.

While the subjects carried out various activities, the accelerometer and gyroscope readings were taken at a rate of 50Hz.  The sensor data was filtered to remove noise and sampled over 2.56 second intervals (128 readings/interval).  The accelerometer readings include both body and gravitational movements.  These were separated using a Butterworth low-pass filter.

Body linear acceleration and angular velocity were calculated and used to create Jerk signals.  Euclidean norms were used to determine the magnitude of these signals.  A Fast Fourier Transform was used to convert the time based signals into frequency based ones.

Various statistical calculations, such as minimum, maximum, mean, standard deviation, etc. and angle of velocity calculations were added to the predictor variable set. Finally, variable measurements were standardized using a scale of [-1, 1]. A full list of the variables and transformations is described in the README.TXT file provided with the dataset. 

##  Data Transformations

The research raw data was provided in two sets - training and test data.  Each set contained a file with the actual data observed, a file with the subject codes, and a file with the activity codes.

The raw data files were transformed using the run_analysis.R script.  The following describes the transformations that result in the data.frame datameans, saved to datameans.txt.

The training data (X_training.txt) was read into R using the read.table function.  The file contained 7352 observations of 561 variables.  Similarly, the activities represented by the observations (y_train.txt) and the subject ids (subject_train.txt) were read into R.  These three data frames were combined using the cbind function, resulting in a new data frame, training, with dimensions 7352 rows with 563 variables.

The same functions were applied to the X_test.txt, y_test.txt and subject_test.txt files, to generate a data frame, test, with dimensions 2947 rows with 563 variables.

The rbind function in R was used to combine the training and test data frames into a new data frame, dataset, with dimensions 10,299 rows with 563 variables.

The features.txt file, representing the 561 variable names for the data, was read in using the read.table function in R.  The feature descriptions were converted from the factor class to character.
Subject and Activity variable names were added to this list.  The list of variable names was added to the dataset dataframe.

Variable names were edited using gsub() in R to replace "-" with "." and "()" with "".

The final data set (cleanedData) was obtained by subsetting the dataset to include only those columns that contained the mean or standard deviation of one of the sensor readings.  The R function grep() was used to obtain variable names that included "mean" or "std".  For this step, variables that represent angle calculations between one vector and the mean of another were not included in the cleanedData set, because these were not considered to be actual means of variables, but calculations based on means.  There were 66 variables that represented means or standard deviations of sensor readings, plus the Subject and Activity variables.

The subject and Activity variables were converted into factor variables.  The cleanedData dataframe was checked to ensure there were no NA values.  There were none.

Using read.table, read in the activity descriptions from activity_labels.txt.  Replaced the activity codes in cleanedData with the actual activity descriptions.

Using the aggregate() function in R, created a new data frame (datameans), with one row for each combination of subject (30) and activity (6).  The values of the variables are equal to the mean of all values in cleanedData, for that row's combination of subject and activity.

The resulting data.frame has 180 rows and 68 columns, including the subject and activity.

Variable descriptions from the original study, **Human Activity Recognition Using Smartphones Data Set**, can be found in the project's features_info.txt file.