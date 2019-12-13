library(tidyverse)
library(rtweet)


### Import ----

train <- read_csv("train_data_kaggle.csv", col_types = "cn")
test <- read_csv("test_data_kaggle.csv")

count(train, label)

train

train_10k <- lookup_tweets(train$Id[1:10000])

train_10_100 <- lookup_tweets(train$Id[10001:100000])

train_100 <- bind_rows(train_10k, train_10_100)
rm(train_10k, train_10_100)

train_100 <- left_join(train_100, train, by = c("status_id" = "Id"))

#saveRDS(train_100, file = "train_100.rds")


### Explore ----

glimpse(train_100)

head(train_100$text)

train_100 %>% count(lang, sort = T)

train_100$geo_coords %>% unlist() %>% table()

train_100 %>% count(geo_coords %>% is.na(), sort = T)

# features that I might care about

log1 <- glm(label ~ length, data = train_100 %>% mutate(length = nchar(text)))

summary(log1)


hist(nchar(train_100$text))
