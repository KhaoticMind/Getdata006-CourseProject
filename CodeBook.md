CodeBook
========================

#Data description
This dataset is composed of 68 variables and 180 observations.

Features 3 to 68 are the average of a subset of the observed values from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The original values come from the data capture of an accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ captured on a 50hz interval (variables containing *Time* on their name), and from applying the fast fourrier transformation  on some of the signals (variables with *Frequency* on their names).

Please note that:

* This subset refers only to variables that represent the standard deviation (std()) and the mean (mean());
* The averages are grouped by subject and activity.

# Data Dictionary
1. subject                                    
 * The subject that executed the action 
 * Possible values: [1; 30]
1. activity                                   
 * The activity being executed at the time of the measure 
 * Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
1. Average-TimeBodyAccMeanX                   
1. Average-TimeBodyAccMeanY                   
1. Average-TimeBodyAccMeanZ                   
1. Average-TimeBodyAccStdDeviX                
1. Average-TimeBodyAccStdDeviY                
1. Average-TimeBodyAccStdDeviZ                
1. Average-TimeGravityAccMeanX                
1. Average-TimeGravityAccMeanY                
1. Average-TimeGravityAccMeanZ                
1. Average-TimeGravityAccStdDeviX             
1. Average-TimeGravityAccStdDeviY             
1. Average-TimeGravityAccStdDeviZ             
1. Average-TimeBodyAccJerkMeanX               
1. Average-TimeBodyAccJerkMeanY               
1. Average-TimeBodyAccJerkMeanZ               
1. Average-TimeBodyAccJerkStdDeviX            
1. Average-TimeBodyAccJerkStdDeviY            
1. Average-TimeBodyAccJerkStdDeviZ            
1. Average-TimeBodyGyroMeanX                  
1. Average-TimeBodyGyroMeanY                  
1. Average-TimeBodyGyroMeanZ                  
1. Average-TimeBodyGyroStdDeviX               
1. Average-TimeBodyGyroStdDeviY               
1. Average-TimeBodyGyroStdDeviZ               
1. Average-TimeBodyGyroJerkMeanX              
1. Average-TimeBodyGyroJerkMeanY              
1. Average-TimeBodyGyroJerkMeanZ              
1. Average-TimeBodyGyroJerkStdDeviX           
1. Average-TimeBodyGyroJerkStdDeviY           
1. Average-TimeBodyGyroJerkStdDeviZ           
1. Average-TimeBodyAccMagMean                 
1. Average-TimeBodyAccMagStdDevi              
1. Average-TimeGravityAccMagMean              
1. Average-TimeGravityAccMagStdDevi           
1. Average-TimeBodyAccJerkMagMean             
1. Average-TimeBodyAccJerkMagStdDevi          
1. Average-TimeBodyGyroMagMean                
1. Average-TimeBodyGyroMagStdDevi             
1. Average-TimeBodyGyroJerkMagMean            
1. Average-TimeBodyGyroJerkMagStdDevi         
1. Average-FrequencyBodyAccMeanX              
1. Average-FrequencyBodyAccMeanY              
1. Average-FrequencyBodyAccMeanZ              
1. Average-FrequencyBodyAccStdDeviX           
1. Average-FrequencyBodyAccStdDeviY           
1. Average-FrequencyBodyAccStdDeviZ           
1. Average-FrequencyBodyAccJerkMeanX          
1. Average-FrequencyBodyAccJerkMeanY          
1. Average-FrequencyBodyAccJerkMeanZ          
1. Average-FrequencyBodyAccJerkStdDeviX       
1. Average-FrequencyBodyAccJerkStdDeviY       
1. Average-FrequencyBodyAccJerkStdDeviZ       
1. Average-FrequencyBodyGyroMeanX             
1. Average-FrequencyBodyGyroMeanY             
1. Average-FrequencyBodyGyroMeanZ             
1. Average-FrequencyBodyGyroStdDeviX          
1. Average-FrequencyBodyGyroStdDeviY          
1. Average-FrequencyBodyGyroStdDeviZ          
1. Average-FrequencyBodyAccMagMean            
1. Average-FrequencyBodyAccMagStdDevi         
1. Average-FrequencyBodyBodyAccJerkMagMean    
1. Average-FrequencyBodyBodyAccJerkMagStdDevi 
1. Average-FrequencyBodyBodyGyroMagMean       
1. Average-FrequencyBodyBodyGyroMagStdDevi    
1. Average-FrequencyBodyBodyGyroJerkMagMean   
1. Average-FrequencyBodyBodyGyroJerkMagStdDevi
 * Average from the values of the original data set.
    To find the original name of the variable look at the Readme file, on the section **Naming the variables**.
 * Possible values: [-1; 1]
