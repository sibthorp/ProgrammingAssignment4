### Start of File
#/# Clean Environment
rm(list=ls())
file_name <- "UCIdata.zip"
dir_name <- "UCI"
path_name <- "UCI/UCI HAR Dataset"
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!(file.exists(dir_name)))
  { dir.create(dir_name)}

setwd(dir_name)

#/# Load Libraries
library("reshape2")
library ("tidyverse")

#/# Download Files and Extract
if(!file.exists(file_name)){ download.file(url,destfile=file_name, method="curl") }
if(!file.exists(path_name)){ unzip(file_name, files = NULL, exdir=dir_name) }

#/# Read Data from Files
# Get features for column names
features <- read_delim(paste(path_name,"/features.txt", sep = ""), " ", col_names = F) %>% pull(2)

# Read Train
x_train <- read_table(paste(path_name,"/train/X_train.txt", sep=""), col_names = features)
y_train <- read_table(paste(path_name,"/train/y_train.txt", sep=""), col_names = "activity", col_types = cols(col_factor(levels=1:6)))
subject_train <- read_table(paste(path_name,"/train/subject_train.txt", sep=""), col_names = "subject")

train_data <- bind_cols(subject_train,y_train, x_train) %>% mutate(set="train") %>% select(set, everything())

# Read Test
x_test <- read_table(paste(path_name,"/test/X_test.txt", sep=""), col_names = features)
y_test <- read_table(paste(path_name,"/test/y_test.txt", sep=""), col_names = "activity", col_types = cols(col_factor(levels=1:6)))
subject_test <- read_table(paste(path_name,"/test/subject_test.txt", sep=""), col_names = "subject")

test_data <- bind_cols(subject_test,y_test, x_test) %>% mutate(set="test") %>% select(set, everything())

# Remove Objects
rm(list = c("y_train","x_train","subject_train"))
rm(list = c("y_test","x_test","subject_test"))

#/# Merge Training and Test into single Data Set
merge_data <- bind_rows(train_data,test_data)
# Remove Objects
rm(list = c("train_data","test_data"))

#/# Subset Mean and SD
merge_data <- merge_data %>% select(1:3, contains("mean()"), contains("std()"))

#/# Label Data Set Activities
activities <- read_delim(paste(path_name,"/activity_labels.txt", sep=""), " ", col_names = F) %>% pull(2)
levels(merge_data$activity) <- activities

#/# Create Tidy Data Set
tidy_data <- merge_data %>% group_by(subject, activity) %>% summarize_at(-(1:3), mean, na.rm=T)
# Prettyify Feature Names
feat<-names(tidy_data)
feat<-gsub('-mean', 'Mean', feat)
feat<-gsub('-std', 'StdDev', feat)
feat<-gsub('[()]', '', feat)
feat<-gsub('^t', 'Time', feat)
feat<-gsub('^f', 'Fourier', feat)
names(tidy_data)<-feat
# Remove Objects
rm(list = c("merge_data","feat"))

#/# Write Tidy Data Set to File
write.table(tidy_data, file="./tidy_data.txt")

#/# End & Clean-up
rm(list = c("tidy_data"))
rm(list=ls())

