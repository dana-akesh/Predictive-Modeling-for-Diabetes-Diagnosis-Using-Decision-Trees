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


diabetic_column <- data$Diabetic

zeros_n <- sum(diabetic_column == 0)
ones_n <- sum(diabetic_column == 1)

total <- length(diabetic_column)
percentage_zeros <- (zeros_n / total) * 100
percentage_ones <- (ones_n / total) * 100

cat("Number of zeros:", num_zeros, "\n")
cat("Number of ones:", num_ones, "\n")
cat("Percentage of zeros:", percentage_zeros, "%\n")
cat("Percentage of ones:", percentage_ones, "%\n")

# Create a table for diabetics (1) and non-diabetics (0)
diabetic_table <- table(diabetic_column)

# Create a data frame from the table
table_df <- as.data.frame(diabetic_table)

# Add a column for percentages
table_df$Percentage <- (table_df$Freq / sum(table_df$Freq)) * 100

# Rename the columns
colnames(table_df) <- c("Diabetic 1/ Non-Diabetic 0", "Count", "Percentage")

#view table
View(table_df)

# Print the table
print(table_df)

