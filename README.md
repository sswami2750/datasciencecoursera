# Instructions for running "run_analysis.R"

<li>Date: 06/20/2015</li>
<li>Author: Dr. Sumanth Swaminathan</li>

## Summary

The code, run_analysis.R, reads raw data representing Samsung Galaxy S smartphone data downloaded from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The program merges test and training data, applies column labels, filters out summary data associated with mean() and std(), applies a mean to the summary data, and writes a final tidied, averaged dataset entitled, "DataCleanMasterData.txt".

## Algorithm/Instructions

<ol>
<li> Extract the following data files from the downloaded zipfile into a single directory and read the datafiles into R: X_train.txt,X_test.txt,y_train.txt,y_test.txt,subject_train.txt,subject_test.txt,features.txt</li>
<li> Apply the names in features.txt (after converting factor data to strings) to the column data in xtrain.txt and xtest.tst.  Name the y_train,test.txt and subject_test.txt variables "Activity" and "Subject" respectively. </li>
<li> Add the activity and subject data to the test and training data tables (using cbind()) and merge the test and training sets into one "mergeddata" data frame (using rbind() ) </li>
<li> Extract only columns related to summaries: mean() and std() and store that data in a new data frame called "Newdata"</li>
<li> Apply activity names to the Activity data numbered 1-6 (replace with WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING respectively)</li>
<li> Create a final tidied data table which includes the average of all measurements (variables) by subject and activity.  The grep function is used to average data for a given activity and given subject for all activities and subjects.  </li>
<li> Write the tidied data set to a txt file excluding rownames
</ol> 
