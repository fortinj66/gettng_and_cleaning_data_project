library(reshape2)

DataLabels = read.table('features.txt')

# Load Test Data and Label Columns
testSubjects = read.table('test/subject_test.txt')
testExercise = read.table('test/y_test.txt')
testData = read.table('test/X_test.txt')
names(testSubjects) = "subject"
names(testExercise) = "exercise"
names(testData) = DataLabels$V2

# Load Training Data and Label Colums
trainSubjects = read.table('train/subject_train.txt')
trainExercise = read.table('train/y_train.txt')
trainData = read.table('train/X_train.txt')
names(trainSubjects) = "subject"
names(trainExercise) = "exercise"
names(trainData) = DataLabels$V2

# Get Column labels with "mean" or "std" in them
SubsetDataLabels = as.vector(DataLabels[grep("mean[^a-zA-Z]|std",DataLabels$V2),"V2"])

# Subset data 
testDataSubset = testData[SubsetDataLabels]
trainDataSubset = trainData[SubsetDataLabels]

# Get list of all Column names
SubsetDataLabels = names(testDataSubset)

# Make column name more appropriate
SubsetDataLabels = gsub("Acc", "accel",SubsetDataLabels)
SubsetDataLabels = gsub("Mag", "magnitude",SubsetDataLabels)
SubsetDataLabels = gsub("-", "",SubsetDataLabels)
SubsetDataLabels = gsub("mean\\(\\)", "mean",SubsetDataLabels)
SubsetDataLabels = gsub("std\\(\\)", "standarddeviation",SubsetDataLabels)
SubsetDataLabels = tolower(SubsetDataLabels)

# Apply updated labels
names(testDataSubset) = SubsetDataLabels
names(trainDataSubset) = SubsetDataLabels

# Combine into one large dataset
testDataFinal = cbind(testSubjects,testExercise,testDataSubset)
trainDataFinal = cbind(trainSubjects,trainExercise,trainDataSubset)
DataFinal = rbind(testDataFinal,trainDataFinal)

# Change activity to text description
ActivityLabels = read.table("activity_labels.txt")
DataFinal[,2] = ActivityLabels[DataFinal[,2],2]

# Make 'Tall and Skinny Dataset'
meltDataFinal = melt(DataFinal, c("subject", "exercise"), SubsetDataLabels[-(1:2)])

# Create tidy datset of the mean of all columns grouped by subject and exercise
tidyData = dcast(meltDataFinal, subject + exercise ~ SubsetDataLabels[-(1:2)],mean)

write.csv(tidyData, "./tidy_data.csv")