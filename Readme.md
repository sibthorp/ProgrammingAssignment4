---
title: Readme.md
author: Bryan Sibthorp
date: September 15, 2018
output: html_document
---

#Readme for the tidy dataset

The structure below indicates the major sections of the run_analysis.R file.  The requested activities from the programming assignment are in the section that most correctly identifies where this activity is performed.

Start the program in the directory of your choice.  It will create a subdirectory that can be cleaned-up after the analysis is completed.  It will clear the R environment, load the necessary libraries, and write the tidy data set into the first subdirectory upon completion.  It will attempt to clean-up the unneccessary objects as it proceeds.

The zip file is downloaded each time from the URL provided in the programming assignment.  

- @/@ Clean Environment
- @/@ Load Libraries
- @/@ Download Files and Extract
- @/@ Read Data from Files

> - @ Get features for column names
> - @ Read Train
> - @ Read Test

- @/@ Merge Training and Test into single Data Set

> Merges the training and the test sets to create one data set.

- @/@ Subset Mean and SD

> Extracts only the measurements on the mean and standard deviation for each measurement.

- @/@ Label Data Set Activities

> Uses descriptive activity names to name the activities in the data set

- @/@ Create Tidy Data Set

> - @ Prettyify Feature Names

> Appropriately labels the data set with descriptive variable names.

- @/@ Write Tidy Data Set to File

> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- @/@ End & Clean-up


