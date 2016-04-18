###Getting and Cleaning Data: Course Project

This is a Course Project repository for the Coursera course "Getting and Cleaning data". It contains the script _run_analysis.R_ and the resulting text file _tidy_data.txt_.

The _run_analysis.R_ script set the working directory which should contain the UCI HAT Dataset directory. In my case it is on the Desltop. After that does the following:
    
1. Merges the training and the test sets to create one data set. The resulting data set consist of X, Y and subject.
    
2. Extracts only the measurements on the mean and standard deviation for each measurement. The first 46 columns - the mean measurements, the next 33 columns - standard deviation measurements.
    
3. Uses descriptive activity names to name the activities in the data set. Read _activity_labels_ file and create an object containing activity names.
    
4. Appropriately labels the data set with descriptive variable names. Read _features_ file and change the data from step 1 according to this file.
    
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Create _tidy data_ using the dplyr and lazyeval packages.

