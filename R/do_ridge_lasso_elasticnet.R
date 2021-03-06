do_ridge_lasso_elasticnet <-
function(X,classlabels,alpha=1,lambda=10^seq(10, -2, length = 100)){
  
  temp1<-cbind(classlabels,t(X))
  temp1<-as.data.frame(temp1)
  
  x<-t(X)
  
  cvfit<-cv.glmnet(x,classlabels, alpha = alpha, lambda = lambda)	
  
  plot(cvfit)
  res<-coef(cvfit, s = "lambda.min")	
  
  res<-res[-c(1),]
  
  #res_sum<-summary(res)
  
  return(res) #_sum)
}
