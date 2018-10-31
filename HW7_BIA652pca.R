
x1<- set.seed(36541)
x1<-rnorm(100, mean = 0, sd = 1)

x2<- set.seed(43893)
x2<-rnorm(100, mean = 0, sd = 1)

x3<- set.seed(45671)
x3<-rnorm(100, mean = 0, sd = 1)

x4<- set.seed(65431)
x4<-rnorm(100, mean = 0, sd = 1)

x5<- set.seed(98753)
x5<-rnorm(100, mean = 0, sd = 1)

x6<- set.seed(78965)
x6<-rnorm(100, mean = 0, sd = 1)

x7<- set.seed(67893)
x7<-rnorm(100, mean = 0, sd = 1)

x8<- set.seed(34521)
x8<-rnorm(100, mean = 0, sd = 1)

x9<- set.seed(98431)
x9<-rnorm(100, mean = 0, sd = 1)

y<- set.seed(67895)
y<-rnorm(100, mean = 0, sd = 1)

x1 <- 5*x1
x2 <- 3*x2
x3 <- x1 +x2+4*x3
x4 <- x4
x5 <- 4*x5
x6 <- x5 - x4 + 6*x6
x7 <- 2*x7
x8 <- x7 + 2*x8
x9 <- 4* x9
y <- 5+x1 + 2*x2 +x3 + 10*y

df <- data.frame(x1, x2, x3, x4, x5, x6, x7, x8, x9, y)
df.pca <- prcomp(df[1:9],center = TRUE, scale. = TRUE)

pca_summary <-summary(df.pca)
pca_summary
df
df.pca$rotation

summary(df)

summary(df.pca$rotation)

cor(df,method = c("pearson"))
cor(df.pca$rotation,method = c("pearson"))

library(devtools)
install_github("vqv/ggbiplot")
library(ggbiplot)

ggbiplot(df.pca, labels=rownames(df))

lm_mydf = lm(y~df.pca$x) 
summary(lm_mydf)

lm_mydf2 = lm(y~x1+x2+x3+x4+x5+x6+x7+x8+x9) 
summary(lm_mydf2)
