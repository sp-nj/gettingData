## run_analysis.R
## getting and cleaning data course project
## Steve Painter

## need dplyr
library(dplyr)

## load up the activity labels and rename the columns - this will be used for both data sets
activityLabels <- read.table(file="UCI HAR Dataset/activity_labels.txt")
activityLabels <- rename(activityLabels, ActivityID = V1, Activity = V2)

## load the test subject data and rename the column to subjectID
testSubjects <- read.table(file="UCI HAR Dataset/test/subject_test.txt")
testSubjects <- rename(testSubjects, SubjectID = V1)

## load up the test activity data and join it to the activity labels 
testActivities <- read.table(file="UCI HAR Dataset/test/Y_test.txt")
testActivities <- rename(testActivities, ActivityID = V1)
testActivities <- testActivities %>% left_join(activityLabels, by="ActivityID")

## raw load for the test data
testData <- read.table(file="UCI HAR Dataset/test/X_test.txt")

## select out just the mean and std variables we want and rename them slightly. These could be clearer.
testData <- select(testData, tBodyAccMeanX=V1, tBodyAccMeanY=V2, tBodyAccMeanZ=V3,
                   tBodyAccStdX=V4, tBodyAccStdY=V5, tBodyAccStdZ=V6,
                   tGravityAccMeanX=V41, tGravityAccMeanY=V42, tGravityAccMeanZ=V43,
                   tGravityAccStdX=V44, tGravityAccStdY=V45, tGravityAccStdZ=V46,
                   tBodyAccJerkMeanX=V81, tBodyAccJerkMeanY=V82, tBodyAccJerkMeanZ=V83,
                   tBodyAccJerkStdX=V84, tBodyAccJerkStdY=V85, tBodyAccJerkStdZ=V86,
                   tBodyGyroMeanX=V121, tBodyGyroMeanY=V122, tBodyGyroMeanZ=V123,
                   tBodyGyroStdX=V124, tBodyGyroStdY=V125, tBodyGyroStdZ=V126,
                   tBodyGyroJerkMeanX=V161, tBodyGyroJerkMeanY=V162, tBodyGyroJerkMeanZ=V163,
                   tBodyGyroJerkStdX=V164, tBodyGyroJerkStdY=V165, tBodyGyroJerkStdZ=V166,
                   tBodyAccMagMean=V201, tBodyAccMagStd=V202, tGravityAccMagMean=V214, tGravityAccMagStd=V215,
                   tBodyAccJerkMagMean=V227, tBodyAccJerkMagStd=V228, tBodyGyroMagMean=V240, tBodyGyroMagStd=V241,
                   tBodyGyroJerkMagMean=V253, tBodyGyroJerkMagStd=V254,
                   fBodyAccMeanX=V266, fBodyAccMeanY=V267, fBodyAccMeanZ=V268,
                   fBodyAccStdX=V269, fBodyAccStdY=V270, fBodyAccStdZ=V271,
                   fBodyAccMeanFreqX=V294, fBodyAccMeanFreqY=V295, fBodyAccMeanFreqZ=V296,
                   fBodyAccJerkMeanX=V345, fBodyAccJerkMeanY=V346, fBodyAccJerkMeanZ=V347,
                   fBodyAccJerkStdX=V348, fBodyAccJerkStdY=V349, fBodyAccJerkStdZ=V350,
                   fBodyAccJerkMeanFreqX=V373, fBodyAccJerkMeanFreqY=V374, fBodyAccJerkMeanFreqZ=V375,
                   fBodyGyroMeanX=V424, fBodyGyroMeanY=V425, fBodyGyroMeanZ=V426,
                   fBodyGyroStdX=V427, fBodyGyroStdY=V428, fBodyGyroStdZ=V429,
                   fBodyGyroMeanFreqX=V452, fBodyGyroMeanFreqY=V453, fBodyGyroMeanFreqZ=V454,
                   fBodyAccMagMean=V503, fBodyAccMagStd=V504, fBodyAccMagMeanFreq=V513,
                   fBodyBodyAccJerkMagMean=V516, fBodyBodyAccJerkMagStd=V517, 
                   fBodyBodyAccJerkMagMeanFreq=V526, fBodyBodyGyroMagMean=V529, fBodyBodyGyroMagStd=V530,
                   fBodyBodyGyroMagMeanFreq=V539, fBodyBodyGyroJerkMagMean=V542,
                   fBodyBodyGyroJerkMagStd=V543, fBodyBodyGyroJerkMagMeanFreq=V552,
                   angletBodyAccMean=V555, angletBodyAccJerkMean=V556, 
                   angletBodyGyroMean=V557, angletBodyGyroJerkMean=V558,
                   angleXgravityMean=V559, angleYgravityMean=V560, angleZgravityMean=V561)

## bind the datasets together since they are joined by row
testData <- bind_cols(testSubjects, testActivities, testData)

## load the train subject data and rename the column to subjectID
trainSubjects <- read.table(file="UCI HAR Dataset/train/subject_train.txt")
trainSubjects <- rename(trainSubjects, SubjectID = V1)

## load up the train activity data and join it to the activity labels 
trainActivities <- read.table(file="UCI HAR Dataset/train/Y_train.txt")
trainActivities <- rename(trainActivities, ActivityID = V1)
trainActivities <- trainActivities %>% left_join(activityLabels, by="ActivityID")

## raw load for the train data
trainData <- read.table(file="UCI HAR Dataset/train/X_train.txt")

## select out just the mean and std variables we want and rename them slightly. These could be clearer.
trainData <- select(trainData, tBodyAccMeanX=V1, tBodyAccMeanY=V2, tBodyAccMeanZ=V3,
                   tBodyAccStdX=V4, tBodyAccStdY=V5, tBodyAccStdZ=V6,
                   tGravityAccMeanX=V41, tGravityAccMeanY=V42, tGravityAccMeanZ=V43,
                   tGravityAccStdX=V44, tGravityAccStdY=V45, tGravityAccStdZ=V46,
                   tBodyAccJerkMeanX=V81, tBodyAccJerkMeanY=V82, tBodyAccJerkMeanZ=V83,
                   tBodyAccJerkStdX=V84, tBodyAccJerkStdY=V85, tBodyAccJerkStdZ=V86,
                   tBodyGyroMeanX=V121, tBodyGyroMeanY=V122, tBodyGyroMeanZ=V123,
                   tBodyGyroStdX=V124, tBodyGyroStdY=V125, tBodyGyroStdZ=V126,
                   tBodyGyroJerkMeanX=V161, tBodyGyroJerkMeanY=V162, tBodyGyroJerkMeanZ=V163,
                   tBodyGyroJerkStdX=V164, tBodyGyroJerkStdY=V165, tBodyGyroJerkStdZ=V166,
                   tBodyAccMagMean=V201, tBodyAccMagStd=V202, tGravityAccMagMean=V214, tGravityAccMagStd=V215,
                   tBodyAccJerkMagMean=V227, tBodyAccJerkMagStd=V228, tBodyGyroMagMean=V240, tBodyGyroMagStd=V241,
                   tBodyGyroJerkMagMean=V253, tBodyGyroJerkMagStd=V254,
                   fBodyAccMeanX=V266, fBodyAccMeanY=V267, fBodyAccMeanZ=V268,
                   fBodyAccStdX=V269, fBodyAccStdY=V270, fBodyAccStdZ=V271,
                   fBodyAccMeanFreqX=V294, fBodyAccMeanFreqY=V295, fBodyAccMeanFreqZ=V296,
                   fBodyAccJerkMeanX=V345, fBodyAccJerkMeanY=V346, fBodyAccJerkMeanZ=V347,
                   fBodyAccJerkStdX=V348, fBodyAccJerkStdY=V349, fBodyAccJerkStdZ=V350,
                   fBodyAccJerkMeanFreqX=V373, fBodyAccJerkMeanFreqY=V374, fBodyAccJerkMeanFreqZ=V375,
                   fBodyGyroMeanX=V424, fBodyGyroMeanY=V425, fBodyGyroMeanZ=V426,
                   fBodyGyroStdX=V427, fBodyGyroStdY=V428, fBodyGyroStdZ=V429,
                   fBodyGyroMeanFreqX=V452, fBodyGyroMeanFreqY=V453, fBodyGyroMeanFreqZ=V454,
                   fBodyAccMagMean=V503, fBodyAccMagStd=V504, fBodyAccMagMeanFreq=V513,
                   fBodyBodyAccJerkMagMean=V516, fBodyBodyAccJerkMagStd=V517, 
                   fBodyBodyAccJerkMagMeanFreq=V526, fBodyBodyGyroMagMean=V529, fBodyBodyGyroMagStd=V530,
                   fBodyBodyGyroMagMeanFreq=V539, fBodyBodyGyroJerkMagMean=V542,
                   fBodyBodyGyroJerkMagStd=V543, fBodyBodyGyroJerkMagMeanFreq=V552,
                   angletBodyAccMean=V555, angletBodyAccJerkMean=V556, 
                   angletBodyGyroMean=V557, angletBodyGyroJerkMean=V558,
                   angleXgravityMean=V559, angleYgravityMean=V560, angleZgravityMean=V561)

## bind the datasets together since they are joined by row
trainData <- bind_cols(trainSubjects, trainActivities, trainData)

## bind the 2 datasets together
## mergedData is the final form of the dataset
mergedData <- bind_rows(testData, trainData)

## clean up the temporary data
rm(activityLabels)
rm(testActivities)
rm(testSubjects)
rm(testData)
rm(trainActivities)
rm(trainSubjects)
rm(trainData)

## summarise the data by calculating the mean of each variable for each subject/activity
tidySummary <- summarise(group_by(mergedData, SubjectID, Activity),
   MtBodyAccMeanX=mean(tBodyAccMeanX), MtBodyAccMeanY=mean(tBodyAccMeanY), MtBodyAccMeanZ=mean(tBodyAccMeanZ),
   MtBodyAccStdX=mean(tBodyAccStdX), MtBodyAccStdY=mean(tBodyAccStdY), MtBodyAccStdZ=mean(tBodyAccStdZ),
   MtGravityAccMeanX=mean(tGravityAccMeanX), MtGravityAccMeanY=mean(tGravityAccMeanY), MtGravityAccMeanZ=mean(tGravityAccMeanZ),
   MtGravityAccStdX=mean(tGravityAccStdX), MtGravityAccStdY=mean(tGravityAccStdY), MtGravityAccStdZ=mean(tGravityAccStdZ),
   MtBodyAccJerkMeanX=mean(tBodyAccJerkMeanX), MtBodyAccJerkMeanY=mean(tBodyAccJerkMeanY), MtBodyAccJerkMeanZ=mean(tBodyAccJerkMeanZ),
   MtBodyAccJerkStdX=mean(tBodyAccJerkStdX), MtBodyAccJerkStdY=mean(tBodyAccJerkStdY), MtBodyAccJerkStdZ=mean(tBodyAccJerkStdZ),
   MtBodyGyroMeanX=mean(tBodyGyroMeanX), MtBodyGyroMeanY=mean(tBodyGyroMeanY), MtBodyGyroMeanZ=mean(tBodyGyroMeanZ),
   MtBodyGyroStdX=mean(tBodyGyroStdX), MtBodyGyroStdY=mean(tBodyGyroStdY), MtBodyGyroStdZ=mean(tBodyGyroStdZ),
   MtBodyGyroJerkMeanX=mean(tBodyGyroJerkMeanX), MtBodyGyroJerkMeanY=mean(tBodyGyroJerkMeanY), MtBodyGyroJerkMeanZ=mean(tBodyGyroJerkMeanZ),
   MtBodyGyroJerkStdX=mean(tBodyGyroJerkStdX), MtBodyGyroJerkStdY=mean(tBodyGyroJerkStdY), MtBodyGyroJerkStdZ=mean(tBodyGyroJerkStdZ),
   MtBodyAccMagMean=mean(tBodyAccMagMean), MtBodyAccMagStd=mean(tBodyAccMagStd), MtGravityAccMagMean=mean(tGravityAccMagMean), MtGravityAccMagStd=mean(tGravityAccMagStd),
   MtBodyAccJerkMagMean=mean(tBodyAccJerkMagMean), MtBodyAccJerkMagStd=mean(tBodyAccJerkMagStd), MtBodyGyroMagMean=mean(tBodyGyroMagMean), MtBodyGyroMagStd=mean(tBodyGyroMagStd),
   MtBodyGyroJerkMagMean=mean(tBodyGyroJerkMagMean), MtBodyGyroJerkMagStd=mean(tBodyGyroJerkMagStd),
   MfBodyAccMeanX=mean(fBodyAccMeanX), MfBodyAccMeanY=mean(fBodyAccMeanY), MfBodyAccMeanZ=mean(fBodyAccMeanZ),
   MfBodyAccStdX=mean(fBodyAccStdX), MfBodyAccStdY=mean(fBodyAccStdY), MfBodyAccStdZ=mean(fBodyAccStdZ),
   MfBodyAccMeanFreqX=mean(fBodyAccMeanFreqX), MfBodyAccMeanFreqY=mean(fBodyAccMeanFreqY), MfBodyAccMeanFreqZ=mean(fBodyAccMeanFreqZ),
   MfBodyAccJerkMeanX=mean(fBodyAccJerkMeanX), MfBodyAccJerkMeanY=mean(fBodyAccJerkMeanY), MfBodyAccJerkMeanZ=mean(fBodyAccJerkMeanZ),
   MfBodyAccJerkStdX=mean(fBodyAccJerkStdX), MfBodyAccJerkStdY=mean(fBodyAccJerkStdY), MfBodyAccJerkStdZ=mean(fBodyAccJerkStdZ),
   MfBodyAccJerkMeanFreqX=mean(fBodyAccJerkMeanFreqX), MfBodyAccJerkMeanFreqY=mean(fBodyAccJerkMeanFreqY), MfBodyAccJerkMeanFreqZ=mean(fBodyAccJerkMeanFreqZ),
   MfBodyGyroMeanX=mean(fBodyGyroMeanX), MfBodyGyroMeanY=mean(fBodyGyroMeanY), MfBodyGyroMeanZ=mean(fBodyGyroMeanZ),
   MfBodyGyroStdX=mean(fBodyGyroStdX), MfBodyGyroStdY=mean(fBodyGyroStdY), MfBodyGyroStdZ=mean(fBodyGyroStdZ),
   MfBodyGyroMeanFreqX=mean(fBodyGyroMeanFreqX), MfBodyGyroMeanFreqY=mean(fBodyGyroMeanFreqY), MfBodyGyroMeanFreqZ=mean(fBodyGyroMeanFreqZ),
   MfBodyAccMagMean=mean(fBodyAccMagMean), MfBodyAccMagStd=mean(fBodyAccMagStd), MfBodyAccMagMeanFreq=mean(fBodyAccMagMeanFreq),
   MfBodyBodyAccJerkMagMean=mean(fBodyBodyAccJerkMagMean), MfBodyBodyAccJerkMagStd=mean(fBodyBodyAccJerkMagStd), 
   MfBodyBodyAccJerkMagMeanFreq=mean(fBodyBodyAccJerkMagMeanFreq), MfBodyBodyGyroMagMean=mean(fBodyBodyGyroMagMean), MfBodyBodyGyroMagStd=mean(fBodyBodyGyroMagStd),
   MfBodyBodyGyroMagMeanFreq=mean(fBodyBodyGyroMagMeanFreq), MfBodyBodyGyroJerkMagMean=mean(fBodyBodyGyroJerkMagMean),
   MfBodyBodyGyroJerkMagStd=mean(fBodyBodyGyroJerkMagStd), MfBodyBodyGyroJerkMagMeanFreq=mean(fBodyBodyGyroJerkMagMeanFreq),
   MangletBodyAccMean=mean(angletBodyAccMean), MangletBodyAccJerkMean=mean(angletBodyAccJerkMean), 
   MangletBodyGyroMean=mean(angletBodyGyroMean), MangletBodyGyroJerkMean=mean(angletBodyGyroJerkMean),
   MangleXgravityMean=mean(angleXgravityMean), MangleYgravityMean=mean(angleYgravityMean), MangleZgravityMean=mean(angleZgravityMean))

## write out the tidy data set to the workspace
write.table(tidySummary, "tidySummary.txt", row.names=FALSE)
