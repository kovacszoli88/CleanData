## Input files
activity_labels.txt - Coded values of activities

features.txt - Variable names of measurements

test\subject_test.txt - IDs of volunteers (test set)

training\subject_training.txt - IDs of volunteers (training set)

test\X_test.txt.txt - Measurements and preprocessed data (test set)

training\X_training.txt.txt - Measurements and preprocessed data (training set)

test\y_test.txt - Codes of activities (test set)

training\y_training.txt - Codes of activities (training set)


## Intermediate variables
df.col.names - Character vector of variables names
df.colclasses - Charachter vector used for skip unrelevant columns from files
dfTrain - Train data set
dfTest - Test data set

yTest - Numeric vector of activite codes (test)
yTrain - Numeric vector of activite codes (training)
y - Numeric vector of activite codes (training and test set)

subjectTest - Numeric vector of volunteer IDs (test)
subjectTrain - Numeric vector of volunteer IDs (training)
subject - Numeric vector of volunteer IDs (training and test set)

Activity - Character vector for storing activity labels
mActivity - Matrix storing codes in first column and labels in second columns

## Output variables
<ul>
<li>df - Created data frame storing the mean and standard deviation of all measured data.</li>
<li>dfHAR - Summarized data frame of df by the ID of volunteers and activities.</li>
</ul>
