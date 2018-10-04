dat1 <- lda(dep$SEX ~ dep$income + dep$cesd, data= dep)
dat1

y1 <- predict(dat1,dep)
y1
dat1$terms

class1 <- y1$class
tab <- table(class1,dep$SEX)
tab
acc1 <- sum(diag(tab)/sum(tab))*100
acc1

dat2 <- lda(dep$SEX ~ dep$EDUCAT + dep$EMPLOY + dep$`general health`, data= dep)
dat2

y2 <- predict(dat2,dep)
dat2$terms

class2 <- y2$class
tab1 <- table(class2,dep$SEX)
tab1
acc2 <- sum(diag(tab1)/sum(tab1))*100
acc2

