library("C50")
library(datasets)

#structure of this data frame 768 obs/rows and 9 variables/columns
str(dataset)

#summary to see and examine data before using it
summary(dataset)

#view dataset
View(dataset)

#x: all columns except ninth and y: only ninth column
#M2_model = C5.0(dataset[ , -9], dataset[ , 9])

#plot decision tree
#plot(M2_model, type="s", main="M2 Decision Tree")

#seed
set.seed(17)

#shuffling dataSet
ShuffledDataSet = dataset[order(runif(nrow(dataset))), ]

#display ShuffledDataSet
View(ShuffledDataSet)

#make training dataset 50percent
TrainingDataSet = ShuffledDataSet[1:floor(nrow(ShuffledDataSet)*0.5), ]

#display TrainingDataSet
View(TrainingDataSet)

#make training dataset 50percent
TestingDataSet = ShuffledDataSet[(floor(nrow(ShuffledDataSet)*0.5)+1):nrow(ShuffledDataSet), ]

#display TrainingDataSet
View(TestingDataSet)

TrainingDataSet[, 9] <- as.factor(TrainingDataSet[, 9])

#x: all columns except ninth and y: only ninth column
M2_training_model <- C5.0.default(TrainingDataSet[, -9], TrainingDataSet[, 9])

#plot decision tree
plot(M2_training_model, type="s", main="M2 training set Decision Tree")

#must predict data of 9th column
result = predict(M2_training_model, TestingDataSet[ ,-9])

#View and display result after it is converted into a frame
#combining testing data frame and results to compare them
View(cbind(TestingDataSet, result))

#calculate Accuracy
tmp = result == TestingDataSet$Diabetic
tmp
which(tmp)
#number of true
length(which(tmp))
#total number
length(tmp)
accuracy= length(which(tmp)) / length(tmp) * 100.0

#print accuracy
message <- sprintf("The Accuracy of the M2 model is %.2f", accuracy)
print(message)

