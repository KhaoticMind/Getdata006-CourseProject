CodeBook
========================

This codebook describes the work done to produce a final tidy dataset as required for the *Getting and Cleaning Data* Coursera course.

The assigment comprises of five steps, as described bellow.


1.    Merges the training and the test sets to create one data set.
2.    Extracts only the measurements on the mean and standard deviation for each measurement. 
3.    Uses descriptive activity names to name the activities in the data set
4.    Appropriately labels the data set with descriptive variable names. 
5.    Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

To accomplish these steps we have written a script called *run_analysis.R* that does all the required work.

Bellow we will describe how each of these steps was done. But first lets describe the data we work with.

## The Input
The input data represents data colelcted from the accelerometers from teh Samsung Galaxy S phone, and contains the values from various measures. The measures have values of the data collected (the data) as well as information about the subject from which the data was collected (*subject*) and the activity that the subject was doing when the data was collected (*activity*). 

A full description of it can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Obtaining the input data
The input data is stored on the [internet](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and can be freely downloaded.

The *run_analysis.R* script automatically download the file from the internet and uncompresses it on the current directory. All following work is done supossing this.

### Description of the input data
The input data is spread in various files. Each of these files are described in the README.TXT that accompanies the data. Bellow we will describe the files that are inportant for this work.

* **UCI HAR Dataset/test/X_test.txt** and **UCI HAR Dataset/train/X_train.txt** Contains the observations for the data collected. Each line on the files represent one observation, and each column a feature/variable.
* **UCI HAR Dataset/test/subject_test.txt** and **UCI HAR Dataset/train/subject_train.txt** Contains the subjects that realized each observation
* **UCI HAR Dataset/test/y_test.txt** and **UCI HAR Dataset/train/y_train.txt** Contains the code for the activity that was  being realized by the subject during the observation
* **UCI HAR Dataset/features.txt** A list containing the names of each variable (columns) from the dataset.
* **UCI HAR Dataset/activity_labels.txt** A list containing the mapping from the code of the activity to the actual name.


## The processing
Now that we now our data lets see the steps we have done to process it.

### Merging the DataSets
The first step is to merge the train and test datasets.

We accomplish this by doing the followin:

1. Read the data from test/X_test.txt and augment it, column wise, with test/subject_test.txt and test/y_test.txt, respectively
2. Read the data from train/X_train.txt and augment it, column wise, with train/subject_test.txt and train/y_train.txt, respectively
3. Merge the two datasets, row wise.

After this we end with a data set with 10.299 observations over 563 variables (of these 563 variables the first two are the subject and the activity, the others are the measures).

We call this the *fullSet*.

### Extracting mean and standard deviation
At this time we are only interested in the variables about the standard deviation and median. So we need to subset the *fullSet*.

To do this we look at the *features.txt* file and search for variables that have *std()* or *mean()* on their name. And get only these columns from the fullSet (keeping the subject and activity).

Filtering the data like this we end up with 66 variables (plus the subject and activity). 

We call this the *subSet*.

### Naming the activities
The activities on the *subSet* are just numbers. We want to have a more morable value associated to it.

So we look at the activity_lavels.txt file to find the mapping between the numbers and the activity names. We then replace the number with the respective names on the subSet.

### Naming the variables
To make the data more easily readable we will add to each of the variables we have.

We use the features.txt file to find the name of each variable we have (as filtered in the *Extracting mean and standard deviation* step).

To make the data more readable we do the following modifications on the text:

* Remove the "-", "(" and ")" from the variable names
* Replace the text "std", with "StdDevi"
* Replace the text "mean", with "Mean"

Using this the variable that would be named **fBodyBodyAccJerkMag-std()** will be renamed to **fBodyBodyAccJerkMagStdDevi**.

We call this the *namedSet*.

## The Output
The last step on the processing is to generate a summary of the that, giving the average of each variable, for each subject and activity.

To make things more clear we rename the variables so that all begin with "Average-".

The final output is then saved to a file named *final_tidy_dataset.txt*, that contains 180 observations (30 subjects by 6 activities) and 68 variables (subject, activity and 66 measurements).

We call this the *finalSet*
