
#Download the DataSet
unlink("getdata_projectfiles_UCI_HAR_Dataset.zip")
unlink("UCI HAR Dataset", recursive=TRUE)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "getdata_projectfiles_UCI_HAR_Dataset.zip", method="curl")
unzip("getdata_projectfiles_UCI_HAR_Dataset.zip")

################
##1- Merges the training and the test sets to create one data set.
#First load all the info for the tests
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
#Merge all in one dataframe
test <- cbind(testSubjects, testActivity, testSet)

#Now do the same for the training data
trainSet <- read.table("UCI HAR Dataset/train/X_train.txt")
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
#And merge all columns
train <- cbind(trainSubjects, trainActivity, trainSet)

#And merge verything in one big dataframe
fullSet <- rbind(train, test)
names(fullSet) <- c("subject", "activity")

##################
##2- Extracts only the measurements on the mean and standard deviation for each measurement. 
#The name of the features are in the features.txt file, so read it
features <- read.table("UCI HAR Dataset/features.txt")
#Our dataset (fullSet) has two extra columns before the actual "data", so make up for it
features <- rbind(c(0,"foo"), c(0,"bar"), features)
#Find all features that have std() or mean() on their names
measurements <- grep('std\\(\\)|mean\\(\\)', features$V2)
subSet <- fullSet[, c(1,2, measurements)]

###################
##3- Uses descriptive activity names to name the activities in the data set
#The names of the activities are on the activity_labels.txt file
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
#Now map the activity column to a factor based on actLabels
subSet$activity <- factor(subSet$activity, levels=actLabels[,1] , labels=actLabels[,2])

###################
##4- Appropriately labels the data set with descriptive variable names. 
#The second colum of the features data frame has the names, so extract it
#Use "measurements" as parameter so we get the labels only on the rows that have std or mean
measureNames <- as.character(features[measurements, 2])
#Lets make the names a little more readable by replacing some stuff
measureNames <- gsub("-|\\(|\\)","", measureNames)
measureNames <- gsub("std","StdDevi", measureNames)
measureNames <- gsub("mean","Mean", measureNames)
measureNames <- gsub("^t","Time", measureNames)
measureNames <- gsub("^f","Frequency", measureNames)
#And set the names to the subSet
namedSet <- subSet
names(namedSet) <- c("subject", "activity", measureNames)


###################
##5- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#The aggregate function does most of the job
finalSet <- aggregate(namedSet[,c(-1,-2)], by=list(namedSet$subject, namedSet$activity) , FUN="mean")
#Renamed the variables so that they begin with "Avergage-" to make their meaning clearer
measureNames <- gsub("^", "Average-", measureNames)
names(finalSet) <- c("subject", "activity", measureNames)
#Save the data
write.table(finalSet, row.name=FALSE, file="final_tidy_dataset.txt")
