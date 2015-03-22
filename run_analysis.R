run_analysis <- function () {
    
#
# Course Project of the Course Getting and Cleaning Data
#
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. 
#
# The data linked to from the course website represent data collected from the accelerometers from the 
# Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
#
#   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# Website to get the data for the project: 
#
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# This is an R script called run_analysis.R that does the following. 
#   
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.

################################################################################################
##  Loading the necessary packages                                                            ?wrt
################################################################################################    
    
    #Load dplyr packages
    require("dplyr")
        
################################################################################################
##  Setting the Directory, Downloading & Unziping the Files                                   
################################################################################################    
    
    #Setting my Working Directory
    setwd("/Users/cristianomendesfranco/Desktop/Cursos online/Data Science/Getting and Cleaning Data")
    
    # Check if the directory to store the files is already created 
    if (!file.exists("data_analysis")) {
        dir.create("data_analysis") # create the directory
        setwd("data_analysis") # set as a current working directory
    } else { 
        setwd("data_analysis")
    }
    
    #Check if the data files already exists
        if (!file.exists("X_test.txt") & !file.exists("X_train.txt")) {
        
        # Set the URL do download the file
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        
        #Download the Zip File to a temporary file
        download.file(fileUrl,destfile="temp.zip", method = "curl")
        dateDownloaded <- date()
        rm(fileUrl) #remove the object fileUrl
    
        #Unzip all the files to the current Working Directory
        unzip("temp.zip", junkpaths = TRUE )
        unlink("temp.zip") #remove temporary zip file
    }

################################################################################################
##  Reading Labels and Features Tables                                                        
################################################################################################

    #Read the activity Labels
    a_labels<-read.table("activity_labels.txt",col.names=c("labels","activity"))
    
    #Read the features Table
    features<-read.table("features.txt",col.names=c("ID","names"))
   
################################################################################################
##  Working with the data_sets, creating and writing one tidy dataset file                    
################################################################################################
    
    # Training Dataset
        
        # Read the raw datasets
        t_data<-read.table("X_train.txt",col.names=features$names) #Training dataset
        t_subject<-read.table("subject_train.txt",col.names="subject") #Training subjects who performed the activity for each window sample - range from 1 to 30.
        t_labels<-read.table("y_train.txt",col.names="activity") %>% #Training labels 
            mutate(activity,activity=a_labels$activity[activity]) # Change labels number by activity labels

        # Binding the files in a new training_dataset
        training_dataset <- t_subject %>% 
            bind_cols(t_labels,t_data) %>%
            mutate(data_type="training") # creating a new variable to mark as training dataset
        
        # Removing the raw data sets
        rm(t_data,t_subject,t_labels)

    # Test Dataset

        # Read the raw datasets
        t_data<-read.table("X_test.txt",col.names=features$names) #Test dataset
        t_subject<-read.table("subject_test.txt",col.names="subject") #Test subjects who performed the activity for each window sample - range from 1 to 30.
        t_labels<-read.table("y_test.txt",col.names="activity") %>% #Test labels 
            mutate(activity,activity=a_labels$activity[activity]) # Change labels number by activity labels

        # Binding the files in a new test_dataset
        test_dataset <- t_subject %>% 
            bind_cols(t_labels,t_data) %>%
            mutate(data_type="test") # creating a new variable to mark as test dataset

        # Removing the raw data sets & support tables
        rm(t_data,t_subject,t_labels, a_labels, features)

    # 1 Merges the training and the test sets to create one data set
    one_dataset<-bind_rows(training_dataset, test_dataset)    
    
    rm(training_dataset,test_dataset) #removing the temporary training & test tables

    # 2 Extracts only the measurements on the mean and standard deviation for each measurement
    one_dataset<- one_dataset %>%
        select(subject, activity, data_type, contains("mean"),contains("std")) %>%
        arrange(subject) # arrange the dataset by subjects
    
    # Write the new tidy data set
    write.table(one_dataset, file = "tidy_data.txt", row.name=FALSE)

################################################################################################
##  Creating a independent tidy data set with average of each variable grouped by activity
##  and subject
################################################################################################
    
    mean_data <- one_dataset %>%
        group_by(subject,activity,data_type) %>%  #group by subject and activity - data_type is a new variable create to cat. by training data or test
        summarise_each(funs(mean)) # apply function means in all the other columms     
                      
    # Write the new tidy data set with the average of each variable grouped
    write.table(mean_data, file = "mean_data.txt", row.name=FALSE)
} 
