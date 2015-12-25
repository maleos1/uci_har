library(dplyr)

##### 1. Load raw data sets into R 

features <- tbl_df(read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = TRUE))

actlab <- tbl_df(read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)) # Activity labels

y_test <- tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt"))

X_test <- tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt"))

subj_test <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt"))

y_train <- tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt"))

X_train <- tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt"))

subj_train <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt"))



#### 2. Select relevant features (mean and standard deviation measurements)

features_cons <- grepl(".*-std()|.*mean()", features$V2) #Logical vector looking for std() and mean()



#### 3. Subset X_train and X_test by features_cons 

X_test <- X_test[features_cons]

X_train <- X_train[features_cons]



#### 4. Relabel X_train's and X_test's column names

labels <- features[features_cons, 2]  # Subset the features vector by the logical vector to extract the column names 

labels <- labels[[1]]

colnames(X_test) <- labels 

colnames(X_train) <- labels



#### 5. Convert y files to contain meaningful activity labels

y_test <- as.character(y_test[[1]]) # Converting y_test and y_train to character vectors

y_train <- as.character(y_train[[1]])

# y_train
y_train <- gsub("1", actlab[1,2], y_train)
y_train <- gsub("2", actlab[2,2], y_train)
y_train <- gsub("3", actlab[3,2], y_train)
y_train <- gsub("4", actlab[4,2], y_train)
y_train <- gsub("5", actlab[5,2], y_train)
y_train <- gsub("6", actlab[6,2], y_train)

# y_test

y_test <- gsub("1", actlab[1,2], y_test)
y_test <- gsub("2", actlab[2,2], y_test)
y_test <- gsub("3", actlab[3,2], y_test)
y_test <- gsub("4", actlab[4,2], y_test)
y_test <- gsub("5", actlab[5,2], y_test)
y_test <- gsub("6", actlab[6,2], y_test)


#### 6. Add y files to X files and rename them meaningfully

X_test <- tbl_df(cbind(X_test, y_test)) # Using cbind here, as mutate function throws an error 
  
X_train <- tbl_df(cbind(X_train, y_train)) # Using cbind here, as mutate function throws an error

X_test <- rename(X_test, activity = y_test)

X_train <- rename(X_train, activity = y_train)


#### 7. Add column with subject id's to both X tables

subj_train <- subj_train[[1]]

subj_test <- subj_test[[1]]

X_test <- tbl_df(cbind(X_test, subj_test))  

X_train <- tbl_df(cbind(X_train, subj_train)) 

X_test <- rename(X_test, subject_id = subj_test)

X_train <- rename(X_train, subject_id = subj_train)


#### 8. Join X tables by row

X_combined <- rbind(X_test, X_train)


#### 9. Create summary table taking averages for each activity, summarised by subject

grouping <- group_by(X_combined, activity, subject_id)

X_summary <- summarise_each(grouping, funs(mean), -(activity:subject_id))


