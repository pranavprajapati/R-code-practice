
library(igraph)
library(dplyr)
graph1 <-read_graph("/Users/pranavprajapati/Desktop/polbooks.gml", format = c("gml"))
nom_val <- assortativity.nominal(graph1, as.numeric(as.factor(V(graph1)$value)),directed = FALSE)
nom_val
degr_val <- assortativity.degree(graph1)
degr_val
