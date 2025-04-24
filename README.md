# 📉 Bias in K-Fold Cross-Validation with Stable Learners

## Understanding & Correcting Risk Estimation Bias in Model Evaluation

### A research & reimplementation project for Statistics for Data Science

## 📌 Overview
K-Fold Cross-Validation (K-Fold CV) is a popular technique used to estimate the generalization error of machine learning models. However, standard K-Fold CV may lead to biased risk estimates—especially when models exhibit algorithmic stability.

This project investigates the bias introduced in K-Fold CV and presents a bias-corrected version designed to improve risk estimation, particularly for stable learning algorithms like SVM.

The project includes:

● A theoretical overview of K-Fold CV bias

● A reimplementation in R of both standard and debiased methods

● A comparison of the two on regression and classification datasets

## 🎯 Objectives
● Analyze the bias in standard K-Fold cross-validation

● Implement and compare standard vs. bias-corrected K-Fold CV

● Use Support Vector Machines (SVM) for model evaluation

● Test both methods across multiple datasets and folds (K = 3, 4, 5)

● Quantify error and stability using MSE, hinge loss, and standard deviation


## 🧪 Datasets
Used UCI datasets for both regression and classification tasks:

## 🧮 Regression:
● Real Estate Valuation (REV) – 414 instances, 5 features

● Energy Efficiency (EE) – 768 instances, 8 features

## 🧠 Classification:
● Raisin Dataset (RS) – 900 samples, 7 attributes

● BIODEG, AR, IO – Additional benchmark datasets for hinge loss analysis

## ⚙️ Technologies & Tools
💠 Language: R

💠 Libraries: caret, e1071, boot, readxl

💠 Models: SVM with radial kernel

💠 Metrics: Mean Squared Error (MSE), Standard Deviation, Hinge Loss

## 🧠 Methodology
➤ Standard K-Fold CV:
➤ Split dataset into K folds

➤ For each fold:

➤ Train on K-1 folds

➤ Test on the remaining fold

➤ Average the loss/error across all folds

➤ Bias-Corrected K-Fold CV:
➤ Incorporates stability coefficients (β) of the learning algorithm

➤ Adds a correction term to reduce the downward bias in risk estimates

➤ Produces more accurate generalization error, especially for stable learners

## 📈 Key Results
✅ Regression – MSE Comparison

✅ Dataset	K	Standard CV	Bias-Corrected CV
✅ REV	3	66.10	64.42
✅ EE	5	2.90	3.18
✅ Bias-corrected K-Fold gives slightly higher but more accurate estimates of error

✅ Classification – Hinge Loss
✅ Bias-corrected CV produced lower hinge loss across all folds and datasets

✅ Improved classification performance observed in stable learners

## 📊 Visual Analysis
💠 Plotted training vs. testing loss for both methods

💠 Visualized bias corrections across folds

💠 Comparative analysis shows bias reduction and risk accuracy improvement

## ✅ Key Takeaways
💠 Standard K-Fold CV underestimates risk when applied to stable learners

💠 Bias-corrected version improves risk reliability, especially in small datasets

💠 Helps practitioners make more informed decisions on model performance

S\💠 uitable for use in model evaluation pipelines and academic research

## 👥 Authors
✨ Amir Hassan


## 📫 Contact
✨ 📧 amirhassanunipi29@gmail.com


