mydata <- data.frame(lung$fvcf,lung$fev1f,lung$fvcm,lung$fev1m,lung$fvco,lung$fev1o)
mydata_sc <- as.data.frame(scale(mydata))
mydata_sc
distl <- dist(mydata_sc, method = 'euclidean')
distl
hc_mydata<- hclust(distl, method = "complete")
plot(hc_mydata)
clusters_mydata2 <- cutree(hc_mydata, k=4)
plot(hc_mydata)
rect.hclust(hc_mydata , k = 4, border = 2:6)
abline(h = 4, col = 'red')

library(dendextend)
avg_dend_obj <- as.dendrogram(hc_mydata)
avg_col_dend <- color_branches(avg_dend_obj, h = 4)
plot(avg_col_dend)

library(dplyr)

mydata_cl <- mutate(mydata, cluster = clusters_mydata2)
mydata_cl
count(mydata_cl,cluster)
table(mydata_cl$cluster,lung$area==4)
table(clusters_mydata2,lung$area)
library(ggplot2)
ggplot(mydata_cl, aes(x = lung.fvcm, y = lung.fev1m, color = factor(cluster))) +
  geom_point()
