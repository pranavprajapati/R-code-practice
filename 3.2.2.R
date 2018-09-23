
library('readr')
mydata <-read_csv("~/Downloads/sp.csv")
d <- mydata[,6:7]
print(d)
d1 <- transform(d, Volume = as.numeric(Volume))
sapply(d1, class)
cor(d1)
install.packages("GGally")
##Pranav Prajapati

