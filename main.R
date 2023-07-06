# ----
# reading the csv file
data <- read.csv("DiabetesData.csv", TRUE, ",") # true means that the data starts not from the first row

View(data)

# ----
# Calculate the mean for each column
means <- colMeans(data)

# Print the mean values
#print(means)

# ----
# function to calculate column medians
col_medians <- function(data) {
  apply(data, 2, median)
}

medians <- col_medians(data)
#print(medians)

# ----
# function to calculate column standard deviations 
col_standarDeviation<- function(data) {
  apply(data, 2, sd)
}
standardDeviation <- col_standarDeviation(data)
#print(standardDeviation)

# ----
# Find the minimum and maximum values for each column
max_value <- apply(data, 2, max)
min_value <- apply(data, 2, min)

# Print the minimum and maximum values
#print(min_value)
#print(max_value)

# ----
# putting all the data in a table 
statistics_table <- data.frame(
  Mean = means,
  Median = medians,
  StandardDeviation = standardDeviation,
  MaximumValue = max_value,
  MinimumValue = min_value
)

#print(statistics_table)
View(statistics_table)
