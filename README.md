# GettingAndCleaningDataProject
This is the Project for Getting and Ceaning Data

#Files
run_analysis.R contain the code
CodeBook.md is the file that explain the valiables.
averageData.txt is the  output of the 5th step

#Steps
run_analysis.R is teh script that run all the 5 steps ask in the project and finally generate the result file. 
In Step1, it merge the data using rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
Finally, generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averagedata.txt , and uploaded to this repository.
