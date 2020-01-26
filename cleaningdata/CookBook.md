This cookbook describes the data used and transformations applied.

Data used:
-	The UCI HAR dataset provided via coursera. The Datastructure contains a test and a train dataset which a both seperated in a X variable and a y variable dataset.
-	The variable names for X can be found in the features.txt document, labels for the y variable in the actitvity_labels.txt document.

Transformations applied (for the dataset after task 4):
-	Applying the column labels to the X variable datasets
-	Extracting the columns containing either "mean()" or "std()" in the end for standard deviations and means of each variable observation
-	Labelling the y observations via the provided labels
- 	Merging all together via binding functions

Further transformations applied (for the dataset for task 4):
-	Dropping the variables containing "std()" as they are not required for task 5
-	Pivoting the dataset such that all means remain observations, the columns containing mean are pivoted to a new column "variable"
