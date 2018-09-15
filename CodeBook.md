---
title: CodeBook.md
author: Bryan Sibthorp
date: September 15, 2018
output: html_document
---


#CodeBook for the tidy dataset

##Data source

The specific fileset (zip) that is used to create the tidy data set was obtained from : http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original source of the zip file indicate above can be obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Feature Selection 

The following text is exerpted from the README.txt in the zip file above.

_[Start of Exerpt]_

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

=========================================

Note: features are normalized and bounded within [-1,1].

_[End of Exerpt]_

##Feature Reduction
The total number of variables in each observation were filtered to only include Mean and Standard Deviation values.  

##Feature Summarization
This filtered data set was then grouped by subject and activity and the mean of all values of each combination for each of the 68 variables was calculated.

##Feature Text Enhancements
The raw feature assignments were slightly improved:

- replace 't' by 'Time'
- replace 'f' by 'Fourier'
- replace 'mean()' by 'Mean'
- replace 'std()' by 'StdDev

Examples:

- tBodyAcc-mean()-X ==> TimeBodyAccMean-X
- fBodyAcc-std()-Z ==> FourierBodyAccStdDev-Z

All other aspects of the variable names were kept the same as the original features.txt file within the zip.

#Appendix - Individual Features in Tidy Data set file
* subject                          
* activity                         
* TimeBodyAccMean-X               
* TimeBodyAccMean-Y                
* TimeBodyAccMean-Z                
* TimeGravityAccMean-X            
* TimeGravityAccMean-Y             
* TimeGravityAccMean-Z             
* TimeBodyAccJerkMean-X           
* TimeBodyAccJerkMean-Y            
* TimeBodyAccJerkMean-Z            
* TimeBodyGyroMean-X              
* TimeBodyGyroMean-Y               
* TimeBodyGyroMean-Z               
* TimeBodyGyroJerkMean-X          
* TimeBodyGyroJerkMean-Y           
* TimeBodyGyroJerkMean-Z           
* TimeBodyAccMagMean              
* TimeGravityAccMagMean            
* TimeBodyAccJerkMagMean           
* TimeBodyGyroMagMean             
* TimeBodyGyroJerkMagMean          
* FourierBodyAccMean-X             
* FourierBodyAccMean-Y            
* FourierBodyAccMean-Z             
* FourierBodyAccJerkMean-X         
* FourierBodyAccJerkMean-Y        
* FourierBodyAccJerkMean-Z         
* FourierBodyGyroMean-X            
* FourierBodyGyroMean-Y           
* FourierBodyGyroMean-Z            
* FourierBodyAccMagMean            
* FourierBodyBodyAccJerkMagMean   
* FourierBodyBodyGyroMagMean       
* FourierBodyBodyGyroJerkMagMean   
* TimeBodyAccStdDev-X             
* TimeBodyAccStdDev-Y              
* TimeBodyAccStdDev-Z              
* TimeGravityAccStdDev-X          
* TimeGravityAccStdDev-Y           
* TimeGravityAccStdDev-Z           
* TimeBodyAccJerkStdDev-X         
* TimeBodyAccJerkStdDev-Y          
* TimeBodyAccJerkStdDev-Z          
* TimeBodyGyroStdDev-X            
* TimeBodyGyroStdDev-Y             
* TimeBodyGyroStdDev-Z             
* TimeBodyGyroJerkStdDev-X        
* TimeBodyGyroJerkStdDev-Y         
* TimeBodyGyroJerkStdDev-Z         
* TimeBodyAccMagStdDev            
* TimeGravityAccMagStdDev          
* TimeBodyAccJerkMagStdDev         
* TimeBodyGyroMagStdDev           
* TimeBodyGyroJerkMagStdDev        
* FourierBodyAccStdDev-X           
* FourierBodyAccStdDev-Y          
* FourierBodyAccStdDev-Z           
* FourierBodyAccJerkStdDev-X       
* FourierBodyAccJerkStdDev-Y      
* FourierBodyAccJerkStdDev-Z       
* FourierBodyGyroStdDev-X          
* FourierBodyGyroStdDev-Y         
* FourierBodyGyroStdDev-Z          
* FourierBodyAccMagStdDev         
* FourierBodyBodyAccJerkMagStdDev 
* FourierBodyBodyGyroMagStdDev     
* FourierBodyBodyGyroJerkMagStdDev

