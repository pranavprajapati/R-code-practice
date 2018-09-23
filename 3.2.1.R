install.packages("dplyr")
library("dplyr")
library('readr')
mydata <-read_csv("~/Downloads/sp.csv")
d <- mydata[,6:7]
d2 <- mydata[,7]
pd <- lag(d$`Adj Close`, k = 1)
print(pd)
print(d2)
return <- 100*(d2-pd)/pd
print(return)
s <- summary(return)
print(s)
