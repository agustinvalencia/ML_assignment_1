## 0. Importing data
library(openxlsx)
data <- read.xlsx("data/spambase.xlsx")

## 1. Splitting data (from instructions)
n = dim(data)[1]
set.seed(12345)
id=sample(1:n, floor(n*0.5))
train=data[id,]
test=data[-id,]



## 2. Logistic regression to classify threshold = 0.5
fit <- glm(Spam ~ . , data = train, family = "binomial")
predictions <- predict(fit, newdata = test)

# classifying it
results_05 <- as.integer(predictions > 0.5)
table( test$Spam, results_05)



## 3. Logistic regression to classify threshold = 0.8
results_08 <- as.integer(predictions > 0.8)
table(test$Spam, results_08)



## 4. Train KNN K=30
knn_model <- train.kknn(Spam ~ . , data = train, k = 30)
knn_fit <- predict(knn_model, test)
results <- as.integer(knn_fit > 0.5)
table(test$Spam, results)



## 5. Train KNN K=1
knn_model <- train.kknn(Spam ~ . , data = train, k = 1)
knn_fit <- predict(knn_model, test)
results <- as.integer(knn_fit > 0.5)
table(test$Spam, results)

