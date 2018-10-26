library(ggplot2)
md<- data.frame(lung$fvcf,lung$fev1f,lung$fvcm,lung$fev1m,lung$fvco,lung$fev1o)
model_km2 <- kmeans(md, centers = 4)
clust_km2 <- model_km2$cluster
md_km2 <- mutate(md, cluster =clust_km2)
md_km2
ggplot(md_km2, aes(x = lung.fvcm , y = lung.fev1m, color = factor(cluster))) +
geom_point()
table(clust_km2,lung$area)
count(md_km2,md_km2$cluster)
