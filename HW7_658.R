#install.packages(c('tm', 'SnowballC', 'wordcloud'))
library(tm)
library(SnowballC)
library(wordcloud)
library(tidyverse)


reviews <- read_csv("~/Downloads/sentiment_classification/data/movie_reviews.csv")

review_corpus <- Corpus(VectorSource(reviews$content))

review_corpus <- tm_map(review_corpus, content_transformer(tolower))
review_corpus <- tm_map(review_corpus, removeNumbers)
review_corpus <- tm_map(review_corpus, removePunctuation)
review_corpus <- tm_map(review_corpus, removeWords, c("duh", "whatever", stopwords("english")))
review_corpus <- tm_map(review_corpus, stripWhitespace)
review_corpus[[1]]$content

# Sometimes stemming is necessary
review_corpus_stemmed <- tm_map(review_corpus, stemDocument)
review_corpus_stemmed[[1]]$content


# tf-idf(term frequency-inverse document frequency) instead of the frequencies of the term as
#entries, tf-idf measures the relative importance of a word to a document
review_dtm_tfidf <- DocumentTermMatrix(review_corpus, control = list(weighting = weightTfIdf))
review_dtm_tfidf <- removeSparseTerms(review_dtm_tfidf, 0.95)
review_dtm_tfidf
# The first 10 document
inspect(review_dtm_tfidf[1:10,1:20])
neg_words <- read_table("~/Downloads/sentiment_classification/data/negative-words.txt", col_names = F) %>% unlist()
pos_words <- read_table("~/Downloads/sentiment_classification/data/positive-words.txt", col_names = F) %>% unlist()

#use the stemmed corpus
reviews$neg <- tm_term_score(DocumentTermMatrix(review_corpus_stemmed), neg_words)
reviews$pos <- tm_term_score(DocumentTermMatrix(review_corpus_stemmed), pos_words)

reviews$content <- NULL

#tf-idf weighted document-term 
reviews <- cbind(reviews, as.matrix(review_dtm_tfidf))
reviews$polarity <- as.factor(reviews$polarity) # the response variable (y)
reviews$reviewid <- NULL # ID is not a feature, remove

# Split to testing and training set
id_train <- sample(nrow(reviews),nrow(reviews)*0.80)
reviews.train <- reviews[id_train,]
reviews.test <- reviews[-id_train,]

library(rpart)

library(rpart.plot)

library(e1071) 
reviews.svm <- svm(polarity~., data = reviews.train);

pred.svm <- predict(reviews.svm, reviews.test)
table(reviews.test$polarity,pred.svm,dnn=c("Observed","Predicted"))
mean(ifelse(reviews.test$polarity != pred.svm, 1, 0))
