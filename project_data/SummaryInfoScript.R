my_dataframe <- read.csv("whatsgoodlydata_6.csv")

install.packages("tidyverse")
library(tidyverse)

summary_info <- list()
# Number of features (columns)
summary_info$num_features <- ncol(my_dataframe)
# Number of different social media platforms as answer choices
summary_info$num_socials <- length(unique(my_dataframe[["answer"]]))

# Number most influenced by Facebook
summary_info$num_facebook <- my_dataframe %>%
  filter(answer == "Facebook") %>%
  summarize(sum_facebook = sum(count, na.rm = FALSE)) %>%
  pull(sum_facebook)

# Number most influenced by Instagram
summary_info$num_instagram <- my_dataframe %>%
  filter(answer == "Instagram") %>%
  summarize(sum_instagram = sum(count, na.rm = FALSE)) %>%
  pull(sum_instagram)

# Number most influenced by Snapchat
summary_info$num_snapchat <- my_dataframe %>%
  filter(answer == "Snapchat") %>%
  summarize(sum_snapchat = sum(count, na.rm = FALSE)) %>%
  pull(sum_snapchat)

# Number most influenced by Twitter
summary_info$num_twitter <- my_dataframe %>%
  filter(answer == "Twitter") %>%
  summarize(sum_twitter = sum(count, na.rm = FALSE)) %>%
  pull(sum_twitter)

# Number most influenced by none
summary_info$num_none <- my_dataframe %>%
  filter(answer == "None") %>%
  summarize(sum_none = sum(count, na.rm = FALSE)) %>%
  pull(sum_none)
