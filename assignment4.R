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
P <- p
for (i in 2:6) {
    P <- cbind(P, p^i)
}
P
