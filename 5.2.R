library(igraph)
library(dplyr)
gph <-read_graph("/Users/pranavprajapati/Desktop/polbooks.gml", format = c("gml"))
node_centrality <- data.frame(politics=V(gph)$value, 
                              degree=degree(gph),
                              betweenness=betweenness(gph), 
                              closeness=closeness(gph))

politics_average <- node_centrality %>%
  group_by(politics) %>%
  summarise(mean_d= mean(degree), mean_bet=mean(betweenness), mean_c=mean(closeness))

politics_average
