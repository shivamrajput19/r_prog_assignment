library(plyr)

## First we will load the training and test data sets 
## and name the variables appropriately
## from the data downloaded and stored in the file UCI

## First the train data
x_train <- read.table("./UCI/train/X_train.txt")
y_train <- read.table("./UCI/train/y_train.txt")
subject_train <- read.table("./UCI/train/subject_train.txt")

## Now the test data
x_test <- read.table("./UCI/test/X_test.txt")
y_test <- read.table("./UCI/test/y_test.txt")
subject_test <- read.table("./UCI/test/subject_test.txt")

## Merging the data sets together in a single data set
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

## Getting the feature names for mean and standard deviation
features <- read.table("./UCI/features.txt")
mean_std <- grep("(mean|std)\\(\\)", features[, 2])

## Taking subset of the data sets for mean and standard deviation 
## and storing those value back in them and correcting the names
x_data <- x_data[, mean_std]
names(x_data) <- features[mean_std, 2]

## Getting the names of the activities and correcting
## them in the data sets
activity <- read.table("./UCI/activity_labels.txt")
y_data[,1] <- activity[y_data[,1], 2]
names(y_data) <- "activity"
names(subject_data) <- "subject"

## Binding the data together
everything <- cbind(x_data, y_data, subject_data)

## Getting the averages of each activity in each column
## and storing it in a tidy data set
created <- ddply(everything, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(created, "new_data.txt", row.names = FALSE)