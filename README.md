# Description

This is the data and scripts for the End of Course project for the Coursera Course "Getting and Cleaning Data"

The data source for the project is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The script run_analysis.R reads in the test and training data and combines them into one single dataset.  The dataset is then transformed into another dataset (tiny_data.csv) when contains all the data columns groups and averaged over subject and evercise.

The script assumes that it is running in the same directory as the downloaded data and that test and training data are in ./test/ and ./train/ respectively