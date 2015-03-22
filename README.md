### Course Project Repo - Getting-and-Cleaning-Data
###  The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. 
### 

R script called <b>run_analysis.R</b> that does the steps describes bellow. There is no parameter passed to the function.
 
The function returns two tidy data files stored in the set Working directory:
     
  1) "tidy_data.txt" -> processed data according to the steps described bellow     
  2) "mean_data.txt" -> means of all the variables of the tidy data set
 
Importante note: Required to install the package: "dplyr" once some function of this package are larged used in the R Script function.

Function main steps:

  1. Set my own Working directory: 
  "/Users/cristianomendesfranco/Desktop/Cursos online/Data Science/Getting and Cleaning Data"

  2. Get the data set from the Samsung Galaxy S smartphone and store in a temporary file ("temp.zip"):
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
    * A full description is available at the site where the data was obtained: 
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
    
  3. Unzip all the files to the current Working Directory
  Note: all the files are unziped in the same folder - there is no junkpaths and the temporary file is deleted after this proccess.

  4. Read Labels and Features Tables   

  5. Merges the training and test sets creating one tidy dataset file
    Only the measurements on the mean and standard deviation for each measurement are selected. 

    Note: all created variables during the process are removed from memory.

  6. Creat independent tidy data set with the average of each variable grouped by activity and subject
  
  7. Write two new tidy data sets (text files) as mentioned above
  Note: the files can be read using the function: read.table("filename.txt")
