## 0. Importing data
data <- read.csv2("data/spambase.csv")

## 1. Splitting data (from instructions)
n = dim(data)[1]
set.seed(12345)
id=sample(1:n, floor(n*0.5))
train=data[id,]
test=data[-id,]

## 2. Logistic regression to classify 
fit <- glm(Spam ~ . , data = train, family = binomial(link = "logit"))
summary(fit)
results <- predict(fit, newdata = test, type="response")
summary(results)
ordered_results <- results[order(results)]
plot(ordered_results)
View(train)
