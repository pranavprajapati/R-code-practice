myFile <- file.choose()
g <- read.graph(myFile, format = "gml")
g<-read.graph(myFile,format=c("gml"))
library(tidyverse)
library(igraph)

emails_edge_list$count <- 1
emails_edge_list$count[emails_edge_list$ReceiverId==80] <- 0
emails_edge_list$count[emails_edge_list$SenderPersonId==80] <- 0
fcount <- emails_edge_list  %>%  
                group_by(ReceiverId) %>%
                summarise(sum(count))
View(fcount)

ultra_vlist <- data.frame(V(hillary_egocentric)$name,V(hillary_egocentric)$id)
names(ultra_vlist) <- c( "name","id")
View(ultra_vlist)
fcount$ReceiverId <-as.character(fcount$ReceiverId)
email_no <- left_join(ultra_vlist,fcount,by=c("id"="ReceiverId"))
View(email_no)
email_no[is.na(email_no)] <- 0
V(hillary_egocentric)$n_emails <- email_no$`sum(count)`
                                                                        
V(hillary_egocentric)$n_emails

plot(hillary_egocentric,layout=layout.fruchterman.reingold(hillary_egocentric), 
    vertex.size = log(V(hillary_egocentric)$n_emails + 1) ,
     vertex.label=NA,edge.arrow.size=.2)


betweenness_centrality <- betweenness(hillary_egocentric,normalized = TRUE)
betweenness_centrality

# Fit a regression model
lin_df <- data.frame(V(hillary_egocentric)$n_emails, betweenness_centrality)
names(lin_df) <- c("Emails", "Betweenness") # Rename columns
summary(lm(Emails ~ Betweenness, data = lin_df))

       
 