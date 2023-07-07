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

# ----
diabetic = 1 == dataset$Diabetic
no_of_diabetic = length(which(diabetic)) #number of diabetic
no_of_nondiabetic = length(which(!diabetic)) #number of nondiabetic

percentage_of_diabetic = (no_of_diabetic / nrow(dataset)) * 100
percentage_of_nondiabetic = (no_of_nondiabetic / nrow(dataset)) * 100

# Create the four variables
var1 <- no_of_diabetic
var2 <- no_of_nondiabetic
var3 <- percentage_of_diabetic
var4 <- percentage_of_nondiabetic

# Create a matrix with two columns and two rows
ordered_matrix <- matrix(c(var1, var2, var3, var4), nrow = 2, ncol = 2,
                        dimnames = list(c("diabetic", "nondiabetic"), c("number", "percentage")))


# Print the ordered matrix
print(ordered_matrix)
