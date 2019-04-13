install.packages("twitteR")
install.packages("rtweet")
install.packages("readtext")
library(sentimentr)
library(rtweet)
library(twitteR)
library(ggplot2)
#library(readtext) (generally not needed for reading text)


input_data <- read.csv("vals.txt", header = FALSE, fileEncoding = "UTF-8-BOM", stringsAsFactors=FALSE)

#input_data <- readtext::readtext("names.csv")
handle=input_data[1]
number=input_data[2]

#search TWitter
searched_tweets<- searchTwitteR(searchString=handle, resultType="recent",n=number, lang="en")
#can use since and until parameters also
# can use geocode to filter tweets
#searched_tweets

#Converting into Dataframe 
tweets.df = do.call("rbind",lapply(searched_tweets,as.data.frame))
tweet_export=tweets.df$text
write.table(tweet_export,file="tweets.txt", append= FALSE, sep="\n")

#tm::findFreqTerms(tweet_export,lowfreq = 0, highfreq = Inf)

#tweet_list<-dplyr::glimpse(tweets.df$text)

#sentimentr::sentiment(tweet_export)$sentiment
sentiment_values=sentiment_by(tweet_export,by=NULL,averaging.function = sentimentr::average_downweighted_zero)$ave_sentiment

pos_neg_terms<-tweet_export%>%extract_sentiment_terms()
write_as_csv(pos_neg_terms,file_name = "tweet_sentiment.csv",na="NA")

#jpeg('hist.jpg',hist(sentiment_values, freq=TRUE)
pdf("sentiment_histogram.pdf")
hist(sentiment_values, freq=NULL)
dev.off()
