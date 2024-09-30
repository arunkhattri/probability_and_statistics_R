library(tidyverse)
library(aplpack)

## Quantitative data

## Annual Precipitation in US Cities
glimpse(precip)
precip[1:4]

# output shows that precip is a numeric vector which has been named

# Length of Major North American Rivers
str(rivers)
rivers[1:5]

# Yearly numbers of important discoveries
str(discoveries)
discoveries[1:5]

# Displaying Quantitative data
stripchart(precip, xlab = "rainfall")
dotchart(precip, labels = row.names(precip), xlab = 'rainfall')


plot(precip,
     main = "Annual Precipitation in US cities",
     xlab = "Precipitation",
     ylab = "Cities")
text(precip, names(precip), cex=0.6, pos=4, col='red')

# convert to dataframe
cities <- names(precip)
rainfall <- as.vector(precip)
df_precip <- data.frame(cities, rainfall)

df_precip %>%
  ggplot(aes(cities, rainfall)) +
  geom_point() +
  labs(title = "Annual Precipitation in US cities",
       x = "Precipitation",
       Y = "Cities")+
  theme(axis.text.x = element_text(angle = 60,hjust = 1))

# histogram
hist(precip, main = "Annual Precipitation in US cities")


df_precip %>%
  ggplot(aes(x = rainfall)) +
  geom_histogram(breaks = seq(0, max(df_precip$rainfall) + 10, 10),
                 color = "white")

stem.leaf(precip, depth = TRUE)
# density
df_precip %>%
  ggplot(aes(x = rainfall)) +
  geom_histogram(breaks = seq(0, max(df_precip$rainfall) + 10, 10),
                 color = "white") +
  geom_density(aes(y = after_stat(density)))
