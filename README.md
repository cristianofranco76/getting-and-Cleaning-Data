#Project Repo - Script run_analysis.R
## Getting and Cleaning Data Course

The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. I created an R script called <b>run_analysis.R</b> that does the steps describes bellow. <b>There is no parameter passed to this function.</b>
 
The function returns <b>two tidy data files</b> stored in the current set working directory (*defined inside the script):

  1) <b>"tidy_data.txt"</b> -> processed data according to the steps described bellow
  <link>https://github.com/cristianofranco76/getting-and-Cleaning-Data/blob/master/tidy_data.txt</link>
  
  2) <b>"mean_data.txt"</b> -> means of all the variables of the tidy data set
 <link>https://github.com/cristianofranco76/getting-and-Cleaning-Data/blob/master/mean_data.txt</link>

<b>Importante notes:</b> 

* Required to install the package: <b>"dplyr"</b> once some functions of this package are larged used in the R Script as described in the steps.
* Both mentioned files are available in this repo according to the output of this script. The files can be read using the function: read.table("filename.txt")

<b>Function/Script main steps:</b>

  1. <b>Set my own Working directory:</b> 
  "/Users/cristianomendesfranco/Desktop/Cursos online/Data Science/Getting and Cleaning Data"

  2. <b>Get a sample data set </b> from the link (Samsung Galaxy S smartphone) and store in a temporary file ("temp.zip"):
  <link> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip </link>

 Notes: 
 * A full description of this sample data set is obtained at:    <link>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</link>
 
 * Reference: This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited. Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

  3. <b>Unzip all the files </b> to the current Working Directory. All the files are unziped at the same folder - there is no junkpaths, and the temporary file is deleted after this proccess.

  4. <b>Read Labels and Features Tables</b>
  
  5. Tidy the <b>Training data set </b>
  
     a. Read the training data set as well as the subject and labels.
        Note: mutate function ("dlyr" package) is used to insert the activity labels names (instead of numbers) when reading the lable file.

     b. Bind labels, data & a <b>new variable called data_type = "training" to mark the measurements of this type of subjects</b>.
     Note: I used the binding functions here available at "dplyr" package - <b>bind_cols() and mutate</b> from "dplyr" package to insert the new variable.
     
  6. Tidy the <b>Test data set </b>
  
     a. Read the test data set as well as the subject and labels.
        Note: mutate function ("dlyr" package) is used to insert the activity labels names (instead of numbers) when reading the lable file.

     b. Bind labels, data & a <b>new variable called data_type = "test" to mark the measurements of this type of subjects.</b>
     Note: I used the binding functions here available at dplyr package - <b>bind_cols() and mutate</b> from "dplyr" package to insert the new variable.

  7. <b>Merges the training and test sets</b> creating one unique dataset file.
     Note: I used the binding functions here available at "dplyr" package - <b>bind_rows()</b>
  
  8. <b>Extracts only the measurements on the mean ("mean()" variables) and standard deviation ("std()" variables)</b> for each measurement from the Merged data set.
     Note: I used the select() function from "dplyr" with contains() to create a data set wiht the desired variables 

  9. <b>Arrange the data set according to the subjet</b> ascending order.
     Note: this is actually not required in the project but I think it makes the data set nicer when looking at the 30 subjects ordered in the first columm.

  10. <b>Write the new tidy data set to a text file "tidy_data.txt" </b> at the current working directory.
  
  11. <b> Create independent tidy data set with the average of each variable grouped by activity and subject.</b>
      Note: <b>"group_by()"</b> function from "dplyr" package is used to group the data according to subject, activity and data_type, and the <b>"summarise_each()"</b> to apply the function means in all the variables.   
  
  12. <b> Write the new tidy data set to a text file "mean_data.txt" </b> at the current working directory containing the average of each variable grouped by subject and activity.

During the process all the created variables are removed using the rm() function right after working with the files, releasing temporary variables from the memory.
