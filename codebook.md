# Introduction

•  run_analysis.R is teh script that run all the 5 steps ask in the project and finally generate the result file.
•  In Step1 it merge the data using rbind()  function. By similar, we address those files having the same number of columns and referring to the same entities.
• Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from  features.txt .
• As activity data is addressed with values 1:6, we take the activity names and IDs from  activity_labels.txt  and they are substituted in the dataset.
• On the whole dataset, those columns with vague column names are corrected.
• Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called  averages_data.txt , and uploaded to this repository.



#Variables
• xTrainData ,  xTestData, yTrainData , yTestData ,  sTrainData  and  sTestData  contain the data from the downloaded files.
• xMergeData ,  yMergeData  and  sMergeData  is the merged data.
• features  contains the correct names for the  xMergedata  dataset, which are applied to the column names stored in  featureMeanAndStd , a numeric vector used to extract the desired data.
• similarly with activity names through the  aTable  variable.
• Finally, averageData  contains the requied averages which will be later stored in a  .txt  file.  ddply()  from the plyr package is used to apply  colMeans()  and ease the development.
