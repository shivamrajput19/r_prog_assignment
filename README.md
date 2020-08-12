# r_prog_assignment
Peer Graded Assignment

This r code first reads all the data from the file UCI containing the data sets and stores them in the variables x_test, x_train, y_test, y_train, subject_test, subject_train
Then these data sets are merged together to form new data sets x_data, y_data, subject_data
To get the mean and standard deviation, the features data set is loaded in r from the file and stored in the variable features
From features, using the grep function, the mean and std are searched and found and then stored in the variable mean_std
Since we will only be working with the mean and standard deviation data, the x_data is subsetted using x_data[, mean_std] and the names of the data set are changed accordingly
Now the activity variable is formed by loading the activity_label.txt and the y_data changed accordingly to match the names as per their values in numbers
The data sets y_data and subject_data are given appropriate names and then all the data is merged together in the data set named everything

Now the average of all the variables in each column is taken and stored in the data set created 
This new data set is now stored in a text file named new_data.txt
