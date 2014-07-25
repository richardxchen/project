#step 1: download the dataset zip file from website
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="dataset.zip")

#step 2: unzip and read required files into R 
temp <- unz(description="dataset.zip", filename="UCI HAR Dataset/activity_labels.txt")
activity_l <- read.table(temp, sep="")
temp <- unz(description="dataset.zip", filename="UCI HAR Dataset/features.txt")
features_l <- read.table(temp, sep="")
temp <- unz(description="dataset.zip", filename="UCI HAR Dataset/test/subject_test.txt")
subject_test <- read.table(temp, sep="")
temp <- unz(description="dataset.zip", filename="UCI HAR Dataset/test/X_test.txt")
x_test <- read.table(temp, sep="")
temp <- unz(description="dataset.zip", filename="UCI HAR Dataset/test/y_test.txt")
y_test <- read.table(temp, sep="")
temp <- unz(description="dataset.zip", filename="UCI HAR Dataset/train/subject_train.txt")
subject_train <- read.table(temp, sep="")
temp <- unz(description="dataset.zip", filename="UCI HAR Dataset/train/X_train.txt")
x_train <- read.table(temp, sep="")
temp <- unz(description="dataset.zip", filename="UCI HAR Dataset/train/y_train.txt")
y_train <- read.table(temp, sep="")

# step 3: combine x_test and x_train datasets into x_both
x_both <- rbind(x_test, x_train, deparse.level=0)

# step 4: insert the variable names from features.txt file 
colnames(x_both) <- features_l[,2]

#step 5: search "mean()" and "std()" in varibale names
index_mean <- grep("mean()", colnames(x_both), fixed=TRUE)
index_std <- grep("std()", colnames(x_both), fixed=TRUE)
index <- sort(c(index_mean, index_std))

#step 6: subset x_both into x_meanstd
x_meanstd <- x_both[, index]

#step 7: combine y_test and y_train to generate descriptive activity column
y_both <- rbind(y_test, y_train)
for (i in 1:length(y_both[,1])){
n <- y_both[i,1]
if  (n == 1) {y_both[i,1] <- "WALKING"}
else if (n == 2) {y_both[i,1] <- "WALKING_UPSTAIRS"}
else if (n == 3) {y_both[i,1] <- "WALKING_DOWNSTAIRS"}
else if (n == 4) {y_both[i,1] <- "SITTING"}
else if (n == 5) {y_both[i,1] <- "STANDING"}
else {y_both[i,1] <- "LAYING"}
}

#step 8: insert activity column in the front to generate x_ameanstd
x_ameanstd <- cbind(y_both, x_meanstd)
colnames(x_ameanstd)[1] <- "activity"

#step 9: combine subject_test and subject_train to generate subject column
subject <- rbind(subject_test, subject_train)

#step 10: insert subject column in the front to generate x_sameanstd
x_sameanstd <- cbind(subject, x_ameanstd)
colnames(x_sameanstd)[1] <- "subject"

#step 11: calculate average of each variable for each subject and each activity 
sameanstd <- aggregate(. ~ subject+activity, data=x_sameanstd, FUN=mean)

#step 12: write the tidy dataset into dataset.txt
write.table(sameanstd, "dataset.txt", sep=" ")