
#linear regression
mylin = function(X, Y, X_test) {
  
  # data validation
  X <- as.matrix(X)
  Y <- as.matrix(Y)
  X_test <- as.matrix(X_test)
  
  #Xpred1 = cbind(1, Xpred)
  
  # regression weights
  beta <- solve(t(X) %*% X) %*% t(X) %*% Y
  y_pred <- beta %*% X_test
  
  #Res = Xpred1 %*% beta
  return(Res)
}

#myCV=function(X,Y,Nfolds){
#  n=length(Y)
#  p=ncol(X)
#  set.seed(12345)
#  ind=sample(n,n)
#  X1=X[ind,]
#  Y1=Y[ind]
#  sF=floor(n/Nfolds)
#  MSE=numeric(2^p-1)
#  Nfeat=numeric(2^p-1)
#  Features=list()
#  curr=0
#  
#  for (f1 in 0:1)
#    for (f2 in 0:1)
#      for(f3 in 0:1)
#        for(f4 in 0:1)
#          for(f5 in 0:1){
#            model= c(f1,f2,f3,f4,f5)
#            if (sum(model)==0) next()
#            SSE=0
#            
#            for (k in 1:Nfolds) {
#              #MISSING: compute which indices should belong to current fold
#              
#			        #MISSING: implement cross-validation for model with features in "model" and iteration i.
#			        #MISSING: Get the predicted values for fold 'k', Ypred, and the original values for folf 'k', Yp.
#              SSE=SSE+sum((Ypred-Yp)^2)
#            }
#            curr=curr+1
#            MSE[curr]=SSE/n
#            Nfeat[curr]=sum(model)
#            Features[[curr]]=model
#            
#          }
#
#  #MISSING: plot MSE against number of features
#  i=which.min(MSE)
#  return(list(CV=MSE[i], Features=Features[[i]]))
#}
#
#myCV(as.matrix(swiss[,2:6]), swiss[[1]], 5)