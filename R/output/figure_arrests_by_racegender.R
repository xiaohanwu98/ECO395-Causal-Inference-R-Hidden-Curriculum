# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. 

read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(total_incarcerated = mean(total_incarcerated)) %>%
  ggplot(aes(race, total_incarcerated, fill = gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    x = "Race", 
    y = "Mean Incarcerated", 
    fill = "Gender",
    title = "Mean Number of Incarcerated in 2002 by Race and Gender") +
  theme_minimal() +
  scale_fill_economist()

ggsave(here("figures/incarcerated_by_racegender.png"), width=8, height=4.5)

