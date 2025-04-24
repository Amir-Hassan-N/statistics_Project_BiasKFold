# Code : 01
# Simpler and more straightforward, focusing on printing results rather than plotting them. 
# Each k-fold cross-validation is performed and printed separately.
# Sufficient if you only need to perform k-fold and bias-corrected k-fold cross-validation 
# and print the results without the need for plotting. It is more straightforward and 
# easier to understand for quick analysis.


library(readxl)

# Read the Excel file
data <- read_excel("d:\\Sami\\Documents\\Statistics\\Real-estate-valuation-data.xlsx")

# Print first few rows of the data
head(data)

library(caret)
library(e1071)

# ************* Fold 3  ****************************#
# Set up the training control
train_control <- trainControl(method = "cv", number = 3)  # Change 'number' for different fold numbers
# Train SVM model with cross-validation
svm_model <- train(`Y house price of unit area` ~ ., data = data, method = "svmRadial", trControl = train_control)

# Calculate mean squared error (MSE)
mse <- mean(svm_model$resample$RMSE^2)

# Calculate estimated standard deviation
est_sd <- sd(svm_model$resample$RMSE)

# Print MSE and estimated standard deviation
print(paste("Mean Squared Error:", mse))
print(paste("Estimated Standard Deviation:", est_sd))

# ************* Fold 4  ****************************#
# Set up the training control
train_control <- trainControl(method = "cv", number = 4)  # Change 'number' for different fold numbers
# Train SVM model with cross-validation
svm_model <- train(`Y house price of unit area` ~ ., data = data, method = "svmRadial", trControl = train_control)

# Calculate mean squared error (MSE)
mse <- mean(svm_model$resample$RMSE^2)

# Calculate estimated standard deviation
est_sd <- sd(svm_model$resample$RMSE)

# Print MSE and estimated standard deviation
print(paste("Mean Squared Error:", mse))
print(paste("Estimated Standard Deviation:", est_sd))

# ************* Fold 5  ****************************#
# Set up the training control
train_control <- trainControl(method = "cv", number = 4)  # Change 'number' for different fold numbers
# Train SVM model with cross-validation
svm_model <- train(`Y house price of unit area` ~ ., data = data, method = "svmRadial", trControl = train_control)

# Calculate mean squared error (MSE)
mse <- mean(svm_model$resample$RMSE^2)

# Calculate estimated standard deviation
est_sd <- sd(svm_model$resample$RMSE)

# Print MSE and estimated standard deviation
print(paste("Mean Squared Error:", mse))
print(paste("Estimated Standard Deviation:", est_sd))

#************* BIAS CORRECTED K-FOLD Cross Validation **************#

# Function to calculate mean squared error
mse_func <- function(predictions, actual) {
  return(mean((actual - predictions)^2))
}

# ************* Fold 3  ****************************#

# Determine the number of observations per fold
observations_per_fold <- ceiling(nrow(data) / 3)

# Create a vector of fold indices
fold_indices <- rep(1:3, each = observations_per_fold)

# If the number of observations is not divisible by 3, adjust the number of folds
fold_indices <- fold_indices[1:nrow(data)]

# Shuffle the fold indices
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
  svm_model <- svm(`Y house price of unit area` ~ ., data = train_data, kernel = "radial")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error
  mse_values[fold] <- mse_func(predictions, test_data$`Y house price of unit area`)
  
  # Calculate standard deviation of predictions
  sd_values[fold] <- sd(predictions)
}

# Compute bias-corrected mean squared error and standard deviation
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
  svm_model <- svm(`Y house price of unit area` ~ ., data = train_data, kernel = "radial")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error
  mse_values[fold] <- mse_func(predictions, test_data$`Y house price of unit area`)
  
  # Calculate standard deviation of predictions
  sd_values[fold] <- sd(predictions)
}

# Compute bias-corrected mean squared error and standard deviation
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
  svm_model <- svm(`Y house price of unit area` ~ ., data = train_data, kernel = "radial")
  
  # Make predictions on test data
  predictions <- predict(svm_model, test_data)
  
  # Calculate mean squared error
  mse_values[fold] <- mse_func(predictions, test_data$`Y house price of unit area`)
  
  # Calculate standard deviation of predictions
  sd_values[fold] <- sd(predictions)
}

# Compute bias-corrected mean squared error and standard deviation
bc_mse <- mean(mse_values)
est_sd <- sqrt(mean(sd_values^2))

# Print results
cat("Bias-corrected Mean Squared Error:", bc_mse, "\n")
cat("Estimated Standard Deviation:", est_sd, "\n")
