## Code Book - Course Project: Getting and Cleaning Data:
Human Activity Recognition (HAR) Using Smart Phones Data Set


### Overview
This code book describes the data set, variables and any transformation perfomed to clean up the data set.

### The Data Set
The original data set provided for this project represents data collected from the accelorometers and gyroscopes from the Samsung Galaxy S smartphone. A full 
description is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the original data set is can be
downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

This data was collected from a series a experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities:
walking, walking upstaris, walking downstairs, sitting, standing and laying. This data set came with two data subsets, where 70% of the volunteers was selected for 
generating the **training data** and 30% the **test data.** 

### The Variables
With the aim the provide an easier understanding of the variables within the data set, the variables in the original data set where changed to a more descriptive
name for the new data set. Below are the name changes done to the variables:
* 'mean' changed to '''Mean'''
* `std` changed to '''StdDev''' to describe the standard deviation.
* ´t´ changed to '''Time'''
* '''f''' changed to '''Frequency'''
* '''Acc''' changed to '''Accelerometer'''
* '''Gyro''' changed to '''Gyroscope'''
* '''Mag''' changed to '''Magnitude'''
* '''BodyBody''' changed to '''Body'''; this change was made to correct a typo error.

### Data Transformation

In order the **merge** both data subsets **(training and test data sets)**, common variables names were created in both data subsets, '''activityid''' and '''subjectid'''. 
From this new merged data, **only the measurements for the mean and standard deviations are extracted**, creating the final data set.

From this final data set, the names of the variables are then changed to a more descriptive name to make the varaibles self explanatories and make it easier when
reading the data set. The final tidy data set can be found in this repository under '''finaltidydataset.txt'''






