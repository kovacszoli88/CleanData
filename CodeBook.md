## Input files
<ul>
<li>activity_labels.txt - Coded values of activities</li>
<li>features.txt - Variable names of measurements</li>
<li>test\subject_test.txt - IDs of volunteers (test set)</li>
<li>training\subject_training.txt - IDs of volunteers (training set)</li>
<li>test\X_test.txt.txt - Measurements and preprocessed data (test set)</li>
<li>training\X_training.txt.txt - Measurements and preprocessed data (training set)</li>
<li>test\y_test.txt - Codes of activities (test set)</li>
<li>training\y_training.txt - Codes of activities (training set)</li>
</ul>

## Intermediate variables
<ul>
<li>df.col.names - Character vector of variables names</li>
<li>df.colclasses - Charachter vector used for skip unrelevant columns from files</li>
<li>dfTrain - Train data set</li>
<li>dfTest - Test data set</li>
<li>yTest - Numeric vector of activite codes (test)</li>
<li>yTrain - Numeric vector of activite codes (training)</li>
<li>y - Numeric vector of activite codes (training and test set)</li>
<li>subjectTest - Numeric vector of volunteer IDs (test)</li>
<li>subjectTrain - Numeric vector of volunteer IDs (training)</li>
<li>subject - Numeric vector of volunteer IDs (training and test set)</li>
<li>Activity - Character vector for storing activity labels</li>
<li>mActivity - Matrix storing codes in first column and labels in second columns</li>
</ul>

## Output variables
<ul>
<li>df - Created data frame storing the mean and standard deviation of all measured data.</li>
<li>dfHAR - Summarized data frame of df by the ID of volunteers and activities.</li>
</ul>
