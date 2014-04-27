CodeBook for Getting and Cleaning Data Project
==============================================

tidy_consolidate.txt
====================

This cleaned database consists of only the average and standard deviation values for the features that come from UCI Machine Learning Repos of Human Activity Recognition Using Samsung
Galaxy S smartphone conducted on 30 subjects during 6 seperate activities.

tidy_avg.txt
============

This database consists on the averages of various features extracted in the tidy_consolidation database for each combination of subject and activity. 


Variables:
==========

1. tidy_consolidate.txt:
------------------------

1. Subjects	1
	The subjects who participated in the study.
			1:30

2. Activities	18
	The activities that were performed by the subjects.
			LAYING
			SITTING
			STANDING
			WALKING
			WALKING_DOWNSTAIRS
			WALKING_UPSTAIRS

3. All the rest of the variables are features that come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

   The variables are mean (-mean()-) and standard deviation (-std()-) of Time-derived (prefixed with t-) body linear acceleration (tBodyAcc-) and body angular velocity (tBodyGyro-) to obtain Jerk signals (tBodyAccJerk- and tBodyGyroJerk-)
   The magnitude of these 3-dimensional signals are calculated using the Euclidean norm (tBodyAccMag-, tBodyAccJerkMag-, tBodyGyroMag-, tBodyGyroJerkMag-)

   The features prefixed with f-, like fBodyAcc- and fBodyGyro- are Fast Fourier Transform applied to the prior listed signals.


2. tidy_avg.txt:
----------------

1. Subjects	1
	The subjects listed in the tidy_consolidation.txt database.
			1:30

2. Activities	18
	The activities same as listed in the tidy_consolidate.txt.

3. The averages of each feature for each avitivity of each Subject.


Cleaning up:
============

1. Initially, the test data (x_test.txt) was column-combined with the subject_test.txt and y_test.txt data. Same for the training data. We came with 2 datasets
   each containing 561 variables, along which we could combine the two datasets.

   Here, the Inertial Signals data was intentionally left out as we only needed to combine to training and test data.

2. Then the two datasets were row-combined to achieve a consolidated dataset (mergedData), with 561 variables and 10299 observations.

3. The activities codes were then replaced with the activity names to make the data more descriptive.

4. Now we needed only the mean (mean()) and standard deviation (std()) values on each of the measurements; these were extracted from the consolidated dataset 
   into a seperate dataset (tidyDS_MS, M for mean and S for standard deviation).

5. Now, average was calculated over each variable individually for each activity of each subject, into a third dataset tidyResult. The variable names were retained
   a it is to maintain a connection between the variables of tidyDS_MS dataset and tidyResult dataset and as the tidyResult dataset contains only the averages
   of each variable, the mean or average word was not appended or prepended to the names.
