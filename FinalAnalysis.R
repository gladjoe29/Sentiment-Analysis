#load the libraries
library(syuzhet)
library(tm)
library(ggplot2)


tweet_export <- mydata

result <- get_nrc_sentiment(as.character(tweet_export))
#change result from a list to a data frame and transpose it 
result1<-data.frame(t(result))

new_result <- data.frame(rowSums(result1))

names(new_result)[1] <- "count"
new_result <- cbind("sentiment" = rownames(new_result), new_result)
rownames(new_result) <- NULL
#plot the first 8 rows,the distinct emotions
qplot(sentiment, data=new_result[1:8,], weight=count, geom="bar",fill=sentiment)+ggtitle("TedTalk Sentiments")

#plot the last 2 rows ,positive and negative
qplot(sentiment, data=new_result[9:10,], weight=count, geom="bar",fill=sentiment)+ggtitle("TedTalk Sentiments")
