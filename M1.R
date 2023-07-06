library(C50)
library(datasets)
dataset <- read.csv("DiabetesData.csv", TRUE, ",")
View(dataset)
str(dataset)

dataset$Diabetic<-as.factor(dataset$Diabetic)
str(dataset$Diabetic)

shuffle = dataset[order(runif(nrow(dataset))) , ]
View(shuffle)

training = shuffle[1:floor(nrow(shuffle)*0.7),]
View(training)

testing = shuffle[floor(nrow(shuffle)*0.7)+1 : nrow(shuffle),]
View(testing)

model = C5.0.default(training[ , -9], training[ , 9])
plot(model, type="simple", main="Decision Tree")

summary(model)
