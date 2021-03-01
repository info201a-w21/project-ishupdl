lint("chart_3.R")
social_media <- read.csv(file = "whatsgoodlydata_6.csv")
library(dplyr)
library(ggplot2)
library(tidyr)

mycols <- c("#0073C2FF", "#EFC000FF", "#868686FF", "#CD534CFF", "#CD534CFF")

uw_response <- social_media %>%
  filter(segment_description == "University of Washington") %>%
  mutate(prop_2 = (count / 49 * 100)) %>%
  mutate(prop = round(prop_2, 1)) %>%
  select(count, answer, prop)

pie_z <- ggplot(uw_response, aes(x = 2, y = prop, fill = answer)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 1) +
  geom_text(aes(y = prop, label = prop), color = "white") +
  scale_fill_manual(values = mycols) +
  theme_void() +
  xlim(0.5, 2.5)

pie_z





uw_response

pie <- ggplot(uw_response, aes(x = "", y = prop, fill = answer)) +
  geom_bar(stat = "identity", width = 1)

pie <- pie + coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(round(prop), "%")), position =
              position_stack(vjust = 0.5))


pie <- pie + scale_fill_manual(values =
                                c("#55DDE0", "#33658A", "#2F4858",
                                  "#F6AE2D", "#F26419", "#999999"))


pie <- pie + labs(x = NULL, y = "Percentage of Votes per App",
                  fill = NULL, title =
                    "University of Washington Social Media Usage")


pie <- pie + theme_classic() + theme(axis.line =
                                       element_blank(),
                                    axis.text =
                                      element_blank(),
                                    axis.ticks = element_blank(),
                                    plot.title = element_text(hjust =
                                                                0.7, color =
                                                                "#666666"))
chart_z <- pie
chart_z
