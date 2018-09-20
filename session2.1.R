x <-1:9
is.matrix(x)
mx1 <- matrix(x,nrow = 3,ncol = 3, byrow = FALSE)
mx1
colnames(mx1) <- c("col1","col2","col3")
rownames(mx1)<- c("row1","row2","row3")
mx1
str(mx1)
mx2 <- matrix(c(2,0,1,4),nrow=2, ncol=2, byrow = FALSE)
colnames(mx2) <- c("col1","col2")
rownames(mx2)<- c("row1","row2")
mx3<- matrix(11:19, nrow = 3,ncol = 3,byrow = TRUE)
mxadd1_3 <- mx1 + mx3
mxadd1_3
mxmul <- mx1*mx3
mxmul
mxmulcorrect<- mx1%*%mx3
mxmulcorrect
