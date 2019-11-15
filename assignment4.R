## 0. Importing data
library(openxlsx)

## 1. Import data and plot Moisture vs Protein.
data <- read.xlsx("data/tecator.xlsx")
plot(data$Protein, data$Moisture)

## 2. 
## 3. Divide in halves for training and testing and train Mi = 1,..,6.
## for each one record the training and validation MSE and present a plot 
## showing how MSE depends on i.
p <- data$Protein
y <- data$Moisture
P <- data.frame(
    Y = y,
    P1 = p, 
    P2 = p^2, 
    P3 = p^3, 
    P4 = p^4, 
    P5 = p^5, 
    P6 = p^6 
)
M1 <- lm(Y ~ ., data = P[,1:2])
M2 <- lm(Y ~ ., data = P[,1:3])
M3 <- lm(Y ~ ., data = P[,1:4])
M4 <- lm(Y ~ ., data = P[,1:5])
M5 <- lm(Y ~ ., data = P[,1:6])
M6 <- lm(Y ~ ., data = P[,1:7])
