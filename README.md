Coursera Data Science - Getting and Cleaning Data
========================================================

Course Project
--------------
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

###Submitted items: 

1. a tidy data set - dataset.txt
2. a link to a Github repository with run_analysis.R script for performing the analysis
3. a code book that describes the variables, the data, and work performed to clean up the data called CodeBook.md. 
4. a README.md in the repo. This repo explains how all of the scripts work and how they are connected. 

The data linked below were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The URL for the data of the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###The implementation

The run_analysis.R implements the 12 steps as shown below and generates the tidy dataset (dataset.txt) at the end.

Step 1: download the dataset zip file from website

Step 2: unzip and read required files into R 

Step 3: combine x_test and x_train datasets into x_both

Step 4: insert the variable names from features.txt file 

Step 5: search "mean()" and "std()" in varibale names

Step 6: subset x_both into x_meanstd using index generated in the last step

Step 7: combine y_test and y_train to generate descriptive activity column

Step 8: insert activity column in the front to generate x_ameanstd

Step 9: combine subject_test and subject_train to generate subject column

Step 10: insert subject column in the front to generate x_sameanstd

Step 11: calculate average of each variable for each subject and each activity 

Step 12: write the tidy dataset into dataset.txt
