library(ggplot2)
library(tidyr)
library(lubridate) 

setwd("C:/Users/brgaines.UMROOT/Documents/CSC302")
load("~/CSC302/house_prices.rda") 


#Question 2: 
#Load house_prices.rda in R, perform the following operation:

house_prices%>%gather(key=measure, value=value, -c(house_price_index, date, state))->house_reshaped
head(house_reshaped) 
head(house_prices)

#Explain how it changes the original data set:
#it gathers columns into the things we were measuring and the corresponding values into the values column.
#-c tells it the columns to leave as is, so in this case, unemploy_perc and house_price_perc have been gathered into the measure column
#and the corresponding values for both categories are in the value column in the new data set

#Then, create facet_wrap plot which can visualize your values for each state and colorize the lines based on the measurement (unemploy_perc and house_perc.)
#Please consider using scale_x_continuous(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")), labels = c("80", "00", "20"))
#to have a few breaks on your x-axis for a more clear view. Don’t forget to include library(lubridate) in your script.

ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")), labels = c("80", "00", "20"))