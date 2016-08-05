# Introduction

This project involves the transformation of the dataset taken from [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) into a condensed form of the dataset consisting of the mean of all data columns grouped by subject and exercise.

* several transformations were applied:
** test and training data were combined into one dataset along with participant and exercise data.  These had been seperated prior
** Column names were added and modified for readibility.  See original dataset features_info.txt for column descriptions
** final dataset was made "Tall and Skinny" using the melt function with subject and exercise as keys
** final tidy dataset was created using dcast() grouped by subject and exercise and taking the mean() of the data column
** The tiny dataset was saved to "tidy_data.csv"
