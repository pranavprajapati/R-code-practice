g <- read.graph(myFile, format = "gml")
library(igraph)

overlap = function(i){
  
  a = ends(g, i)[1]
  b = ends(g, i)[2]
  source_neighbors = neighbors(g, a)
  target_neighbors = neighbors(g, b)
  num_overlap_neighbors = length(intersection(source_neighbors, target_neighbors))

  return(num_overlap_neighbors)
}
ne <- sapply(E(g), overlap)
m_lm <- lm(E(g)$value ~ ne)
summary(m_lm)

