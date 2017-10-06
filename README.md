## Getting and Cleaning Data - Course Project

### Overview
The goal of this course project is to prepare tidy data that can be used for later analysis. The data set used here, 
it is the data collected in wearable computers, in particular, the data collected from the accelerometers from the
Samsung Galaxy S smartphone. A full description of the data set is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones);
and this is the [Original Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Files
This repositiroty contains the following files:
1. `README.md`; this file summarizes the files in this repository and explains the analysis done to the data.
2. `CodeBook.md`; describes the variables, the data, and any transformations performed to clean up the data.
3. `run_analysis.R`; this is the R script used to create the new data set.
4. `tidydataset.txt`; this is the resulting new data set.

### Project Synopsis
1. The [Original Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) collected
from accelerometers and gyroscope from the Samsung Galaxy S smartphone were provided. This data set was downloaded,
unzipped and read into a file.
2. Alongside the two data sets provided, training and test data sets, files explaning features and the activity labels were
used to identified the variables used in the original data set.
3. In order to merge the training and test data, it was necessary to identified or create a common variable that will allow
to connect both data sets.
4. Once both data sets were merged into a new data set, only measurements related to mean and standard deviation were
extracted.
5. and variable's names were re-labeled using a more descriptive name for each variable.
6. Finally, the new independent data set was converted into a textfile called `tidydataset.txt` that you can find in
this repository.

### Additional Information
For a more detailed information please refer to the `CodeBook.md` and the R script `run_analysis.R` from this
repository.
