file <-read.csv(file.choose())
d <- mydata[,6:7]
corr <- cor.test(file$Adj.Close, file$Volume, method = "pearson")
print(result)
##Pranav Prajapati

