library(tidyverse)
library(rtweet)


#Import
train <- read_csv("train_data_kaggle.csv")
test <- read_csv("test_data_kaggle.csv")

count(train, label)

train

train_10k <- lookup_tweets(train$Id[1:10000])
