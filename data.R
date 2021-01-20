install.packages("tidyverse")
install.packages("data.table")
install.packages("lubridate")
install.packages("tidytext")
install.packages("janitor")
install.packages("ggthemes")
install.packages("treemap")
install.packages("waffle")
install.packages("hrbrthemes")
install.packages("scales")
install.packages("DT")
install.packages("ggplot2")

library(tidyverse)
library(data.table)
library(lubridate)
library(tidytext)
library(janitor)
library(ggthemes)
library(waffle)
library(hrbrthemes)
library(scales)
library(DT)
library(ggplot2)

options(scipen = 999)

games <- read.csv("~/STA/Test1/appstore_games2.csv", sep=";")

games <- games %>%
  clean_names("snake")

games2 <- games %>%
  filter(!is.na(size) & !is.na(user_rating_count))

games2 <- games2 %>%
  mutate(in_app_purchases = ifelse(!is.na(in_app_purchases), "Yes", "No"))

names(games2$in_app_purchases)
games2$original_release_date <- dmy(games2$original_release_date)
games2$current_version_release_date <- dmy(games2$current_version_release_date)
