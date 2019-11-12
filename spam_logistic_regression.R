## 0. Importing data
data <- read.csv2("data/spambase.csv")

## 1. Splitting data (from instructions)
n = dim(data)[1]
set.seed(12345)
id=sample(1:n, floor(n*0.5))
train=data[id,]
test=data[-id,]

## 2. Logistic regression to classify 
fit <- glm(Spam ~ . , data = train, family = "binomial")
summary(fit)
predictions <- predict(fit, newdata = test, type="response")

# classifying it
results <- as.integer(predictions > 0.5)
table(test$Spam, results)



