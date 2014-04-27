## Assuming all the files are placed inside UCI HAR Dataset dir in the current
## working directory:

setwd("UCI HAR Dataset")

## Start with fetching features and activities:

features <- read.table("features.txt", stringAsFactors = FALSE)
activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

## Now we read the 'test' data:

test_subjects <- read.table("./test/subject_test.txt")
test_activities <- read.table("./test/y_test.txt")
test_obs <- read.table("./test/x_test.txt")
test <- cbind(test_subjects, test_activities, test_obs)
rm(test_subjects, test_activities, test_obs)

## Now we read the 'train' data:

train_subjects <- read.table("./train/subject_train.txt")
train_activities <- read.table("./train/y_train.txt")
train_obs <- read.table("./train/x_train.txt")
train <- cbind(train_subjects, train_activities, train_obs)
rm(train_subjects, train_activities, train_obs)

## Now we combine both the data.frames and name the columns:

mergedData <- rbind(test, train)
rm(test, train)
names(mergedData) [3:563] <- features[, 2]
names(mergedData) [1:2] <- c("Subjects", "Activities")
# Replacing Activity numbers with Activity names:
for(i in 1:6) { mergedData$Activities[mergedData$Activities == i] <- activities[i, 'V2'] }

## Now we filter out the dataset for mean and std columns only:

tidyDS_MS <- mergedData[, 1:2]
tidyDS_MS <- cbind(tidyDS_MS, mergedData[, grep("mean()", names(mergedData), fixed = TRUE)])
tidyDS_MS <- cbind(tidyDS_MS, mergedData[, grep("std()", names(mergedData), fixed = TRUE)])
write.table(tidyDS_MS, "tidy_consolidate.txt")

## Now we fetch the averages for all the variables for each activity of each subject:

library(reshape2)
temp <- melt(tidyDS_MS, id = c("Subjects", "Activities"))
tidyResult <- dcast(temp, Subjects + Activities ~ variable, mean)
write.table(tidyResult, "tidy_avg.txt")
rm(temp, i)

