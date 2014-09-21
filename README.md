Course-Project
==============

Getting and cleaning Data


Course-Project
==============

Getting and cleaning Data


The problem posted consited of the following : 


 You should create one R script called run_analysis.R that does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 

    From the data set in step 4, creates a second, 
    independent tidy data set with the average of each variable for each activity and each subject.
    
    My approach stepwise is as follows, ( I have aslo given sufficent comments in r script file 
    so that code is easier to understand) :
    
      1) Download raw files
      2) Unzip the file in the 'RAW' folder 
      3) Read the activty labels and feature list so that we have correct labels
      4) Read the activity data(in X_train/test file)  and the activities(in y file )
      5) In the tidy data add only releavant columns (i.e. columsn that have means
      6) Correct the names( as given in feature list for features, and activity list for activities)
      7) Combining the activity and feature tables(directly using cbind)
      8) Repeating steps 4-7 for the test dataset
      9) Combining both the tables in one tidy data set
      10) Summarise the tidy data on the subject and the activity , 
          i.e what is the average 'tBodyAcc-mean-X' value for subject 5 for the activity walking ?
      11) Write the output of 10 to a text file 
      
      
     Have fun :)
