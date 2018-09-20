mylist <- list(34453,c("pranav","prajapati"),c(14,3,12,15,16))
mylist2 <- list(seq=1:10,mylist)
mylist2

####data frame####
my.dataset <- data.frame(site=c('A','B','C','D','E'),ph=c(7,4,6,3,8,6,7,2,8,9))
is.list(my.dataset)
my.dataset
View(my.dataset)
rm(list = ls())

avector <- c("A","B","C","D")
second <- avector[2]
names(avector) <- c("first","second","third","fourth")
second <- avector["second"]
second
mylist <- list(34453,c("pranav","prajapati"),c(14,3,12,15,16))
mode(mylist[2])

data(iris)
View(iris)
iris[4,2]
iris[,3]
subset <- iris[c(5,1,20,23),-5]
View(subset)
subset <- iris[c(seq(from=0 ,to=150,by=5)),c(1:5)]

View(subset)
sample(100,10)
idx <- sample(nrow(iris), as.integer(.70*nrow(iris)))
idx
