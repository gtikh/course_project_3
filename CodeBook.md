CodeBook
========

### The Raw Data Source
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set": 
The full description of raw data is here:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The raw data is available from here:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

First, I merged the training and the test sets of data. The merged data consist of three files:

* X - 561 measures from the raw data (X_train and X_test)

* Y - train and test labels, indicating activity type

* subject - subjects corresponding to X.

I selected 79 of 561 measures, which correspond to mean and standard deviation values. The resulting tidy data file is an averages of 79 measures for each subject and each activity type. 