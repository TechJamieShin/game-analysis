genre_tm <- separate_rows(games2, genres, convert = TRUE) %>%
  filter(genres != "Games") %>%
  group_by(genres) %>%
  summarize(total = n()) %>%
  arrange(-total)

library(dplyr)
library(treemap)
library(ggplot2)
library(scales)

genre_top10 <- genre_tm %>% slice(-c(11:48))
genre_top10_perc <- genre_top10 %>%
  mutate(total = round(total/sum(total) * 100))

genre_top15 <- genre_tm %>% slice(-c(16:48))

ggplot(genre_top10_perc, aes(x=reorder(genres, total), y= total)) +
  geom_bar(stat = "identity", fill="#999999") +
  coord_flip() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  labs(title = "Top 10 Game Category in App Store", 
       x="Category", y = "Percent(%)")

# Except for EN cuz it is too much
lan_tm <- separate_rows(games2, languages, convert = TRUE) %>%
  filter(languages != "EN") %>%
  group_by(languages) %>%
  summarize(total = n()) %>%
  arrange(-total)

lang_top10 <- lan_tm %>% slice(-c(11:114))
lang_top10_perc <- lang_top10 %>%
  mutate(total = round(total/sum(total) * 100))

ggplot(lang_top10_perc, aes(x=reorder(languages, total), y= total)) +
  geom_bar(stat = "identity", fill="steelblue") +
  coord_flip() +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 12)) +
  labs(title = "Top 10 Game Languages in App Store", 
       x="Languages", y = "Percent(%)")





  

treemap(genre_top10, index = "genres",
        vSize = "total",
        fontsize.labels = 10,
        palette = "RdYlBu",
        title="Game Genres on App Store",
        fontsize.title = 12)





treemap(lan_tm, index = "languages",
        vSize = "total",
        fontsize.labels = 15,            
        palette = "RdYlBu",
        title="Game Languages on App Store",
        fontsize.title = 20)