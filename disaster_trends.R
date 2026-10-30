pacman::p_load(
  tidyverse,
  kableExtra,
  flextable,
  glue,
  ggplot2)

options(scipen=999)

data <- read.csv("EMDAT.csv", header = TRUE)

df <- data %>% 
  select(Entity, Year, deaths_all_disasters,injured_all_disasters,homeless_all_disasters) %>%
  rename(deaths = deaths_all_disasters, injuries = injured_all_disasters, homelessness = homeless_all_disasters, country = Entity)

filtered_df <- df %>% filter(country %in% c("","","","",""))

# Using `purrr` automate plotting the trends for 5 countries

df %>%
  select(-country, -Year) %>%
  map_dbl(mean, na.rm = TRUE)

# x should be year col 3,4,5 is y
