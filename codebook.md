CODEBOOK (for tidydata.txt, created on Dec 25th 2015 by maleos)
-------------------------------------------------------------------

**1. Overview & source data**

This codebook describes in more detail how the script run_analysis.R works. This is a script which combines and cleans the training and test datasets of UCI Human Activity Recogniction Using Smartphones Project (UCI HAR). It returns two data frames, X_combined (a combined and cleaned up data set for analysis), and X_summary (a summary dataset). 

The raw data were gathered from accelerometers of the Samsung Galaxy S smartphone as part of experiments of UCI HAR carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone on the waist.
According to the README.txt of the dataset (see section 4), the following data were collected:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The data frame X_summary that is returned by running the script can be used to create the file tidydata.txt manually, using the write.table() command. The file tidydata.txt is a data frame with 180 observations on 81 variables (see section 2). 79 of these variables contain the means and standard deviations among the 561 time and frequency domain variables (the two others contain subject ID and activity labels). Tidydata.txt displays the means of the 79 columns, grouped by subjects and activity.

See README.md for instructions on how to use run_analysis.R.

Sections 2 and 3 describe what steps the script performs to combine and clean the raw data, and the variables contained in the clean data set.

**2. Data transformations conducted by run_analysis.R**

The steps that run_analysis.R conducts are as follows:

1. The raw data (features.txt, activity_labels.txt, y_test.txt, X_test.txt, y_train.txt, X_train.txt, subject_test.txt, subject_train.txt) are loaded into R as objects.

2. From features.txt the measurements of interest are selected using grepl() with the search terms "-mean()" and "-std()", and stored as separate vector.

3. The X_train and X_test files are subset using the features vector. 

4. The names of the remaining columns of X_train and X_test are renamed using the features vector.  

5. The activity_labels file is used to convert the numerical code of activities into activity labels. 

6. The activity labels vectors are added to the X_train and X_test files. The resulting column is renamed appropriately.

7. Columns with the subject_ids from the subject_test and subject_train files are added to X_test and X_train respectively

8. The X tables are joined by row, the resulting data frame is called X_combined

9. A summary table is created that contains the averages of the selected measurements, grouped by subject id and activity. This data frame is called X_summary. This is the data frame from which tidydata.txt can be manually created using the write.table() command.


**3. Variable descriptions**

The final data frames as outputs from run_analysis.R (X_combined and X_summary) contain the following variables. Further details on data collection, variables and pre-processing is contained in the files features_info.txt and README.txt of the raw data set(see section 4).

activity: a factor with levels LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS

subject_id: a numeric vector

tBodyAcc.mean...X: a numeric vector

tBodyAcc.mean...Y: a numeric vector

tBodyAcc.mean...Z: a numeric vector

tBodyAcc.std...X: a numeric vector

tBodyAcc.std...Y: a numeric vector

tBodyAcc.std...Z: a numeric vector

tGravityAcc.mean...X: a numeric vector

tGravityAcc.mean...Y: a numeric vector

tGravityAcc.mean...Z: a numeric vector

tGravityAcc.std...X: a numeric vector

tGravityAcc.std...Y: a numeric vector

tGravityAcc.std...Z: a numeric vector

tBodyAccJerk.mean...X: a numeric vector

tBodyAccJerk.mean...Y: a numeric vector

tBodyAccJerk.mean...Z: a numeric vector

tBodyAccJerk.std...X: a numeric vector

tBodyAccJerk.std...Y: a numeric vector

tBodyAccJerk.std...Z: a numeric vector

tBodyGyro.mean...X: a numeric vector

tBodyGyro.mean...Y: a numeric vector

tBodyGyro.mean...Z: a numeric vector

tBodyGyro.std...X: a numeric vector

tBodyGyro.std...Y: a numeric vector

tBodyGyro.std...Z: a numeric vector

tBodyGyroJerk.mean...X: a numeric vector

tBodyGyroJerk.mean...Y: a numeric vector

tBodyGyroJerk.mean...Z: a numeric vector

tBodyGyroJerk.std...X: a numeric vector

tBodyGyroJerk.std...Y: a numeric vector

tBodyGyroJerk.std...Z: a numeric vector

tBodyAccMag.mean..: a numeric vector

tBodyAccMag.std..: a numeric vector

tGravityAccMag.mean..: a numeric vector

tGravityAccMag.std..: a numeric vector

tBodyAccJerkMag.mean..: a numeric vector

tBodyAccJerkMag.std..: a numeric vector

tBodyGyroMag.mean..: a numeric vector

tBodyGyroMag.std..: a numeric vector

tBodyGyroJerkMag.mean..: a numeric vector

tBodyGyroJerkMag.std..: a numeric vector

fBodyAcc.mean...X: a numeric vector

fBodyAcc.mean...Y: a numeric vector

fBodyAcc.mean...Z: a numeric vector

fBodyAcc.std...X: a numeric vector

fBodyAcc.std...Y: a numeric vector

fBodyAcc.std...Z: a numeric vector

fBodyAcc.meanFreq...X: a numeric vector

fBodyAcc.meanFreq...Y: a numeric vector

fBodyAcc.meanFreq...Z: a numeric vector

fBodyAccJerk.mean...X: a numeric vector

fBodyAccJerk.mean...Y: a numeric vector

fBodyAccJerk.mean...Z: a numeric vector

fBodyAccJerk.std...X: a numeric vector

fBodyAccJerk.std...Y: a numeric vector

fBodyAccJerk.std...Z: a numeric vector

fBodyAccJerk.meanFreq...X: a numeric vector

fBodyAccJerk.meanFreq...Y: a numeric vector

fBodyAccJerk.meanFreq...Z: a numeric vector

fBodyGyro.mean...X: a numeric vector

fBodyGyro.mean...Y: a numeric vector

fBodyGyro.mean...Z: a numeric vector

fBodyGyro.std...X: a numeric vector

fBodyGyro.std...Y: a numeric vector

fBodyGyro.std...Z: a numeric vector

fBodyGyro.meanFreq...X: a numeric vector

fBodyGyro.meanFreq...Y: a numeric vector

fBodyGyro.meanFreq...Z: a numeric vector

fBodyAccMag.mean..: a numeric vector

fBodyAccMag.std..: a numeric vector

fBodyAccMag.meanFreq..: a numeric vector

fBodyBodyAccJerkMag.mean..: a numeric vector

fBodyBodyAccJerkMag.std..: a numeric vector

fBodyBodyAccJerkMag.meanFreq..: a numeric vector

fBodyBodyGyroMag.mean..: a numeric vector

fBodyBodyGyroMag.std..: a numeric vector

fBodyBodyGyroMag.meanFreq..: a numeric vector

fBodyBodyGyroJerkMag.mean..: a numeric vector

fBodyBodyGyroJerkMag.std..: a numeric vector

fBodyBodyGyroJerkMag.meanFreq..: a numeric vector


**4. Source** 

The raw data from the UCI HAR Project can be downloaded via the following URL:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones




