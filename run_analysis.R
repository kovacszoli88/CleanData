# # Set working directory for myself
# setwd('C:\\!PROJECTS\\024 Coursera\\Getting and cleaning Dataset')


#########################################################################
# Note: I have not followed the described order in text,
#       because I find logically better my solution due to my old PC :)
#########################################################################

# Get Header names for labeling data frames
df.col.names = scan("features.txt", what="character", sep=NULL)

# This is structured in this way:
# [1] "1"                 "tBodyAcc-mean()-X"
# [3] "2"                 "tBodyAcc-mean()-Y"
# But only every second is necessary; get them
df.col.names = df.col.names[c(FALSE, TRUE)]

# Define classes - for skipping unneccessary columns (use only *mean()* and *std()* columns)
#                  required columns are numeric, the others are NULL
df.colclasses = as.character(grepl("mean\\(\\)|std\\(\\)",df.col.names))
df.colclasses <- unname(sapply(df.colclasses, 
                               function(x){c("numeric","NULL")[match(x, c("TRUE","FALSE"))]}))

# Drop brackets "()" in column names
df.col.names = gsub(pattern = "\\(\\)",replacement = "", x = df.col.names)

# Get test and train dataset as data frame
# and label the data frames with descriptive variable names
dfTrain = read.table("train/X_train.txt", header = F, stringsAsFactors = F,
                     colClasses=df.colclasses, col.names=df.col.names)
dfTest = read.table("test/X_test.txt", header = F, stringsAsFactors = F,
                    colClasses=df.colclasses, col.names=df.col.names)

# Merge the two datasets into one data frame 
df = rbind(dfTrain, dfTest)

# Read activity IDs from txt files as numeric vector and combining them
yTest = as.numeric(scan("test/y_test.txt", what="character", sep=NULL))
yTrain = as.numeric(scan("train/y_train.txt", what="character", sep=NULL))
y = c(yTrain, yTest)

# Read volunteers IDs from txt files as numeric vector and combining them
subjectTest = as.numeric(scan("test/subject_test.txt", what="character", sep=NULL))
subjectTrain = as.numeric(scan("train/subject_train.txt", what="character", sep=NULL))
subject = c(subjectTrain, subjectTest)

# Add Volunteer and Activity IDs and names to the data frame as new columns
df = cbind(y, subject, df)
names(df)[1:2]= c("Activity","Volunteer")

# Read activities, and transform to a matrix with two columns
# first contains 1,2,3,4,5,6; second contains activity labels
Activity = scan("activity_labels.txt", what="character", sep=NULL)
mActivity = matrix(Activity, byrow = T, nrow=6, ncol=2)

# Replace numeric values as descriptive names and convert them to factors
df$Activity <- sapply(df$Activity, function(x){mActivity[,2][match(x, mActivity[,1])]})
df$Activity = factor(df$Activity)
df$Volunteer = factor(df$Volunteer)

# Release memory, delete all variable except df, the large data frame
rm(list=setdiff(ls(), "df"))

# Create the required data set for uploading
df2 = aggregate(. ~ Activity + Volunteer , data = df, mean)

# Write table to csv file
write.table(df2, file="KZ_HUN.txt", row.name=FALSE) 
