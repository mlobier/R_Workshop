##############
#
# This script creates a set of 3 untidy data sets from the original gapminder data
#
##############


library(tidyverse)
library(gapminder)

  gapminder %>%
    select(-pop, -continent) %>%
    filter(year==1952 | year==1972 | year ==1992) %>%
    gather( variable_name, variable_value, -country, -year) -> gapminder_1

  gapminder_1 %>%
    unite(all_variables, variable_name, year) %>%
    spread(key=all_variables, value=variable_value) -> gapminder_2
  
  gapminder %>%
    select(-pop, -continent) %>%
    filter(year==1952 | year==1972 | year ==1992) -> gapminder_3
  
  gapminder_1 %>%
    filter(variable_name=='lifeExp') %>%
    spread(key=year, value=variable_value) %>%
    select(-variable_name) -> gapminder_4_1

  gapminder_1 %>%
    filter(variable_name=='gdpPercap') %>%
    spread(key=year, value=variable_value) %>%
    select(-variable_name) -> gapminder_4_2  
    
  save(gapminder_1, gapminder_2,gapminder_3, gapminder_4_1, gapminder_4_2, file= "D:/R/R_Workshop/data/is_my_data_tidy.RData")
  