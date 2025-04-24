# Code : 01
# Simpler and more straightforward, focusing on printing results rather than plotting them. 
# Each k-fold cross-validation is performed and printed separately.
# Sufficient if you only need to perform k-fold and bias-corrected k-fold cross-validation 
# and print the results without the need for plotting. It is more straightforward and 
# easier to understand for quick analysis.


library(readxl)

# Load the dataset
data <- read_excel("d:\\Sami\\Documents\\Statistics\\Raisin_Dataset.xlsx")

# Print the first few rows of the dataset
head(data)

# Perform SVM k-fold cross-validation
library(e1071)

# Function to calculate mean squared error and standard deviation
mse_and_sd_func <- function(predictions, actual) {
  mse <- mean((actual - predictions)^2)
  est_sd <- sd(predictions)
  return(c(mse, est_sd))
}

# Check data type of Class column
str(data$Class)

# Convert Class column to factor if it's not already
data$Class <- as.factor(data$Class)

# ************* Fold 3  ****************************#

# Determine the number of observations per fold
observations_per_fold <- ceiling(nrow(data) / 3)

# Create a vector of fold indices
fold_indices <- rep(1:3, each = observations_per_fold)

# If the number of observations is not divisible by 3, adjust the number of folds
fold_indices <- fold_indices[1:nrow(data)]

# Shuffle the fold indices
set.seed(123)  # for reproducibility
fold_indices <- sample(fold_indices)

# Initialize vectors to store cross-validation results
mse_values <- numeric(3)
sd_values <- numeric(3)

# Perform K-Fold Cross-Validation

for (fold in 1:3) {
  # Split the data into train and test sets based on fold indices
  train_data <- data[fold_indices != fold, ]
  test_data <- data[fold_indices == fold, ]
  
  # Fit SVM model on training data
  svm_model <- svm(Class ~ ., data = train_data, kernel = "radial", type = "C-classification")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error and estimated standard deviation
  results <- mse_and_sd_func(as.numeric(predictions), as.numeric(test_data$Class))
  
  # Store results
  mse_values[fold] <- results[1]
  sd_values[fold] <- results[2]
}

# Compute mean of mean squared error and estimated standard deviation
mean_mse <- mean(mse_values)
mean_sd <- mean(sd_values)

# Print results
cat("Mean Squared Error:", mean_mse, "\n")
cat("Estimated Standard Deviation:", mean_sd, "\n")



# ************* Fold 4  ****************************#
# Perform SVM k-fold cross-validation

# Determine the number of observations per fold
observations_per_fold <- ceiling(nrow(data) / 4)

# Create a vector of fold indices
fold_indices <- rep(1:4, each = observations_per_fold)

# If the number of observations is not divisible by 4, adjust the number of folds
fold_indices <- fold_indices[1:nrow(data)]

# Shuffle the fold indices
set.seed(123)  # for reproducibility
fold_indices <- sample(fold_indices)

# Initialize vectors to store cross-validation results
mse_values <- numeric(4)
sd_values <- numeric(4)

# Perform cross-validation
for (fold in 1:4) {
  # Split the data into train and test sets based on fold indices
  train_data <- data[fold_indices != fold, ]
  test_data <- data[fold_indices == fold, ]
  
  # Fit SVM model on training data
  svm_model <- svm(Class ~ ., data = train_data, kernel = "radial", type = "C-classification")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error and estimated standard deviation
  results <- mse_and_sd_func(as.numeric(predictions), as.numeric(test_data$Class))
  
  # Store results
  mse_values[fold] <- results[1]
  sd_values[fold] <- results[2]
}

# Compute mean of mean squared error and estimated standard deviation
mean_mse <- mean(mse_values)
mean_sd <- mean(sd_values)

# Print results
cat("Mean Squared Error:", mean_mse, "\n")
cat("Estimated Standard Deviation:", mean_sd, "\n")


# ************* Fold 5  ****************************#
# Perform SVM k-fold cross-validation

# Determine the number of observations per fold
observations_per_fold <- ceiling(nrow(data) / 5)

# Create a vector of fold indices
fold_indices <- rep(1:5, each = observations_per_fold)

# If the number of observations is not divisible by 5, adjust the number of folds
fold_indices <- fold_indices[1:nrow(data)]

# Shuffle the fold indices
set.seed(123)  # for reproducibility
fold_indices <- sample(fold_indices)

# Initialize vectors to store cross-validation results
mse_values <- numeric(5)
sd_values <- numeric(5)

# Perform cross-validation
for (fold in 1:5) {
  # Split the data into train and test sets based on fold indices
  train_data <- data[fold_indices != fold, ]
  test_data <- data[fold_indices == fold, ]
  
  # Fit SVM model on training data
  svm_model <- svm(Class ~ ., data = train_data, kernel = "radial", type = "C-classification")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error and estimated standard deviation
  results <- mse_and_sd_func(as.numeric(predictions), as.numeric(test_data$Class))
  
  # Store results
  mse_values[fold] <- results[1]
  sd_values[fold] <- results[2]
}

# Compute mean of mean squared error and estimated standard deviation
mean_mse <- mean(mse_values)
mean_sd <- mean(sd_values)

# Print results
cat("Mean Squared Error:", mean_mse, "\n")
cat("Estimated Standard Deviation:", mean_sd, "\n")




#BIAS CORRECTED K-FOLD Crosss Validation

library(boot)
library(e1071)

# *************  Fold 3  ****************************#

# Determine the number of observations per fold
observations_per_fold <- ceiling(nrow(data) / 3)

# Create a vector of fold indices
fold_indices <- rep(1:3, each = observations_per_fold)

# If the number of observations is not divisible by 3, adjust the number of folds
fold_indices <- fold_indices[1:nrow(data)]

# Shuffle the fold indices
set.seed(123)  # for reproducibility
fold_indices <- sample(fold_indices)

# Initialize vectors to store cross-validation results
mse_values <- numeric(3)
sd_values <- numeric(3)

# Perform cross-validation
for (fold in 1:3) {
  # Split the data into train and test sets based on fold indices
  train_data <- data[fold_indices != fold, ]
  test_data <- data[fold_indices == fold, ]
  
  # Fit SVM model on training data
  svm_model <- svm(Class ~ ., data = train_data, kernel = "radial", type = "C-classification")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error and estimated standard deviation
  results <- mse_and_sd_func(as.numeric(predictions), as.numeric(test_data$Class))
  
  # Store results
  mse_values[fold] <- results[1]
  sd_values[fold] <- results[2]
}

# Compute bias-corrected mean squared error and estimated standard deviation
bc_mse <- mean(mse_values)
est_sd <- sqrt(mean(sd_values^2))

# Print results
cat("Bias-corrected Mean Squared Error:", bc_mse, "\n")
cat("Estimated Standard Deviation:", est_sd, "\n")

# ************* Fold 4  ****************************#

# Determine the number of observations per fold
observations_per_fold <- ceiling(nrow(data) / 4)

# Create a vector of fold indices
fold_indices <- rep(1:4, each = observations_per_fold)

# If the number of observations is not divisible by 4, adjust the number of folds
fold_indices <- fold_indices[1:nrow(data)]

# Shuffle the fold indices
set.seed(123)  # for reproducibility
fold_indices <- sample(fold_indices)

# Initialize vectors to store cross-validation results
mse_values <- numeric(4)
sd_values <- numeric(4)

# Perform cross-validation
for (fold in 1:4) {
  # Split the data into train and test sets based on fold indices
  train_data <- data[fold_indices != fold, ]
  test_data <- data[fold_indices == fold, ]
  
  # Fit SVM model on training data
  svm_model <- svm(Class ~ ., data = train_data, kernel = "radial", type = "C-classification")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error and estimated standard deviation
  results <- mse_and_sd_func(as.numeric(predictions), as.numeric(test_data$Class))
  
  # Store results
  mse_values[fold] <- results[1]
  sd_values[fold] <- results[2]
}

# Compute bias-corrected mean squared error and estimated standard deviation
bc_mse <- mean(mse_values)
est_sd <- sqrt(mean(sd_values^2))

# Print results
cat("Bias-corrected Mean Squared Error:", bc_mse, "\n")
cat("Estimated Standard Deviation:", est_sd, "\n")

# ************* Fold 5  ****************************#

# Determine the number of observations per fold
observations_per_fold <- ceiling(nrow(data) / 5)

# Create a vector of fold indices
fold_indices <- rep(1:5, each = observations_per_fold)

# If the number of observations is not divisible by 5, adjust the number of folds
fold_indices <- fold_indices[1:nrow(data)]

# Shuffle the fold indices
set.seed(123)  # for reproducibility
fold_indices <- sample(fold_indices)

# Initialize vectors to store cross-validation results
mse_values <- numeric(5)
sd_values <- numeric(5)

# Perform cross-validation
for (fold in 1:5) {
  # Split the data into train and test sets based on fold indices
  train_data <- data[fold_indices != fold, ]
  test_data <- data[fold_indices == fold, ]
  
  # Fit SVM model on training data
  svm_model <- svm(Class ~ ., data = train_data, kernel = "radial", type = "C-classification")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error and estimated standard deviation
  results <- mse_and_sd_func(as.numeric(predictions), as.numeric(test_data$Class))
  
  # Store results
  mse_values[fold] <- results[1]
  sd_values[fold] <- results[2]
}

# Compute bias-corrected mean squared error and estimated standard deviation
bc_mse <- mean(mse_values)
est_sd <- sqrt(mean(sd_values^2))
# Print results
cat("Bias-corrected Mean Squared Error:", bc_mse, "\n")
cat("Estimated Standard Deviation:", est_sd, "\n")