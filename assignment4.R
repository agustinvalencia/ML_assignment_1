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

n = dim(P)[1]
set.seed(12345)
id = sample(1:n, floor(n*0.5))
train = P[id,]
test = P[-id,]

M1 <- lm(Y ~ ., data = train[,1:2])
M2 <- lm(Y ~ ., data = train[,1:3])
M3 <- lm(Y ~ ., data = train[,1:4])
M4 <- lm(Y ~ ., data = train[,1:5])
M5 <- lm(Y ~ ., data = train[,1:6])
M6 <- lm(Y ~ ., data = train[,1:7])
models <- list(
  M1 = M1, 
  M2 = M2, 
  M3 = M3, 
  M4 = M4, 
  M5 = M5, 
  M6 = M6
)

## Train Scores
eval_model <- function(model, data) {
  pred <- predict(model, data)
  errors <- pred - data$Y
  MSE <- mean(errors^2)
  return(MSE)
}

MSE_train <- c()
MSE_train[1] <- eval_model(M1, train)
MSE_train[2] <- eval_model(M2, train)
MSE_train[3] <- eval_model(M3, train)
MSE_train[4] <- eval_model(M4, train)
MSE_train[5] <- eval_model(M5, train)
MSE_train[6] <- eval_model(M6, train)

MSE_test <- c()
MSE_test[1] <- eval_model(M1, test)
MSE_test[2] <- eval_model(M2, test)
MSE_test[3] <- eval_model(M3, test)
MSE_test[4] <- eval_model(M4, test)
MSE_test[5] <- eval_model(M5, test)
MSE_test[6] <- eval_model(M6, test)











