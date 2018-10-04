library(MASS)

chem$cat[chem$pe >=9] = "High"
chem$cat[chem$pe <9] = "Low"

dat <- lda(chem$cat ~ chem$ror5 + chem$de + chem$salesgr5 + chem$eps5 + chem$npm1 + chem$payoutr1 , data= chem)
dat
y <- predict(dat,chem)
y
summary(y)

tab <- table(y$class,chem$cat)

sum(diag(tab))/sum(tab)
misclassrate <- 1 - sum(diag(tab))/sum(tab)

plot(y$x[,"LD1"],y$posterior[,"Low"],xlab = "Vales of discriminant function",ylab = "posterior probability of belonging to a group")
 

meen <- colMeans(chem[,c(7,8,9,10,11,12)])
meen
cv <- cov(chem$ror5,chem$de,chem$salesgr5)
cv <- cov(chem[,c(7,8,9,10,11,12)])
cv
MD<- mahalanobis(chem[,c(7,8,9,10,11,12)],meen,cv)
MD
