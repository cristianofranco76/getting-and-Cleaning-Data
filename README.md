#Project Repo - Script run_analysis.R
## Getting and Cleaning Data Course

The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. I created an R script called <b>run_analysis.R</b> that does the steps describes bellow. There is no parameter passed to this function.
 
The function returns two tidy data files stored in the a specific working directory (defined inside the script):

  1) <b>"tidy_data.txt"</b> -> processed data according to the steps described bellow     
  2) <b>"mean_data.txt"</b> -> means of all the variables of the tidy data set
 
<b>Importante notes:</b> 

* Required to install the package: <b>"dplyr"</b> once some function of this package are larged used in the R Script function.
* Both mentioned files are available in this repo according to the output of this script.

<b>Function main steps:</b>

  1. Set my own Working directory: 
  "/Users/cristianomendesfranco/Desktop/Cursos online/Data Science/Getting and Cleaning Data"

  2. Get a sample data set from the Samsung Galaxy S smartphone and store in a temporary file ("temp.zip"):
  <link> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip </link>

 Notes: 
 * A full description of this sample data set is obtained at:    <link>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</link>
 
 * Reference: This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited. Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

  3. Unzip all the files to the current Working Directory
  Note: all the files are unziped at the same folder - there is no junkpaths, and the temporary file is deleted after this proccess.

  4. Read Labels and Features Tables 
  
  5. Tidy the <b>Training data set </b>
  
     a. Read the training data set as well as the subject and labels
        Note: mutate function (dlyr packaged) is used to insert the activity labels names (instead of numbers)

     b. Bind labels, data & a new variable called data_type ("training") to mark the measurements of this type of subjects.
     Note: I used the binding functions here available at dplyr package - bind_cols() and mutate from "dplyr"package to insert the new variable.
     
  6. Tidy the <b>Test data set </b>
  
     a. Read the test data set as well as the subject and labels
        Note: mutate function (dlyr packaged) is used to insert the activity labels names (instead of numbers)

     b. Bind labels, data & a new variable called data_type ("test") to mark the measurements of this type of subjects.
     Note: I used the binding functions here available at dplyr package - bind_cols() and mutate from "dplyr"package to insert the new variable.

Note: all the used variables are removed after working with the files.

  7. Merges the training and test sets creating one unique dataset file
  

  6. Select only the measurements on the mean "mean()" and standard deviation "std()" for each measurement are selected. 
  Note: I used the select all created variables during the process are removed from memory.

  7. Creat independent tidy data set with the average of each variable grouped by activity and subject
  
  7. Write two new tidy data sets (text files) as mentioned above
  Note: the files can be read using the function: read.table("filename.txt")


