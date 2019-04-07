install.packages("twitteR", lib="J:/Final Project/Sentiment Analysis/")
library(twitteR, lib="J:/Final Project/Sentiment Analysis/")
install.packages("rtweet", lib="J:/Final Project/Sentiment Analysis/")
install.packages("dplyr", lib="J:/Final Project/Sentiment Analysis/")
install.packages("ROAuth", lib="J:/Final Project/Sentiment Analysis/")
install.packages("stringr", lib="J:/Final Project/Sentiment Analysis/")
install.packages("openssl", lib="J:/Final Project/Sentiment Analysis/")
install.packages("httpuv", lib="J:/Final Project/Sentiment Analysis/")
install.packages("ggplot2", lib="J:/Final Project/Sentiment Analysis/")
install.packages("sentimentr", lib="J:/Final Project/Sentiment Analysis/")
install.packages("RSQLite", lib="J:/Final Project/Sentiment Analysis/")
install.packages("RCurl", lib="J:/Final Project/Sentiment Analysis/")
install.packages("base64enc", lib="J:/Final Project/Sentiment Analysis/")
install.packages("httr", lib="J:/Final Project/Sentiment Analysis/")
library(rtweet, lib="J:/Final Project/Sentiment Analysis/")
library(dplyr, lib="J:/Final Project/Sentiment Analysis/") 
library(ROAuth, lib="J:/Final Project/Sentiment Analysis/")
library(stringr, lib="J:/Final Project/Sentiment Analysis/")
library(openssl, lib="J:/Final Project/Sentiment Analysis/")
library(httpuv, lib="J:/Final Project/Sentiment Analysis/")
library(ggplot2, lib="J:/Final Project/Sentiment Analysis/")
library(sentimentr, lib="J:/Final Project/Sentiment Analysis/")
library(bitops, lib="J:/Final Project/Sentiment Analysis/")
library(RSQLite, lib="J:/Final Project/Sentiment Analysis/")
library(RCurl, lib="J:/Final Project/Sentiment Analysis/")
library(base64enc, lib="J:/Final Project/Sentiment Analysis/")
library(httr, lib="J:/Final Project/Sentiment Analysis/")



reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
api_key <- "buFWcWVZE3WpFnxMl3kXUAYaS"
api_secret <- "pPLsRFWxfzmSUrbBFfQ2ywItbRf64HTWpj76EYjQd8ZeqrHZZb"
access_token <- "754300606911811584-ltzDOWqaHJlN2Zno0iWyCcJnsraI1Ax"
access_token_secret <- "N9MxlmnxXioEsLBHhGoprfn0GOOCt7UEUufWnpIcMBhgJ"

#twitCred <- OAuthFactory$new(consumerKey = api_key,consumerSecret = api_secret,
                  #        requestURL = reqURL,accessURL = accessURL,
                  #        authURL = authURL)

download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")  #downloads the certificate

#my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
#twitCred$handshake()
##registerTwitterOAuth(twitCred)


#TwitterOAuth()

#setup_twitter_oauth(api_key,api_secret)
#origop <- options("httr_oauth_cache")
#options(httr_oauth_cache = TRUE)

appname <- "Sentinalyzer"
key <- api_key
secret <- api_secret
twitter_token <- create_token(app = appname, consumer_key = key, consumer_secret = secret)

project_directory <- path.expand(getwd())
file_name <- file.path(project_directory, "twitter_token.rds")
twitter_token
saveRDS(twitter_token, file = file_name)
cat(paste0("TWITTER_PAT=", file_name),
    file = file.path(project_directory, ".Renviron"),
    append = TRUE)

metoo_tweets=search_tweets("#metoo",n=15000,include_rts = FALSE, retryonratelimit = FALSE) #limit is 18000 per 15 minutes
register_sqlite_backend("GTUoffice_Tweets_db")
#gtu_tweets=twitteR::search_twitter_and_store(searchString='@GTUoffice',table_name = 'GTUoffice_Tweets_db', lang = 'en', geocode = NULL)
#gtu_tweets=searchTwitteR("Donald Trump", n= 500, lang="en", resultType = "recent")
#GTUoffice_Tweets_db = load_tweets_db(table_name = "GTUoffice_Tweets") %>% twListToDF()
metoo_tweets

ts_plot(metoo_tweets)

#dplyr::glimpse(metoo_tweets)

