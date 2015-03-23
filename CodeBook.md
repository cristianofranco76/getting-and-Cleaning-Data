## CodeBook run_analisys()

The function returns two tidy data files stored in the working directory.

As described in the <link> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</link>, the variables selected for this database come from the accelerometer and gyroscope 3-axial raw signals <b> tAcc-XYZ</b> and <b>tGyro-XYZ</b>. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (<b>tBodyAcc-XYZ</b> and <b>tGravityAcc-XYZ</b>) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (<b>tBodyAccJerk-XYZ</b> and <b>tBodyGyroJerk-XYZ</b>). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (<b>tBodyAccMag</b>, <b>tGravityAccMag</b>, <b>tBodyAccJerkMag</b>, <b>tBodyGyroMag</b>, <b>tBodyGyroJerkMag</b>). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing <b>fBodyAcc-XYZ</b>, <b>fBodyAccJerk-XYZ</b>, <b>fBodyGyro-XYZ</b>, <b>fBodyAccJerkMag</b>, <b>fBodyGyroMag</b>, <b>fBodyGyroJerkMag</b>. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables selected from these signals and stored in this files are the mean and standard deviation analisys denoted by the names as follow:
"mean()": Mean value
"std()": Standard deviation

Description of the variables stored in the output files processed by the script/function <b>run_analisys()"</b>

1) "tidy_data.txt" with <b>89 variables</b> as following:

"subject" ->  
"activity"-> 
"data_type" 
"tBodyAcc.mean...X" 
"tBodyAcc.mean...Y"
"tBodyAcc.mean...Z" 
"tGravityAcc.mean...X" 
"tGravityAcc.mean...Y"
"tGravityAcc.mean...Z"
"tBodyAccJerk.mean...X"
"tBodyAccJerk.mean...Y"
"tBodyAccJerk.mean...Z" "tBodyGyro.mean...X" "tBodyGyro.mean...Y" "tBodyGyro.mean...Z" "tBodyGyroJerk.mean...X" "tBodyGyroJerk.mean...Y" "tBodyGyroJerk.mean...Z" "tBodyAccMag.mean.." "tGravityAccMag.mean.." "tBodyAccJerkMag.mean.." "tBodyGyroMag.mean.." "tBodyGyroJerkMag.mean.." "fBodyAcc.mean...X" "fBodyAcc.mean...Y" "fBodyAcc.mean...Z" "fBodyAcc.meanFreq...X" "fBodyAcc.meanFreq...Y" "fBodyAcc.meanFreq...Z" "fBodyAccJerk.mean...X" "fBodyAccJerk.mean...Y" "fBodyAccJerk.mean...Z" "fBodyAccJerk.meanFreq...X" "fBodyAccJerk.meanFreq...Y" "fBodyAccJerk.meanFreq...Z" "fBodyGyro.mean...X" "fBodyGyro.mean...Y" "fBodyGyro.mean...Z" "fBodyGyro.meanFreq...X" "fBodyGyro.meanFreq...Y" "fBodyGyro.meanFreq...Z" "fBodyAccMag.mean.." "fBodyAccMag.meanFreq.." "fBodyBodyAccJerkMag.mean.." "fBodyBodyAccJerkMag.meanFreq.." "fBodyBodyGyroMag.mean.." "fBodyBodyGyroMag.meanFreq.." "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.meanFreq.." "angle.tBodyAccMean.gravity." "angle.tBodyAccJerkMean..gravityMean." "angle.tBodyGyroMean.gravityMean." "angle.tBodyGyroJerkMean.gravityMean." "angle.X.gravityMean." "angle.Y.gravityMean." "angle.Z.gravityMean." "tBodyAcc.std...X" "tBodyAcc.std...Y" "tBodyAcc.std...Z" "tGravityAcc.std...X" "tGravityAcc.std...Y" "tGravityAcc.std...Z" "tBodyAccJerk.std...X" "tBodyAccJerk.std...Y" "tBodyAccJerk.std...Z" "tBodyGyro.std...X" "tBodyGyro.std...Y" "tBodyGyro.std...Z" "tBodyGyroJerk.std...X" "tBodyGyroJerk.std...Y" "tBodyGyroJerk.std...Z" "tBodyAccMag.std.." "tGravityAccMag.std.." "tBodyAccJerkMag.std.." "tBodyGyroMag.std.." "tBodyGyroJerkMag.std.." "fBodyAcc.std...X" "fBodyAcc.std...Y" "fBodyAcc.std...Z" "fBodyAccJerk.std...X" "fBodyAccJerk.std...Y" "fBodyAccJerk.std...Z" "fBodyGyro.std...X" "fBodyGyro.std...Y" "fBodyGyro.std...Z" "fBodyAccMag.std.." "fBodyBodyAccJerkMag.std.." "fBodyBodyGyroMag.std.." "fBodyBodyGyroJerkMag.std.."



2) "mean_data.txt" -> means of all the variables of the tidy data set
