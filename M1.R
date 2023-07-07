library(C50)

# reading the file and putting the data in a dataset
dataset <- read.csv("DiabetesData.csv", TRUE, ",")

# making the 0 & 1 values into
dataset$Diabetic<-as.factor(dataset$Diabetic)

set.seed(777)

# ----
# splitting the data and then train it
# use 70% of dataset as training set and 30% as test set
ctrl = C5.0Control(sample = 0.7)
model = C5.0.default(dataset[ , -9], dataset[ , 9], control = ctrl)
summary(model)


# ----
# plotting
TrainingDataSet = ShuffledDataSet[1:floor(nrow(ShuffledDataSet)*0.7), ]
ShuffledDataSet = dataset[order(runif(nrow(dataset))), ]
M1_training_model <- C5.0.default(TrainingDataSet[, -9], TrainingDataSet[, 9])
plot(M1_training_model, type="s", main=" M1 Decision Tree")

# ----



