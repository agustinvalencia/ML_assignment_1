crossvalidation <- function( X, Y, nfolds ) {
    X <- swiss
    ## assume X has 5 columns
    n <- dim(X)[1]
    batch_size <- floor(n/nfolds)
    scores <- c()
    models <- c()
    for (fold in c(0:nfolds)) {
        
        # splitting folds
        start <- (fold * batch_size) + 1
        stop <- start + batch_size - 1
        if(stop > n) {
            stop <- n
        }
        idxs <- seq(start,stop)
        train <- X[idxs,]
        test <- X[-idxs,]
        
        # training the linear model
        model <- lm(Fertility ~ ., data=train)
        
        # testing the model and saving results
        test_2 <- test[, names(test) != "Fertility"]
        predictions <- predict(model, test_2)
        print(table(test$Fertility, predictions))
    }
}

fit = function(X, y) {
    X <- as.matrix(X)
    y <- as.matrix(y)
    w <- solve(t(X) %*% X) %*% t(X) %*% y
}




test <- function() {
    class <- swiss$Fertility
    data <- swiss[, names(swiss) != "Fertility"]
    nfolds <- 5
    crossvalidation(data, class, nfolds)
}