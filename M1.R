library(C50)

# reading the file and putting the data in a M1_dataset
M1_dataset <- read.csv("DiabetesData.csv", TRUE, ",")

# making the 0 & 1 values into
M1_dataset$Diabetic<-as.factor(M1_dataset$Diabetic)

set.seed(777)
# ----
# splitting the data and then train it
# use 70% of M1_dataset as training set and 30% as test set
ctrl = C5.0Control(sample = 0.7)
model = C5.0.default(M1_dataset[ , -9], M1_dataset[ , 9], control = ctrl)
summary(model)

# ----
# plotting
TrainingDataSet = ShuffledDataSet[1:floor(nrow(ShuffledDataSet)*0.7), ]
TestingDataSet = ShuffledDataSet[(floor(nrow(ShuffledDataSet)*0.7)+1):nrow(ShuffledDataSet), ]
ShuffledDataSet = M1_dataset[order(runif(nrow(M1_dataset))), ]
M1_training_model <- C5.0.default(TrainingDataSet[, -9], TrainingDataSet[, 9])
plot(M1_training_model, type="s", main=" M1 Decision Tree")

# ----
# calculate Accuracy
# must predict data of 9th column
result = predict(M1_training_model, TestingDataSet[ ,-9])
tmp = result == TestingDataSet$Diabetic
length(which(tmp)) # number of true
length(tmp)# total number
accuracy= length(which(tmp)) / length(tmp) * 100.0

#print accuracy
message <- sprintf("The Accuracy of the M1 model is %.2f", accuracy)
print(message)


