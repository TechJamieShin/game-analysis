names(games2$age_rating)
games2$age_rating[games2$age_rating == 4] <- '4+'
games2$age_rating[games2$age_rating == 9] <- '9+'
games2$age_rating[games2$age_rating == 12] <- '12+'
games2$age_rating[games2$age_rating == 17] <- '17+'
games2$age_rating
glimpse(games2)

## Age Group ##
waffled <- games2 %>%
  group_by(age_rating) %>%
  summarize(Total = n()) %>%
  mutate(perc = round(Total/sum(Total) * 100)) %>%
  arrange(-perc)
glimpse(waffled)

waffled$age_rating <- c("4+\n(59%)", 
                        "9+\n(19%)", 
                        "12+\n(18%)", 
                        "17+\n(4%)")

perc_counts <- waffled$perc
names(perc_counts) <- waffled$age_rating

waffle(perc_counts, rows = 10, size = 1,
       colors = c("#c7d4b6", "#a3aabd", "#a0d0de", "#97b5cf"),
       legend_pos = "bottom") +
  theme(plot.title = element_text(face = "bold", size = 13, hjust = 0.5)) +
  labs(title = "Age Groups of Mobile Games in App Store")
