# Introduction

A full description about the data set is available at the site where the data was obtained: 
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones Data Set </a>

The data is available at <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">this link</a>. This zip contains a readme.txt file with detailed description about the data and the experiment.

About the experiment (based on previously mentioned readme.txt):
<ul>
<li>The experiments have been carried out with a group of 30 volunteers.</li>
<li>Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.</li>
<li>Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.</li>
<li>The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. </li>
<li>561 variable are calculated for analysis</li>
</ul>

More information read the relevant publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


# Submitted R code
An R code was written for preparing tidy data of mentioned experiment that can be used for later analysis.

## Before run
You should set the working directory inside the extracted "getdata-projectfiles-UCI HAR Dataset.zip" folder.

## Running code
<ol>
<li>Code reads features.txt for getting the names of variables for dataset. We know that for later analysis we won't need for all 561 variables, so variables with only mean and standard deviation values are kept.</li>
<li>For saving computer memory, code reads only the relevant variables (test\from X_test.txt and training\X_training.txt) into separate R data frames. These individual test and training data are merged into one large data frame.</li>
<li>The six performed, coded (from 1 to 6) activity are stored in text files (test\y_test.txt and training\y_training.txt). These are read into two numeric vectors and combined into one numeric vector.</li>
<li>The ID of volunteers are also stored in text files (test\subject_test.txt and training\subject_training.txt). These are also read into two numeric vectors and combined into one numeric vector.</li>
<li>Activities and Volunteers are added to the data frame as "Activity" and "Volunteer".</li>
<li>Activity are recoded for more readable format (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and converted to factor variable.</li>
<li>All variables except the created data frame are removed for releasing some memory for further analysis.</li>
<li>Variables are summarized by the ID of volunteers and activities and exported.</li>

## Output variables
df - Created data frame storing the mean and standard deviation of all measured data.
dfHAR - Summarized data frame of df by the ID of volunteers and activities.

##Output file
The code will result an output txt (HARoutput.txt) into your working directory.
