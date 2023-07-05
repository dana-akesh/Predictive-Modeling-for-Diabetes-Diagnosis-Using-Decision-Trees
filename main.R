# reading the csv file
data <- read.csv("DiabetesData.csv", TRUE, ",") # true means that the data starts not from the first row
class(data)
head(data)
