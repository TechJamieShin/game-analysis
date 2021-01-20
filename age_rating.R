games2 %>%
  filter(!is.na(average_user_rating)) %>%
  ggplot(aes(x = fct_rev(as.factor(-average_user_rating)))) +
  geom_bar(fill = "grey") +
  labs(title = "Average Rating by Age Group") +
  #theme_stata() +
  theme(strip.text = element_text(size = 10),
        plot.title = element_text(face = "bold", size = 13, hjust = 0.5, vjust = 2),
        axis.title.x = element_blank(),
        axis.title.y = element_blank()) +
  facet_wrap(~ fct_infreq(as.factor(age_rating)))
