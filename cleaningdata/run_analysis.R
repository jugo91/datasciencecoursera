###
# Tidying the UCI HAR dataset

##setup of folders
  setwd("D:/R/cleaningdata/UCI HAR Dataset")
  
# Loading libariers
  library(dplyr)
  library(stringr)
  library(tidyr)
  library(unpivotr)

  # Loading the base data  
  X_test <- read.table("./test/X_test.txt", quote="\"", comment.char="")
  y_test <- read.table("./test/y_test.txt", quote="\"", comment.char="")
  X_train <- read.table("./train/X_train.txt", quote="\"", comment.char="")
  y_train <- read.table("./train/y_train.txt", quote="\"", comment.char="")

  features <- read.table("./features.txt", quote="\"", comment.char="")
  activity_labels <- read.table("./activity_labels.txt", quote="\"", comment.char="")

# Replace column names with feature names
  features <- as.list(as.character(features$V2))
  
  colnames(X_test) <- features
  colnames(X_train) <- features
  
  
# Select the mean and standard deviation variables of each measurement  
  extract_string <- "mean\\(\\)$"
  extract_string2 <- "std\\(\\)$"
  cols_extract <- !is.na(str_match(features,extract_string)) |!is.na(str_match(features,extract_string2))
  
  
# Map activty labels to y observations
  activity_labels <- activity_labels %>%mutate(activity = as.character(V2))
  y_test <- y_test %>% left_join(activity_labels,by=c("V1"="V1")) %>% dplyr::select(activity)
  y_train <- y_train %>% left_join(activity_labels,by=c("V1"="V1")) %>% dplyr::select(activity)
  
# merge the test and train datasets  
   X<- bind_rows(X_test[,cols_extract],X_train[,cols_extract])
  y <- bind_rows(y_test,y_train)
  
# merge x and y  
  dataset <- bind_cols(X,y)

  
### Seperate task no. 5
## now produce the new dataset excluding standard deviations
  
  dataset_new<- dataset[,is.na(str_match(colnames(dataset),extract_string2))] %>% add_rownames( var = "subject")
  
  pivot_cols <- colnames(dataset_new)[!is.na(str_match(colnames(dataset_new),extract_string))]
  
  tidy_dataset <- dataset_new %>% pivot_longer(pivot_cols,names_to = "variable")
  write.table(tidy_dataset,"./output.txt",row.names = FALSE)
  
  
  