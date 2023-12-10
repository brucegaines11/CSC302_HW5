library(ggplot2)
library(tidyr)

setwd("C:/Users/brgaines.UMROOT/Documents/CSC302")
load("~/CSC302/house_prices.rda")


#Question 1a:
#Use facet_wrap to draw line plots to represent the trend for house_price_index over years for each state.
#Please have three ticks on the x axis which are for years 1980, 2000, and 2020.
#Since you have limited space your labels can be ’80, ’00, and ’20 for these ticks

#Create a new column for just the years from the date column
house_prices$year <- format(house_prices$date, "%Y")

ggplot(house_prices, aes(x = date, y = house_price_index)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(name = "date", breaks = as.Date(c("1980-01-01", "2000-01-01", "2020-01-01")), labels = c("'80", "'00", "'20")) +
  labs(title = "House Price Index Over Years by State")

#Question 1b:
#Use gather() function from tidyr to reshape your data in a way that it will have measure and value columns
#for house_price_index and unemploy_perc, respectively, in two columns. You should leave out remaining
#attributes by using ”-” in front them inside the function. Then, direct the output to a new data frame called
#house_reshaped

house_reshaped <- house_prices %>% gather(key = "measure", "value", -date, -state, -house_price_perc, -year)
head(house_reshaped)

#Question 1c:
#Use house_reshaped to replicate the graph in 1a with two lines where each represents house_price_index
#and unemploy_perc over the years for each state. Once you have the chart, please comment on it as to whether
#it’s a good graph to present those two pieces of information.

ggplot(house_reshaped, aes(x = date, y = value, color= measure)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(name = "date", breaks = as.Date(c("1980-01-01", "2000-01-01", "2020-01-01")), labels = c("'80", "'00", "'20")) +
  labs(title = "House Price Index Over Years by State")
#I don't think it is the best choice for a graph to present these two pieces of information.
#It is hard to see the variation in unemployment percentages