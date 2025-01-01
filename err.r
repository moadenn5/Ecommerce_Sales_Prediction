library(readxl)
library(ggplot2)
library(reshape2)

# Load the data
Data <- read_excel("C:/Users/Moad Workstation/Ecommerce_Sales_Prediction/Ecommerce_Sales_Prediction_Dataset.xlsx")

# Calculate new columns
Data$Revenue <- Data$Price * Data$Units_Sold
Data$Discount <- Data$Discount / 100
Data$Discounted_Revenue <- round(Data$Revenue * (1 - Data$Discount), 1)
Data$Profit <- round(Data$Discounted_Revenue - Data$Marketing_Spend, 1)

# Calculate correlation matrix
correlation_data <- Data[, c('Price', 'Discount', 'Discounted_Revenue', 'Revenue', 'Units_Sold', 'Marketing_Spend')]
correlation_matrix <- cor(correlation_data, use = "complete.obs")

# Melt the correlation matrix for ggplot2
melted_correlation_matrix <- melt(correlation_matrix)

# Plot the correlation matrix
ggplot(data = melted_correlation_matrix, aes(x = Var1, y = Var2, fill = value)) +
    geom_tile(color = "black") +
    scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1), space = "Lab", name="Correlation") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1)) +
    coord_fixed() +
    geom_text(aes(label = round(value, 2)), color = "black", size = 4) +
    labs(title = "Correlation Matrix", x = "", y = "")