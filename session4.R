mnorm <- function(x,minx,maxx)
{
  z<- ((x-minx)/(maxx-minx))
  return(z)
}

mnorm
myvector <- 1:20
mnorm(myvector,1,20)



maxx <- 40
minx <- 1
mnorm4 <- function(x)
{
  minx<-10
  z<- ((x-minx)/(maxx-minx))
  y<-list(z,minx,maxx)
  return(y)
}

results <- mnorm4(myvector)
results

fprint <- function(x1,x2,x3,x4,x5)
{
  print(c('Value of x1 :',x1))
  print(c('Value of x2 :',x2))
  print(c('Value of x3 :',x3))
  print(c('Value of x4 :',x4))
  print(c('Value of x5 :',x5))
}  
fprint(10,5,3,2,1)


rm(list=ls())
x<-c("a","b","c","d")
for(i in 1:4){
  print(x[i])
}
