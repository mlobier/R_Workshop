---
title       : Introduction to R Workshop 
subtitle    : Session 2
author      : Muriel Lobier
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap]           # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<style>
pre {
  margin-top: -15px;
}
</style>

<style>
.large {
   font-size: 150%;
}
</style>

<style>
slide.smallcode pre {
  font-size: 16px;
}
</style>

---

## Session 2 - Main Goals

### Dataframes and Tibbles

###  Tidy data

### Data wrangling

---

## Dataframes and Tibbles

### Understand the avantages of tibbles

### Be able to extract information from tibbles

### Be able to manipulate factors


--- .class #id 

## Dataframes 

### Dataframes are the main data structures:

```r
rm(list=ls())
iris
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            5.1         3.5          1.4         0.2     setosa
## 2            4.9         3.0          1.4         0.2     setosa
## 3            4.7         3.2          1.3         0.2     setosa
## 4            4.6         3.1          1.5         0.2     setosa
## 5            5.0         3.6          1.4         0.2     setosa
## 6            5.4         3.9          1.7         0.4     setosa
## 7            4.6         3.4          1.4         0.3     setosa
## 8            5.0         3.4          1.5         0.2     setosa
## 9            4.4         2.9          1.4         0.2     setosa
## 10           4.9         3.1          1.5         0.1     setosa
## 11           5.4         3.7          1.5         0.2     setosa
## 12           4.8         3.4          1.6         0.2     setosa
## 13           4.8         3.0          1.4         0.1     setosa
## 14           4.3         3.0          1.1         0.1     setosa
## 15           5.8         4.0          1.2         0.2     setosa
## 16           5.7         4.4          1.5         0.4     setosa
## 17           5.4         3.9          1.3         0.4     setosa
## 18           5.1         3.5          1.4         0.3     setosa
## 19           5.7         3.8          1.7         0.3     setosa
## 20           5.1         3.8          1.5         0.3     setosa
## 21           5.4         3.4          1.7         0.2     setosa
## 22           5.1         3.7          1.5         0.4     setosa
## 23           4.6         3.6          1.0         0.2     setosa
## 24           5.1         3.3          1.7         0.5     setosa
## 25           4.8         3.4          1.9         0.2     setosa
## 26           5.0         3.0          1.6         0.2     setosa
## 27           5.0         3.4          1.6         0.4     setosa
## 28           5.2         3.5          1.5         0.2     setosa
## 29           5.2         3.4          1.4         0.2     setosa
## 30           4.7         3.2          1.6         0.2     setosa
## 31           4.8         3.1          1.6         0.2     setosa
## 32           5.4         3.4          1.5         0.4     setosa
## 33           5.2         4.1          1.5         0.1     setosa
## 34           5.5         4.2          1.4         0.2     setosa
## 35           4.9         3.1          1.5         0.2     setosa
## 36           5.0         3.2          1.2         0.2     setosa
## 37           5.5         3.5          1.3         0.2     setosa
## 38           4.9         3.6          1.4         0.1     setosa
## 39           4.4         3.0          1.3         0.2     setosa
## 40           5.1         3.4          1.5         0.2     setosa
## 41           5.0         3.5          1.3         0.3     setosa
## 42           4.5         2.3          1.3         0.3     setosa
## 43           4.4         3.2          1.3         0.2     setosa
## 44           5.0         3.5          1.6         0.6     setosa
## 45           5.1         3.8          1.9         0.4     setosa
## 46           4.8         3.0          1.4         0.3     setosa
## 47           5.1         3.8          1.6         0.2     setosa
## 48           4.6         3.2          1.4         0.2     setosa
## 49           5.3         3.7          1.5         0.2     setosa
## 50           5.0         3.3          1.4         0.2     setosa
## 51           7.0         3.2          4.7         1.4 versicolor
## 52           6.4         3.2          4.5         1.5 versicolor
## 53           6.9         3.1          4.9         1.5 versicolor
## 54           5.5         2.3          4.0         1.3 versicolor
## 55           6.5         2.8          4.6         1.5 versicolor
## 56           5.7         2.8          4.5         1.3 versicolor
## 57           6.3         3.3          4.7         1.6 versicolor
## 58           4.9         2.4          3.3         1.0 versicolor
## 59           6.6         2.9          4.6         1.3 versicolor
## 60           5.2         2.7          3.9         1.4 versicolor
## 61           5.0         2.0          3.5         1.0 versicolor
## 62           5.9         3.0          4.2         1.5 versicolor
## 63           6.0         2.2          4.0         1.0 versicolor
## 64           6.1         2.9          4.7         1.4 versicolor
## 65           5.6         2.9          3.6         1.3 versicolor
## 66           6.7         3.1          4.4         1.4 versicolor
## 67           5.6         3.0          4.5         1.5 versicolor
## 68           5.8         2.7          4.1         1.0 versicolor
## 69           6.2         2.2          4.5         1.5 versicolor
## 70           5.6         2.5          3.9         1.1 versicolor
## 71           5.9         3.2          4.8         1.8 versicolor
## 72           6.1         2.8          4.0         1.3 versicolor
## 73           6.3         2.5          4.9         1.5 versicolor
## 74           6.1         2.8          4.7         1.2 versicolor
## 75           6.4         2.9          4.3         1.3 versicolor
## 76           6.6         3.0          4.4         1.4 versicolor
## 77           6.8         2.8          4.8         1.4 versicolor
## 78           6.7         3.0          5.0         1.7 versicolor
## 79           6.0         2.9          4.5         1.5 versicolor
## 80           5.7         2.6          3.5         1.0 versicolor
## 81           5.5         2.4          3.8         1.1 versicolor
## 82           5.5         2.4          3.7         1.0 versicolor
## 83           5.8         2.7          3.9         1.2 versicolor
## 84           6.0         2.7          5.1         1.6 versicolor
## 85           5.4         3.0          4.5         1.5 versicolor
## 86           6.0         3.4          4.5         1.6 versicolor
## 87           6.7         3.1          4.7         1.5 versicolor
## 88           6.3         2.3          4.4         1.3 versicolor
## 89           5.6         3.0          4.1         1.3 versicolor
## 90           5.5         2.5          4.0         1.3 versicolor
## 91           5.5         2.6          4.4         1.2 versicolor
## 92           6.1         3.0          4.6         1.4 versicolor
## 93           5.8         2.6          4.0         1.2 versicolor
## 94           5.0         2.3          3.3         1.0 versicolor
## 95           5.6         2.7          4.2         1.3 versicolor
## 96           5.7         3.0          4.2         1.2 versicolor
## 97           5.7         2.9          4.2         1.3 versicolor
## 98           6.2         2.9          4.3         1.3 versicolor
## 99           5.1         2.5          3.0         1.1 versicolor
## 100          5.7         2.8          4.1         1.3 versicolor
## 101          6.3         3.3          6.0         2.5  virginica
## 102          5.8         2.7          5.1         1.9  virginica
## 103          7.1         3.0          5.9         2.1  virginica
## 104          6.3         2.9          5.6         1.8  virginica
## 105          6.5         3.0          5.8         2.2  virginica
## 106          7.6         3.0          6.6         2.1  virginica
## 107          4.9         2.5          4.5         1.7  virginica
## 108          7.3         2.9          6.3         1.8  virginica
## 109          6.7         2.5          5.8         1.8  virginica
## 110          7.2         3.6          6.1         2.5  virginica
## 111          6.5         3.2          5.1         2.0  virginica
## 112          6.4         2.7          5.3         1.9  virginica
## 113          6.8         3.0          5.5         2.1  virginica
## 114          5.7         2.5          5.0         2.0  virginica
## 115          5.8         2.8          5.1         2.4  virginica
## 116          6.4         3.2          5.3         2.3  virginica
## 117          6.5         3.0          5.5         1.8  virginica
## 118          7.7         3.8          6.7         2.2  virginica
## 119          7.7         2.6          6.9         2.3  virginica
## 120          6.0         2.2          5.0         1.5  virginica
## 121          6.9         3.2          5.7         2.3  virginica
## 122          5.6         2.8          4.9         2.0  virginica
## 123          7.7         2.8          6.7         2.0  virginica
## 124          6.3         2.7          4.9         1.8  virginica
## 125          6.7         3.3          5.7         2.1  virginica
## 126          7.2         3.2          6.0         1.8  virginica
## 127          6.2         2.8          4.8         1.8  virginica
## 128          6.1         3.0          4.9         1.8  virginica
## 129          6.4         2.8          5.6         2.1  virginica
## 130          7.2         3.0          5.8         1.6  virginica
## 131          7.4         2.8          6.1         1.9  virginica
## 132          7.9         3.8          6.4         2.0  virginica
## 133          6.4         2.8          5.6         2.2  virginica
## 134          6.3         2.8          5.1         1.5  virginica
## 135          6.1         2.6          5.6         1.4  virginica
## 136          7.7         3.0          6.1         2.3  virginica
## 137          6.3         3.4          5.6         2.4  virginica
## 138          6.4         3.1          5.5         1.8  virginica
## 139          6.0         3.0          4.8         1.8  virginica
## 140          6.9         3.1          5.4         2.1  virginica
## 141          6.7         3.1          5.6         2.4  virginica
## 142          6.9         3.1          5.1         2.3  virginica
## 143          5.8         2.7          5.1         1.9  virginica
## 144          6.8         3.2          5.9         2.3  virginica
## 145          6.7         3.3          5.7         2.5  virginica
## 146          6.7         3.0          5.2         2.3  virginica
## 147          6.3         2.5          5.0         1.9  virginica
## 148          6.5         3.0          5.2         2.0  virginica
## 149          6.2         3.4          5.4         2.3  virginica
## 150          5.9         3.0          5.1         1.8  virginica
```

--- 

## Better dataframes: tibbles !!

### Load the `gapminder` library to access the gapminder dataset

```r
library(gapminder)
gapminder
```

```
## # A tibble: 1,704 x 6
##        country continent  year lifeExp      pop gdpPercap
##         <fctr>    <fctr> <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan      Asia  1952  28.801  8425333  779.4453
##  2 Afghanistan      Asia  1957  30.332  9240934  820.8530
##  3 Afghanistan      Asia  1962  31.997 10267083  853.1007
##  4 Afghanistan      Asia  1967  34.020 11537966  836.1971
##  5 Afghanistan      Asia  1972  36.088 13079460  739.9811
##  6 Afghanistan      Asia  1977  38.438 14880372  786.1134
##  7 Afghanistan      Asia  1982  39.854 12881816  978.0114
##  8 Afghanistan      Asia  1987  40.822 13867957  852.3959
##  9 Afghanistan      Asia  1992  41.674 16317921  649.3414
## 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
## # ... with 1,694 more rows
```

--- 

## Better dataframes: Tibbles !!

### Why are tibbles better ???

```
## # A tibble: 5 x 6
##       country continent  year lifeExp      pop gdpPercap
##        <fctr>    <fctr> <int>   <dbl>    <int>     <dbl>
## 1 Afghanistan      Asia  1952  28.801  8425333  779.4453
## 2 Afghanistan      Asia  1957  30.332  9240934  820.8530
## 3 Afghanistan      Asia  1962  31.997 10267083  853.1007
## 4 Afghanistan      Asia  1967  34.020 11537966  836.1971
## 5 Afghanistan      Asia  1972  36.088 13079460  739.9811
```


```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
```
---

## Better dataframes: Tibbles

### You can convert a data frame into a tibble

```r
as.tibble(iris)
```

```
## # A tibble: 150 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl>  <fctr>
##  1          5.1         3.5          1.4         0.2  setosa
##  2          4.9         3.0          1.4         0.2  setosa
##  3          4.7         3.2          1.3         0.2  setosa
##  4          4.6         3.1          1.5         0.2  setosa
##  5          5.0         3.6          1.4         0.2  setosa
##  6          5.4         3.9          1.7         0.4  setosa
##  7          4.6         3.4          1.4         0.3  setosa
##  8          5.0         3.4          1.5         0.2  setosa
##  9          4.4         2.9          1.4         0.2  setosa
## 10          4.9         3.1          1.5         0.1  setosa
## # ... with 140 more rows
```

--- 

## Main commands

### You can convert a data frame into a tibble

```r
names(gapminder)
```

```
## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"
```

--- 

## Main commands


```r
names(gapminder)
```

```
## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"
```

```r
dim(gapminder)
```

```
## [1] 1704    6
```

--- 

## Main commands


```r
names(gapminder)
```

```
## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"
```

```r
dim(gapminder)
```

```
## [1] 1704    6
```

```r
nrow(gapminder)
```

```
## [1] 1704
```

--- 

## Main commands


```r
names(gapminder)
```

```
## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"
```

```r
dim(gapminder)
```

```
## [1] 1704    6
```

```r
nrow(gapminder)
```

```
## [1] 1704
```

```r
ncol(gapminder)
```

```
## [1] 6
```

---

## Specifying a variable

### Use the `$` operator


```r
summary(gapminder$gdpPercap)
```

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##    241.2   1202.1   3531.8   7215.3   9325.5 113523.1
```

---

## Categorical variables: factors

### Factors encode categorical variables


```r
gapminder
```

```
## # A tibble: 1,704 x 6
##        country continent  year lifeExp      pop gdpPercap
##         <fctr>    <fctr> <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan      Asia  1952  28.801  8425333  779.4453
##  2 Afghanistan      Asia  1957  30.332  9240934  820.8530
##  3 Afghanistan      Asia  1962  31.997 10267083  853.1007
##  4 Afghanistan      Asia  1967  34.020 11537966  836.1971
##  5 Afghanistan      Asia  1972  36.088 13079460  739.9811
##  6 Afghanistan      Asia  1977  38.438 14880372  786.1134
##  7 Afghanistan      Asia  1982  39.854 12881816  978.0114
##  8 Afghanistan      Asia  1987  40.822 13867957  852.3959
##  9 Afghanistan      Asia  1992  41.674 16317921  649.3414
## 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
## # ... with 1,694 more rows
```


---

## Categorical variables: factors

### Factors have a finite number of levels


```r
nlevels(gapminder$continent)
```

```
## [1] 5
```

### How many  countries are represented in the dataset??

---

## Categorical variables: factors

### Factor values can be extracted as a vector


```r
levels(gapminder$continent)
```

```
## [1] "Africa"   "Americas" "Asia"     "Europe"   "Oceania"
```

---

## Categorical variables: factors

### Factor values can be extracted as a vector


```r
levels(gapminder$continent)
```

```
## [1] "Africa"   "Americas" "Asia"     "Europe"   "Oceania"
```

### What are the last five countries in the dataset?

---

## Categorical variables: factors

### Factor values can be extracted as a vector


```r
levels(gapminder$continent)
```

```
## [1] "Africa"   "Americas" "Asia"     "Europe"   "Oceania"
```

### What are the last five countries in the dataset?

```r
tail(levels(gapminder$country))
```

```
## [1] "Venezuela"          "Vietnam"            "West Bank and Gaza"
## [4] "Yemen, Rep."        "Zambia"             "Zimbabwe"
```

---

## Categorical variables: factors

### How many observations do we have for each continent ?

```r
summary(gapminder$continent)
```

--- .smallcode

## Categorical variables: factors

### How many observations do we have for each continent ?

```r
summary(gapminder$continent)
```

```
##   Africa Americas     Asia   Europe  Oceania 
##      624      300      396      360       24
```

---

## Categorical variables: factors

### How many observations do we have for each continent ?

```r
summary(gapminder$continent)
```

```
##   Africa Americas     Asia   Europe  Oceania 
##      624      300      396      360       24
```


### How many observations do we have for each continent - other option?

```r
table(gapminder$continent)
```

```
## 
##   Africa Americas     Asia   Europe  Oceania 
##      624      300      396      360       24
```

--- 

## Categorical variables: factors

### How does R store factors "under the hood" ?

```r
str(gapminder$country)
```

---

## Converting string variables to factors

### Inspect the `mpg` data set - which variables should be factors ?

---

## Converting string variables to factors

### Inspect the `mpg` data set - which variables should be factors ?


```
## # A tibble: 2 x 11
##   manufacturer model displ  year   cyl      trans   drv   cty   hwy    fl
##          <chr> <chr> <dbl> <int> <int>      <chr> <chr> <int> <int> <chr>
## 1         audi    a4   1.8  1999     4   auto(l5)     f    18    29     p
## 2         audi    a4   1.8  1999     4 manual(m5)     f    21    29     p
## # ... with 1 more variables: class <chr>
```

--- .smallcode

## Converting string variables to factors

### Inspect the `mpg` data set - which variables should be factors ?


```
## # A tibble: 2 x 11
##   manufacturer model displ  year   cyl      trans   drv   cty   hwy    fl
##          <chr> <chr> <dbl> <int> <int>      <chr> <chr> <int> <int> <chr>
## 1         audi    a4   1.8  1999     4   auto(l5)     f    18    29     p
## 2         audi    a4   1.8  1999     4 manual(m5)     f    21    29     p
## # ... with 1 more variables: class <chr>
```

### Use the `as.factor()` command and  `<-`  to convert the `manufacturer` variable to  *factor*

--- .smallcode

## Converting string variables to factors

### Inspect the `mpg` data set - which variables should be factors ?


```
## # A tibble: 2 x 11
##   manufacturer model displ  year   cyl      trans   drv   cty   hwy    fl
##          <chr> <chr> <dbl> <int> <int>      <chr> <chr> <int> <int> <chr>
## 1         audi    a4   1.8  1999     4   auto(l5)     f    18    29     p
## 2         audi    a4   1.8  1999     4 manual(m5)     f    21    29     p
## # ... with 1 more variables: class <chr>
```

### Use the `as.factor()` command and  `<-`  to convert the `manufacturer` variable to  *factor*


```r
mpg$manufacturer<-as.factor(mpg$manufacturer)
```

```
## # A tibble: 2 x 11
##   manufacturer model displ  year   cyl      trans   drv   cty   hwy    fl
##         <fctr> <chr> <dbl> <int> <int>      <chr> <chr> <int> <int> <chr>
## 1         audi    a4   1.8  1999     4   auto(l5)     f    18    29     p
## 2         audi    a4   1.8  1999     4 manual(m5)     f    21    29     p
## # ... with 1 more variables: class <chr>
```

--- .smallcode

## Converting string variables to factors

### Convert the `manufacturer` variable back to character (`as.character()`)


```
## # A tibble: 2 x 11
##   manufacturer model displ  year   cyl      trans   drv   cty   hwy    fl
##         <fctr> <chr> <dbl> <int> <int>      <chr> <chr> <int> <int> <chr>
## 1         audi    a4   1.8  1999     4   auto(l5)     f    18    29     p
## 2         audi    a4   1.8  1999     4 manual(m5)     f    21    29     p
## # ... with 1 more variables: class <chr>
```

--- .smallcode

## Converting string variables to factors

### Convert the `manufacturer` variable back to character (`as.character()`)


```r
mpg$manufacturer<-as.character(mpg$manufacturer)
```

```
## # A tibble: 2 x 11
##   manufacturer model displ  year   cyl      trans   drv   cty   hwy    fl
##          <chr> <chr> <dbl> <int> <int>      <chr> <chr> <int> <int> <chr>
## 1         audi    a4   1.8  1999     4   auto(l5)     f    18    29     p
## 2         audi    a4   1.8  1999     4 manual(m5)     f    21    29     p
## # ... with 1 more variables: class <chr>
```

---

## Categorical variables: factors

### How does R store factors "under the hood" ?

```r
str(gapminder$country)
```

---

## Categorical variables: factors

### How does R store factors "under the hood" ?


```r
str(gapminder$country)
```

```
##  Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
```


---

## Tidy data

### Be able to identify if a dataset is tidy

### Be able to use tidyverse functions to tidy a dataset

  * `gather()`
  * `spread()`
  * `separate()`
  * `inner_join()` and friends


---

## Tidy data

### What is tidy data? 



<img class=center
  src=assets/img/session_2_tidy_data.png width=800px>
  

--- &twocol_l

## Tidy data

### Run the following line of code to load 4 datasets

```r
load(file="data/is_my_data_tidy.RData")
```


*** =left

gapminder_1

gapminder_2

*** =right

gapminder_3

gapminder_4_1 and _2


--- .smallcode &twocol_l

## Tidy data

### Which one(s) of these datasets is(are) tidy?

*** =left

gapminder_1

```
## # A tibble: 4 x 4
##       country  year variable_name variable_value
##        <fctr> <int>         <chr>          <dbl>
## 1 Afghanistan  1952       lifeExp         28.801
## 2 Afghanistan  1972       lifeExp         36.088
## 3 Afghanistan  1992       lifeExp         41.674
## 4     Albania  1952       lifeExp         55.230
```

gapminder_3

```
## # A tibble: 4 x 4
##       country  year lifeExp gdpPercap
##        <fctr> <int>   <dbl>     <dbl>
## 1 Afghanistan  1952  28.801  779.4453
## 2 Afghanistan  1972  36.088  739.9811
## 3 Afghanistan  1992  41.674  649.3414
## 4     Albania  1952  55.230 1601.0561
```

*** =right

gapminder_2

```
## # A tibble: 4 x 7
##       country gdpPercap_1952 gdpPercap_1972 gdpPercap_1992 lifeExp_1952
##        <fctr>          <dbl>          <dbl>          <dbl>        <dbl>
## 1 Afghanistan       779.4453       739.9811       649.3414       28.801
## 2     Albania      1601.0561      3313.4222      2497.4379       55.230
## 3     Algeria      2449.0082      4182.6638      5023.2166       43.077
## 4      Angola      3520.6103      5473.2880      2627.8457       30.015
## # ... with 2 more variables: lifeExp_1972 <dbl>, lifeExp_1992 <dbl>
```

gapminder_4_1 and _2


```
## # A tibble: 1 x 4
##       country `1952` `1972` `1992`
##        <fctr>  <dbl>  <dbl>  <dbl>
## 1 Afghanistan 28.801 36.088 41.674
```


```
## # A tibble: 1 x 4
##       country   `1952`   `1972`   `1992`
##        <fctr>    <dbl>    <dbl>    <dbl>
## 1 Afghanistan 779.4453 739.9811 649.3414
```

---

## Tidy data
### gapminder_1

```
## # A tibble: 852 x 4
##        country  year variable_name variable_value
##         <fctr> <int>         <chr>          <dbl>
##  1 Afghanistan  1952       lifeExp         28.801
##  2 Afghanistan  1972       lifeExp         36.088
##  3 Afghanistan  1992       lifeExp         41.674
##  4     Albania  1952       lifeExp         55.230
##  5     Albania  1972       lifeExp         67.690
##  6     Albania  1992       lifeExp         71.581
##  7     Algeria  1952       lifeExp         43.077
##  8     Algeria  1972       lifeExp         54.518
##  9     Algeria  1992       lifeExp         67.744
## 10      Angola  1952       lifeExp         30.015
## # ... with 842 more rows
```

---

## Tidy data
### gapminder_1

```
## # A tibble: 852 x 4
##        country  year variable_name variable_value
##         <fctr> <int>         <chr>          <dbl>
##  1 Afghanistan  1952       lifeExp         28.801
##  2 Afghanistan  1972       lifeExp         36.088
##  3 Afghanistan  1992       lifeExp         41.674
##  4     Albania  1952       lifeExp         55.230
##  5     Albania  1972       lifeExp         67.690
##  6     Albania  1992       lifeExp         71.581
##  7     Algeria  1952       lifeExp         43.077
##  8     Algeria  1972       lifeExp         54.518
##  9     Algeria  1992       lifeExp         67.744
## 10      Angola  1952       lifeExp         30.015
## # ... with 842 more rows
```

**NOT TIDY**


---.smallcode


## Tidy data
### gapminder_2

```
## # A tibble: 142 x 7
##        country gdpPercap_1952 gdpPercap_1972 gdpPercap_1992 lifeExp_1952
##  *      <fctr>          <dbl>          <dbl>          <dbl>        <dbl>
##  1 Afghanistan       779.4453       739.9811       649.3414       28.801
##  2     Albania      1601.0561      3313.4222      2497.4379       55.230
##  3     Algeria      2449.0082      4182.6638      5023.2166       43.077
##  4      Angola      3520.6103      5473.2880      2627.8457       30.015
##  5   Argentina      5911.3151      9443.0385      9308.4187       62.485
##  6   Australia     10039.5956     16788.6295     23424.7668       69.120
##  7     Austria      6137.0765     16661.6256     27042.0187       66.800
##  8     Bahrain      9867.0848     18268.6584     19035.5792       50.939
##  9  Bangladesh       684.2442       630.2336       837.8102       37.484
## 10     Belgium      8343.1051     16672.1436     25575.5707       68.000
## # ... with 132 more rows, and 2 more variables: lifeExp_1972 <dbl>,
## #   lifeExp_1992 <dbl>
```

--- .smallcode

## Tidy data
### gapminder_2

```
## # A tibble: 142 x 7
##        country gdpPercap_1952 gdpPercap_1972 gdpPercap_1992 lifeExp_1952
##  *      <fctr>          <dbl>          <dbl>          <dbl>        <dbl>
##  1 Afghanistan       779.4453       739.9811       649.3414       28.801
##  2     Albania      1601.0561      3313.4222      2497.4379       55.230
##  3     Algeria      2449.0082      4182.6638      5023.2166       43.077
##  4      Angola      3520.6103      5473.2880      2627.8457       30.015
##  5   Argentina      5911.3151      9443.0385      9308.4187       62.485
##  6   Australia     10039.5956     16788.6295     23424.7668       69.120
##  7     Austria      6137.0765     16661.6256     27042.0187       66.800
##  8     Bahrain      9867.0848     18268.6584     19035.5792       50.939
##  9  Bangladesh       684.2442       630.2336       837.8102       37.484
## 10     Belgium      8343.1051     16672.1436     25575.5707       68.000
## # ... with 132 more rows, and 2 more variables: lifeExp_1972 <dbl>,
## #   lifeExp_1992 <dbl>
```

**NOT TIDY**

---

## Tidy data
### gapminder_3

```
## # A tibble: 426 x 4
##        country  year lifeExp gdpPercap
##         <fctr> <int>   <dbl>     <dbl>
##  1 Afghanistan  1952  28.801  779.4453
##  2 Afghanistan  1972  36.088  739.9811
##  3 Afghanistan  1992  41.674  649.3414
##  4     Albania  1952  55.230 1601.0561
##  5     Albania  1972  67.690 3313.4222
##  6     Albania  1992  71.581 2497.4379
##  7     Algeria  1952  43.077 2449.0082
##  8     Algeria  1972  54.518 4182.6638
##  9     Algeria  1992  67.744 5023.2166
## 10      Angola  1952  30.015 3520.6103
## # ... with 416 more rows
```

---

## Tidy data
### gapminder_3

```
## # A tibble: 426 x 4
##        country  year lifeExp gdpPercap
##         <fctr> <int>   <dbl>     <dbl>
##  1 Afghanistan  1952  28.801  779.4453
##  2 Afghanistan  1972  36.088  739.9811
##  3 Afghanistan  1992  41.674  649.3414
##  4     Albania  1952  55.230 1601.0561
##  5     Albania  1972  67.690 3313.4222
##  6     Albania  1992  71.581 2497.4379
##  7     Algeria  1952  43.077 2449.0082
##  8     Algeria  1972  54.518 4182.6638
##  9     Algeria  1992  67.744 5023.2166
## 10      Angola  1952  30.015 3520.6103
## # ... with 416 more rows
```

**TIDY**

---.smallcode

## Tidy data
### gapminder_4_1 and _4_2

```
## # A tibble: 4 x 4
##       country `1952` `1972` `1992`
##        <fctr>  <dbl>  <dbl>  <dbl>
## 1 Afghanistan 28.801 36.088 41.674
## 2     Albania 55.230 67.690 71.581
## 3     Algeria 43.077 54.518 67.744
## 4      Angola 30.015 37.928 40.647
```

```
## # A tibble: 4 x 4
##       country    `1952`    `1972`    `1992`
##        <fctr>     <dbl>     <dbl>     <dbl>
## 1 Afghanistan  779.4453  739.9811  649.3414
## 2     Albania 1601.0561 3313.4222 2497.4379
## 3     Algeria 2449.0082 4182.6638 5023.2166
## 4      Angola 3520.6103 5473.2880 2627.8457
```

---.smallcode

## Tidy data
### gapminder_4_1 and _4_2

```
## # A tibble: 4 x 4
##       country `1952` `1972` `1992`
##        <fctr>  <dbl>  <dbl>  <dbl>
## 1 Afghanistan 28.801 36.088 41.674
## 2     Albania 55.230 67.690 71.581
## 3     Algeria 43.077 54.518 67.744
## 4      Angola 30.015 37.928 40.647
```

```
## # A tibble: 4 x 4
##       country    `1952`    `1972`    `1992`
##        <fctr>     <dbl>     <dbl>     <dbl>
## 1 Afghanistan  779.4453  739.9811  649.3414
## 2     Albania 1601.0561 3313.4222 2497.4379
## 3     Algeria 2449.0082 4182.6638 5023.2166
## 4      Angola 3520.6103 5473.2880 2627.8457
```

**NOT TIDY**

---

## Making data tidy - a cheatsheet 


<img class=center
  src=assets/img/session_2_data_wranling.png width = 700px>


---.smallcode

## Making data tidy - spread()

### What do we need to do to go from here:

```
## # A tibble: 4 x 4
##       country  year variable_name variable_value
##        <fctr> <int>         <chr>          <dbl>
## 1 Afghanistan  1952       lifeExp         28.801
## 2 Afghanistan  1972       lifeExp         36.088
## 3 Afghanistan  1992       lifeExp         41.674
## 4     Albania  1952       lifeExp         55.230
```
to 


```
## # A tibble: 4 x 4
##       country  year lifeExp gdpPercap
##        <fctr> <int>   <dbl>     <dbl>
## 1 Afghanistan  1952  28.801  779.4453
## 2 Afghanistan  1972  36.088  739.9811
## 3 Afghanistan  1992  41.674  649.3414
## 4     Albania  1952  55.230 1601.0561
```

---

## Making data tidy - spread()

### `spread(data, key = measure_type , value= result, fill=NA, ...)`

<img class=center
  src=assets/img/session_2_spread.png width = 800px>



---.smallcode

## Making data tidy - spread()

### `spread(data, key = ? , value = ?)`



```
## # A tibble: 4 x 3
##   subject measure_type result
##     <chr>        <chr>  <dbl>
## 1    S001           RT   1.45
## 2    S001     hit_rate   0.71
## 3    S002           RT   1.20
## 4    S002     hit_rate   0.56
```

---.smallcode

## Making data tidy - spread()

### `spread(data, key = ? , value = ?)`


```
## # A tibble: 1 x 5
##   subject hitrate.session1 hitrate.session2 RT.session1 RT.session2
## *   <chr>            <dbl>            <dbl>       <dbl>       <dbl>
## 1    S001             0.74             0.85        1.45        1.23
```

```r
spread(data=my_data, key=measure_type, value = result)
```

```
## # A tibble: 2 x 3
##   subject hit_rate    RT
## *   <chr>    <dbl> <dbl>
## 1    S001     0.71  1.45
## 2    S002     0.56  1.20
```



---.smallcode

## Making data tidy - spread()

### Use the `spread()` function to go from:

```
## # A tibble: 4 x 4
##       country  year variable_name variable_value
##        <fctr> <int>         <chr>          <dbl>
## 1 Afghanistan  1952       lifeExp         28.801
## 2 Afghanistan  1972       lifeExp         36.088
## 3 Afghanistan  1992       lifeExp         41.674
## 4     Albania  1952       lifeExp         55.230
```
to 


```
## # A tibble: 4 x 4
##       country  year lifeExp gdpPercap
##        <fctr> <int>   <dbl>     <dbl>
## 1 Afghanistan  1952  28.801  779.4453
## 2 Afghanistan  1972  36.088  739.9811
## 3 Afghanistan  1992  41.674  649.3414
## 4     Albania  1952  55.230 1601.0561
```

---.smallcode

## Making data tidy - spread()

### Use the `spread()` function:


```
## # A tibble: 4 x 4
##       country  year variable_name variable_value
##        <fctr> <int>         <chr>          <dbl>
## 1 Afghanistan  1952       lifeExp         28.801
## 2 Afghanistan  1972       lifeExp         36.088
## 3 Afghanistan  1992       lifeExp         41.674
## 4     Albania  1952       lifeExp         55.230
```


```r
spread(gapminder_1, key = variable_name, value = variable_value)
```


---.smallcode

## Making data tidy - spread()

### Write the correct `spread()` function:


```
## # A tibble: 4 x 4
##       country  year variable_name variable_value
##        <fctr> <int>         <chr>          <dbl>
## 1 Afghanistan  1952       lifeExp         28.801
## 2 Afghanistan  1972       lifeExp         36.088
## 3 Afghanistan  1992       lifeExp         41.674
## 4     Albania  1952       lifeExp         55.230
```


```r
spread(gapminder_1, key = variable_name, value = variable_value)
```

```
## # A tibble: 426 x 4
##        country  year gdpPercap lifeExp
##  *      <fctr> <int>     <dbl>   <dbl>
##  1 Afghanistan  1952  779.4453  28.801
##  2 Afghanistan  1972  739.9811  36.088
##  3 Afghanistan  1992  649.3414  41.674
##  4     Albania  1952 1601.0561  55.230
##  5     Albania  1972 3313.4222  67.690
##  6     Albania  1992 2497.4379  71.581
##  7     Algeria  1952 2449.0082  43.077
##  8     Algeria  1972 4182.6638  54.518
##  9     Algeria  1992 5023.2166  67.744
## 10      Angola  1952 3520.6103  30.015
## # ... with 416 more rows
```


---.smallcode

## Making data tidy 

### How do we get from :


```
## # A tibble: 4 x 7
##       country gdpPercap_1952 gdpPercap_1972 gdpPercap_1992 lifeExp_1952
##        <fctr>          <dbl>          <dbl>          <dbl>        <dbl>
## 1 Afghanistan       779.4453       739.9811       649.3414       28.801
## 2     Albania      1601.0561      3313.4222      2497.4379       55.230
## 3     Algeria      2449.0082      4182.6638      5023.2166       43.077
## 4      Angola      3520.6103      5473.2880      2627.8457       30.015
## # ... with 2 more variables: lifeExp_1972 <dbl>, lifeExp_1992 <dbl>
```
 to
 

```
## # A tibble: 4 x 4
##       country  year lifeExp gdpPercap
##        <fctr> <int>   <dbl>     <dbl>
## 1 Afghanistan  1952  28.801  779.4453
## 2 Afghanistan  1972  36.088  739.9811
## 3 Afghanistan  1992  41.674  649.3414
## 4     Albania  1952  55.230 1601.0561
```

---.smallcode

## Making data tidy - gather()

### Step 1: `gather()`


```
## # A tibble: 3 x 7
##       country gdpPercap_1952 gdpPercap_1972 gdpPercap_1992 lifeExp_1952
##        <fctr>          <dbl>          <dbl>          <dbl>        <dbl>
## 1 Afghanistan       779.4453       739.9811       649.3414       28.801
## 2     Albania      1601.0561      3313.4222      2497.4379       55.230
## 3     Algeria      2449.0082      4182.6638      5023.2166       43.077
## # ... with 2 more variables: lifeExp_1972 <dbl>, lifeExp_1992 <dbl>
```
 to
 

```
## # A tibble: 4 x 3
##       country  variable_type variable_value
##        <fctr>          <chr>          <dbl>
## 1 Afghanistan gdpPercap_1952       779.4453
## 2     Albania gdpPercap_1952      1601.0561
## 3     Algeria gdpPercap_1952      2449.0082
## 4      Angola gdpPercap_1952      3520.6103
```

---.smallcode

## Making data tidy - separate()

### Step 2: `separate()`


```
## # A tibble: 3 x 7
##       country gdpPercap_1952 gdpPercap_1972 gdpPercap_1992 lifeExp_1952
##        <fctr>          <dbl>          <dbl>          <dbl>        <dbl>
## 1 Afghanistan       779.4453       739.9811       649.3414       28.801
## 2     Albania      1601.0561      3313.4222      2497.4379       55.230
## 3     Algeria      2449.0082      4182.6638      5023.2166       43.077
## # ... with 2 more variables: lifeExp_1972 <dbl>, lifeExp_1992 <dbl>
```
 to
 

```
## # A tibble: 6 x 4
##       country  var_type  year variable_value
##        <fctr>     <chr> <chr>          <dbl>
## 1 Afghanistan gdpPercap  1952       779.4453
## 2     Albania gdpPercap  1952      1601.0561
## 3     Algeria gdpPercap  1952      2449.0082
## 4      Angola gdpPercap  1952      3520.6103
## 5   Argentina gdpPercap  1952      5911.3151
## 6   Australia gdpPercap  1952     10039.5956
```

---.smallcode

## Making data tidy - gather()  again

### Step 3: `gather()`


```
## # A tibble: 6 x 4
##       country  var_type  year variable_value
##        <fctr>     <chr> <chr>          <dbl>
## 1 Afghanistan gdpPercap  1952       779.4453
## 2     Albania gdpPercap  1952      1601.0561
## 3     Algeria gdpPercap  1952      2449.0082
## 4      Angola gdpPercap  1952      3520.6103
## 5   Argentina gdpPercap  1952      5911.3151
## 6   Australia gdpPercap  1952     10039.5956
```
 to
 

```
## # A tibble: 6 x 4
##       country  year gdpPercap lifeExp
##        <fctr> <chr>     <dbl>   <dbl>
## 1 Afghanistan  1952  779.4453  28.801
## 2 Afghanistan  1972  739.9811  36.088
## 3 Afghanistan  1992  649.3414  41.674
## 4     Albania  1952 1601.0561  55.230
## 5     Albania  1972 3313.4222  67.690
## 6     Albania  1992 2497.4379  71.581
```

---.smallcode

## Making data tidy - gather()

### `gather(data = , key = session, value = RT )`


<img class=center
  src=assets/img/session_2_gather.png width = 800px>

---.smallcode

## Making data tidy - gather()

### `gather(data = , key = , value = )`



```
## # A tibble: 1 x 5
##   subject hitrate.session1 hitrate.session2 RT.session1 RT.session2
## *   <chr>            <dbl>            <dbl>       <dbl>       <dbl>
## 1    S001             0.74             0.85        1.45        1.23
```

---.smallcode

## Making data tidy - gather()

### `gather(data = , key = , value = )`


```
## # A tibble: 1 x 5
##   subject hitrate.session1 hitrate.session2 RT.session1 RT.session2
## *   <chr>            <dbl>            <dbl>       <dbl>       <dbl>
## 1    S001             0.74             0.85        1.45        1.23
```

```r
my_data_2 <- gather(data = my_data, key = variable, value = result, 
                    hitrate.session1, hitrate.session2, 
                    RT.session1, RT.session2)
```


---.smallcode

## Making data tidy - gather()

### `gather(data = , key = , value = )`


```
## # A tibble: 1 x 5
##   subject hitrate.session1 hitrate.session2 RT.session1 RT.session2
## *   <chr>            <dbl>            <dbl>       <dbl>       <dbl>
## 1    S001             0.74             0.85        1.45        1.23
```

```r
( my_data_2 <- gather(data = my_data, key = variable, value = result, hitrate.session1, 
                      hitrate.session2, RT.session1, RT.session2) )
```

```
## # A tibble: 4 x 3
##   subject         variable result
##     <chr>            <chr>  <dbl>
## 1    S001 hitrate.session1   0.74
## 2    S001 hitrate.session2   0.85
## 3    S001      RT.session1   1.45
## 4    S001      RT.session2   1.23
```

---.smallcode

## Making data tidy - gather()

### `gather(data = , key = , value = )`


```
## # A tibble: 1 x 5
##   subject hitrate.session1 hitrate.session2 RT.session1 RT.session2
## *   <chr>            <dbl>            <dbl>       <dbl>       <dbl>
## 1    S001             0.74             0.85        1.45        1.23
```

```r
( my_data_2 <- gather(data = my_data, key = variable, value = result, hitrate.session1:RT.session2) )
```

```
## # A tibble: 4 x 3
##   subject         variable result
##     <chr>            <chr>  <dbl>
## 1    S001 hitrate.session1   0.74
## 2    S001 hitrate.session2   0.85
## 3    S001      RT.session1   1.45
## 4    S001      RT.session2   1.23
```


---.smallcode

## Making data tidy - gather()

### `gather(data = , key = , value = )`


```
## # A tibble: 1 x 5
##   subject hitrate.session1 hitrate.session2 RT.session1 RT.session2
## *   <chr>            <dbl>            <dbl>       <dbl>       <dbl>
## 1    S001             0.74             0.85        1.45        1.23
```

```r
( my_data_2 <- gather(data = my_data, key = variable, value = result,  -subject) )
```

```
## # A tibble: 4 x 3
##   subject         variable result
##     <chr>            <chr>  <dbl>
## 1    S001 hitrate.session1   0.74
## 2    S001 hitrate.session2   0.85
## 3    S001      RT.session1   1.45
## 4    S001      RT.session2   1.23
```


---.smallcode

## Making data tidy - gather()

### `gather(data = , key = , value = )`


```
## # A tibble: 1 x 5
##   subject hitrate.session1 hitrate.session2 RT.session1 RT.session2
## *   <chr>            <dbl>            <dbl>       <dbl>       <dbl>
## 1    S001             0.74             0.85        1.45        1.23
```

```r
gather(data = my_data, key = variable, value = result) 
```

```
## # A tibble: 5 x 2
##           variable result
##              <chr>  <chr>
## 1          subject   S001
## 2 hitrate.session1   0.74
## 3 hitrate.session2   0.85
## 4      RT.session1   1.45
## 5      RT.session2   1.23
```



---.smallcode

## Making data tidy - separate()

### `separate(data = , col = , into = , sep = , ...)`


```
## # A tibble: 4 x 3
##   subject         variable result
##     <chr>            <chr>  <dbl>
## 1    S001 hitrate.session1   0.74
## 2    S001 hitrate.session2   0.85
## 3    S001      RT.session1   1.45
## 4    S001      RT.session2   1.23
```

```r
( my_data_3 <- separate(data = my_data_2 , col = variable, into =  c("RT","session")) )
```

```
## # A tibble: 4 x 4
##   subject      RT  session result
## *   <chr>   <chr>    <chr>  <dbl>
## 1    S001 hitrate session1   0.74
## 2    S001 hitrate session2   0.85
## 3    S001      RT session1   1.45
## 4    S001      RT session2   1.23
```

---.smallcode

## Making data tidy - spread again()

### `spread(data = , key = , value = )`


```
## # A tibble: 4 x 4
##   subject      RT  session result
## *   <chr>   <chr>    <chr>  <dbl>
## 1    S001 hitrate session1   0.74
## 2    S001 hitrate session2   0.85
## 3    S001      RT session1   1.45
## 4    S001      RT session2   1.23
```

---.smallcode

## Making data tidy - spread again()

### `spread(data = , key = , value = )`


```
## # A tibble: 4 x 4
##   subject      RT  session result
## *   <chr>   <chr>    <chr>  <dbl>
## 1    S001 hitrate session1   0.74
## 2    S001 hitrate session2   0.85
## 3    S001      RT session1   1.45
## 4    S001      RT session2   1.23
```

```r
( my_data_final <- spread(my_data_3, key=RT, value = result) )
```

```
## # A tibble: 2 x 4
##   subject  session hitrate    RT
## *   <chr>    <chr>   <dbl> <dbl>
## 1    S001 session1    0.74  1.45
## 2    S001 session2    0.85  1.23
```


---.smallcode

## Making data tidy - piping `%>%`

### Full tidying code : 


```r
my_data_2 <- gather(data = my_data, key = variable_type, value = result, -subject)
my_data_3 <- separate(data = my_data_2, col = variable_type, into = c('var_type', "session"))
my_data_final <- spread(data = my_data_3, key = var_type, value = result)
```


---.smallcode

## Making data tidy - piping `%>%`

### Full tidying code : 


```r
my_data_2 <- gather(data = my_data, key = variable_type, value = result, -subject)
my_data_3 <- separate(data = my_data_2, col = variable_type, into = c('var_type', "session"))
my_data_final <- spread(data = my_data_3, key = var_type, value = result)
```

### Piped tidying code : 


```r
my_data %>% 
  gather(key = variable_type, value = result, -subject) %>%
  separate(col = variable_type, into = c('var_type', "session")) %>%
  spread(key = var_type, value = result)
```

```
## # A tibble: 2 x 4
##   subject  session hitrate    RT
## *   <chr>    <chr>   <dbl> <dbl>
## 1    S001 session1    0.74  1.45
## 2    S001 session2    0.85  1.23
```


---.smallcode

## Making data tidy - piping `%>%`

### Full tidying code : 


```r
my_data_2 <- gather(data = my_data, key = variable_type, value = result, -subject)
my_data_3 <- separate(data = my_data_2, col = variable_type, into = c('var_type', "session"))
my_data_final <- spread(data = my_data_3, key = var_type, value = result)
```

### Piped tidying code : 


```r
my_data %>% 
  gather(key = variable_type, value = result, -subject) %>%
  separate(col = variable_type, into = c('var_type', "session")) %>%
  spread(key = var_type, value = result) -> my_data_final
```

---.smallcode

## Making data tidy - your turn !!

```
## # A tibble: 4 x 7
##       country gdpPercap_1952 gdpPercap_1972 gdpPercap_1992 lifeExp_1952
##        <fctr>          <dbl>          <dbl>          <dbl>        <dbl>
## 1 Afghanistan       779.4453       739.9811       649.3414       28.801
## 2     Albania      1601.0561      3313.4222      2497.4379       55.230
## 3     Algeria      2449.0082      4182.6638      5023.2166       43.077
## 4      Angola      3520.6103      5473.2880      2627.8457       30.015
## # ... with 2 more variables: lifeExp_1972 <dbl>, lifeExp_1992 <dbl>
```
 to
 

```
## # A tibble: 4 x 4
##       country  year lifeExp gdpPercap
##        <fctr> <int>   <dbl>     <dbl>
## 1 Afghanistan  1952  28.801  779.4453
## 2 Afghanistan  1972  36.088  739.9811
## 3 Afghanistan  1992  41.674  649.3414
## 4     Albania  1952  55.230 1601.0561
```

---.smallcode

## Making data tidy - a solution

```
## # A tibble: 2 x 7
##       country gdpPercap_1952 gdpPercap_1972 gdpPercap_1992 lifeExp_1952
##        <fctr>          <dbl>          <dbl>          <dbl>        <dbl>
## 1 Afghanistan       779.4453       739.9811       649.3414       28.801
## 2     Albania      1601.0561      3313.4222      2497.4379       55.230
## # ... with 2 more variables: lifeExp_1972 <dbl>, lifeExp_1992 <dbl>
```
 to
 

```r
gapminder_2 %>%
  gather(key= variable_type, value=variable_value, -country) %>%
  separate(col=variable_type, into=c("var_type", "year")) %>%
  spread(key=var_type, value=variable_value)
```

```
## # A tibble: 426 x 4
##        country  year gdpPercap lifeExp
##  *      <fctr> <chr>     <dbl>   <dbl>
##  1 Afghanistan  1952  779.4453  28.801
##  2 Afghanistan  1972  739.9811  36.088
##  3 Afghanistan  1992  649.3414  41.674
##  4     Albania  1952 1601.0561  55.230
##  5     Albania  1972 3313.4222  67.690
##  6     Albania  1992 2497.4379  71.581
##  7     Algeria  1952 2449.0082  43.077
##  8     Algeria  1972 4182.6638  54.518
##  9     Algeria  1992 5023.2166  67.744
## 10      Angola  1952 3520.6103  30.015
## # ... with 416 more rows
```

--- .smallcode &twocol_l

## Making data tidy - joining datasets

*** =left


```
## # A tibble: 5 x 4
##       country `1952` `1972` `1992`
##        <fctr>  <dbl>  <dbl>  <dbl>
## 1 Afghanistan 28.801 36.088 41.674
## 2     Albania 55.230 67.690 71.581
## 3     Algeria 43.077 54.518 67.744
## 4      Angola 30.015 37.928 40.647
## 5   Argentina 62.485 67.065 71.868
```

*** =right


```
## # A tibble: 5 x 4
##       country    `1952`    `1972`    `1992`
##        <fctr>     <dbl>     <dbl>     <dbl>
## 1 Afghanistan  779.4453  739.9811  649.3414
## 2     Albania 1601.0561 3313.4222 2497.4379
## 3     Algeria 2449.0082 4182.6638 5023.2166
## 4      Angola 3520.6103 5473.2880 2627.8457
## 5   Argentina 5911.3151 9443.0385 9308.4187
```

--- .smallcode &twocol_l

## Making data tidy - joining datasets

<img class=center
  src=assets/img/session_2_join-setup.png width=150>
  
*** =left




```
## # A tibble: 3 x 2
##   subject    RT
##     <chr> <dbl>
## 1    S001  1.45
## 2    S002  1.23
## 3    S003  1.74
```

*** =right




```
## # A tibble: 3 x 2
##   subject hitrate
##     <chr>   <dbl>
## 1    S001    0.65
## 2    S002    0.73
## 3    S004    0.71
```

*** =fullwidth

Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)


--- .smallcode &twocol_l

## Making data tidy - inner_join()

<img class=center
  src=assets/img/session_2_join-inner.png width=300px>
  
*** =left


```
## # A tibble: 3 x 2
##   subject    RT
##     <chr> <dbl>
## 1    S001  1.45
## 2    S002  1.23
## 3    S003  1.74
```




```
## # A tibble: 3 x 2
##   subject hitrate
##     <chr>   <dbl>
## 1    S001    0.65
## 2    S002    0.73
## 3    S004    0.71
```

---.smallcode &twocol_l

## Making data tidy - inner_join()

<img class=center
  src=assets/img/session_2_join-inner.png width=300px>
  

---.smallcode &twocol_l

## Making data tidy - inner_join()

<img class=center
  src=assets/img/session_2_join-inner.png width=300px>
  
*** =left


```
## # A tibble: 3 x 2
##   subject    RT
##     <chr> <dbl>
## 1    S001  1.45
## 2    S002  1.23
## 3    S003  1.74
```




```
## # A tibble: 3 x 2
##   subject hitrate
##     <chr>   <dbl>
## 1    S001    0.65
## 2    S002    0.73
## 3    S004    0.71
```

*** =right


```r
inner_join(data_1, data_2, by="subject")
```

```
## # A tibble: 2 x 3
##   subject    RT hitrate
##     <chr> <dbl>   <dbl>
## 1    S001  1.45    0.65
## 2    S002  1.23    0.73
```


*** =fullwidth

Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)


---.smallcode &twocol_l

## Making data tidy - left_join()

<img class=center
  src=assets/img/session_2_join_left_outer.png width=300px>


---.smallcode &twocol_l

## Making data tidy - left_join()

<img class=center
  src=assets/img/session_2_join_left_outer.png width=300px>

*** =left


```
## # A tibble: 3 x 2
##   subject    RT
##     <chr> <dbl>
## 1    S001  1.45
## 2    S002  1.23
## 3    S003  1.74
```



```
## # A tibble: 3 x 2
##   subject hitrate
##     <chr>   <dbl>
## 1    S001    0.65
## 2    S002    0.73
## 3    S004    0.71
```

*** =right


```r
left_join(data_1, data_2, by="subject")
```

```
## # A tibble: 3 x 3
##   subject    RT hitrate
##     <chr> <dbl>   <dbl>
## 1    S001  1.45    0.65
## 2    S002  1.23    0.73
## 3    S003  1.74      NA
```


*** =fullwidth

Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)


---.smallcode &twocol_l

## Making data tidy - right_join()

<img class=center
  src=assets/img/session_2_join_right_outer.png width=300px>


---.smallcode &twocol_l

## Making data tidy - right_join()

<img class=center
  src=assets/img/session_2_join_right_outer.png width=300px>

*** =left


```
## # A tibble: 3 x 2
##   subject    RT
##     <chr> <dbl>
## 1    S001  1.45
## 2    S002  1.23
## 3    S003  1.74
```



```
## # A tibble: 3 x 2
##   subject hitrate
##     <chr>   <dbl>
## 1    S001    0.65
## 2    S002    0.73
## 3    S004    0.71
```

*** =right


```r
right_join(data_1, data_2, by="subject")
```

```
## # A tibble: 3 x 3
##   subject    RT hitrate
##     <chr> <dbl>   <dbl>
## 1    S001  1.45    0.65
## 2    S002  1.23    0.73
## 3    S004    NA    0.71
```


*** =fullwidth

Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)



---.smallcode &twocol_l

## Making data tidy - full_join()

<img class=center
  src=assets/img/session_2_join_full_outer.png width=300px>


---.smallcode &twocol_l

## Making data tidy - full_join()

<img class=center
  src=assets/img/session_2_join_full_outer.png width=300px>

*** =left


```
## # A tibble: 3 x 2
##   subject    RT
##     <chr> <dbl>
## 1    S001  1.45
## 2    S002  1.23
## 3    S003  1.74
```



```
## # A tibble: 3 x 2
##   subject hitrate
##     <chr>   <dbl>
## 1    S001    0.65
## 2    S002    0.73
## 3    S004    0.71
```

*** =right


```r
full_join(data_1, data_2, by="subject")
```

```
## # A tibble: 4 x 3
##   subject    RT hitrate
##     <chr> <dbl>   <dbl>
## 1    S001  1.45    0.65
## 2    S002  1.23    0.73
## 3    S003  1.74      NA
## 4    S004    NA    0.71
```


*** =fullwidth

Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)


---.smallcode &twocol_l

## Making data tidy - Challenge 
### Join our two datasets into one !

*** =left

```
## # A tibble: 142 x 4
##        country `1952` `1972` `1992`
##  *      <fctr>  <dbl>  <dbl>  <dbl>
##  1 Afghanistan 28.801 36.088 41.674
##  2     Albania 55.230 67.690 71.581
##  3     Algeria 43.077 54.518 67.744
##  4      Angola 30.015 37.928 40.647
##  5   Argentina 62.485 67.065 71.868
##  6   Australia 69.120 71.930 77.560
##  7     Austria 66.800 70.630 76.040
##  8     Bahrain 50.939 63.300 72.601
##  9  Bangladesh 37.484 45.252 56.018
## 10     Belgium 68.000 71.440 76.460
## # ... with 132 more rows
```

*** =right

```
## # A tibble: 142 x 4
##        country     `1952`     `1972`     `1992`
##  *      <fctr>      <dbl>      <dbl>      <dbl>
##  1 Afghanistan   779.4453   739.9811   649.3414
##  2     Albania  1601.0561  3313.4222  2497.4379
##  3     Algeria  2449.0082  4182.6638  5023.2166
##  4      Angola  3520.6103  5473.2880  2627.8457
##  5   Argentina  5911.3151  9443.0385  9308.4187
##  6   Australia 10039.5956 16788.6295 23424.7668
##  7     Austria  6137.0765 16661.6256 27042.0187
##  8     Bahrain  9867.0848 18268.6584 19035.5792
##  9  Bangladesh   684.2442   630.2336   837.8102
## 10     Belgium  8343.1051 16672.1436 25575.5707
## # ... with 132 more rows
```


---.smallcode &twocol_l

## Making data tidy - Challenge 
### Join our two datasets into one !

*** =left

```r
gapminder_4_1 %>% 
  gather(key=year, value=lifeExp,-country) -> 
  gapminder_4_1_temp 
```


```
## # A tibble: 426 x 3
##        country  year lifeExp
##         <fctr> <chr>   <dbl>
##  1 Afghanistan  1952  28.801
##  2     Albania  1952  55.230
##  3     Algeria  1952  43.077
##  4      Angola  1952  30.015
##  5   Argentina  1952  62.485
##  6   Australia  1952  69.120
##  7     Austria  1952  66.800
##  8     Bahrain  1952  50.939
##  9  Bangladesh  1952  37.484
## 10     Belgium  1952  68.000
## # ... with 416 more rows
```

*** =right


```r
gapminder_4_2 %>% 
  gather(key=year, value=lifeExp,-country) -> 
  gapminder_4_2_temp
```



```
## # A tibble: 426 x 3
##        country  year    lifeExp
##         <fctr> <chr>      <dbl>
##  1 Afghanistan  1952   779.4453
##  2     Albania  1952  1601.0561
##  3     Algeria  1952  2449.0082
##  4      Angola  1952  3520.6103
##  5   Argentina  1952  5911.3151
##  6   Australia  1952 10039.5956
##  7     Austria  1952  6137.0765
##  8     Bahrain  1952  9867.0848
##  9  Bangladesh  1952   684.2442
## 10     Belgium  1952  8343.1051
## # ... with 416 more rows
```


---.smallcode &twocol_l

## Making data tidy - Challenge 
### Join our two datasets into one !


```r
inner_join(gapminder_4_1_temp, gapminder_4_2_temp, by=c("country", "year")) 
```

```
## # A tibble: 6 x 4
##       country  year lifeExp.x  lifeExp.y
##        <fctr> <chr>     <dbl>      <dbl>
## 1 Afghanistan  1952    28.801   779.4453
## 2     Albania  1952    55.230  1601.0561
## 3     Algeria  1952    43.077  2449.0082
## 4      Angola  1952    30.015  3520.6103
## 5   Argentina  1952    62.485  5911.3151
## 6   Australia  1952    69.120 10039.5956
```

*** =left


```
## # A tibble: 426 x 3
##        country  year lifeExp
##         <fctr> <chr>   <dbl>
##  1 Afghanistan  1952  28.801
##  2     Albania  1952  55.230
##  3     Algeria  1952  43.077
##  4      Angola  1952  30.015
##  5   Argentina  1952  62.485
##  6   Australia  1952  69.120
##  7     Austria  1952  66.800
##  8     Bahrain  1952  50.939
##  9  Bangladesh  1952  37.484
## 10     Belgium  1952  68.000
## # ... with 416 more rows
```

*** =right


```
## # A tibble: 426 x 3
##        country  year    lifeExp
##         <fctr> <chr>      <dbl>
##  1 Afghanistan  1952   779.4453
##  2     Albania  1952  1601.0561
##  3     Algeria  1952  2449.0082
##  4      Angola  1952  3520.6103
##  5   Argentina  1952  5911.3151
##  6   Australia  1952 10039.5956
##  7     Austria  1952  6137.0765
##  8     Bahrain  1952  9867.0848
##  9  Bangladesh  1952   684.2442
## 10     Belgium  1952  8343.1051
## # ... with 416 more rows
```

---

## Tidy data

### Be able to identify if a dataset is tidy

### Be able to use tidyverse functions to tidy a dataset

  * `gather()`
  * `spread()`
  * `separate()`
  * `inner_join()` and friends

---

## Using tidy data with ggplot

### Be able to use *geoms*
### Be able to use *aesthetics*
### Be able to use facetting
### Be able to modify a plot to improve visualization


---

## Using ggplot - a cheatsheet 


<img class=center
  src=assets/img/session_2_ggplot.png width=700px>


---.smallcode &twocol_l

## Geoms we have seen already

*** =left
### `geom_boxplot()`


```r
ggplot(data=iris, aes(x=Species, y=Petal.Length)) +
  geom_boxplot() +
  theme_light()
```

<img src="assets/fig/unnamed-chunk-154-1.png" title="plot of chunk unnamed-chunk-154" alt="plot of chunk unnamed-chunk-154" width="400px" style="display: block; margin: auto;" />

*** =right
### `geom_point()`

```r
ggplot(iris, aes(x=Petal.Length, y=Sepal.Width)) + 
  geom_point() +
  theme_gray()
```

<img src="assets/fig/unnamed-chunk-155-1.png" title="plot of chunk unnamed-chunk-155" alt="plot of chunk unnamed-chunk-155" width="400px" style="display: block; margin: auto;" />

------.smallcode

## ggplot challenges: make this plot !!

<img src="assets/fig/unnamed-chunk-156-1.png" title="plot of chunk unnamed-chunk-156" alt="plot of chunk unnamed-chunk-156" width="500px" style="display: block; margin: auto;" />

------.smallcode

## ggplot challenges: make this plot !!


```r
ggplot(gapminder, aes(x=year, lifeExp)) + 
  geom_point()
```

<img src="assets/fig/unnamed-chunk-157-1.png" title="plot of chunk unnamed-chunk-157" alt="plot of chunk unnamed-chunk-157" width="500px" style="display: block; margin: auto;" />

------.smallcode

## ggplot challenge: add color !!

<img src="assets/fig/unnamed-chunk-158-1.png" title="plot of chunk unnamed-chunk-158" alt="plot of chunk unnamed-chunk-158" width="600px" style="display: block; margin: auto;" />

------.smallcode

## ggplot challenge: add color !!


```r
ggplot(gapminder, aes(x=year, lifeExp, color=continent)) + 
  geom_point()
```

<img src="assets/fig/unnamed-chunk-159-1.png" title="plot of chunk unnamed-chunk-159" alt="plot of chunk unnamed-chunk-159" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot: Jitter to reduce overplotting

<img src="assets/fig/unnamed-chunk-160-1.png" title="plot of chunk unnamed-chunk-160" alt="plot of chunk unnamed-chunk-160" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot: Jitter to reduce overplotting


```r
ggplot(gapminder, aes(x=year, lifeExp, color=continent)) + 
  geom_jitter()
```

<img src="assets/fig/unnamed-chunk-161-1.png" title="plot of chunk unnamed-chunk-161" alt="plot of chunk unnamed-chunk-161" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot: Jitter to reduce overplotting

<img src="assets/fig/unnamed-chunk-162-1.png" title="plot of chunk unnamed-chunk-162" alt="plot of chunk unnamed-chunk-162" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot: Jitter to reduce overplotting


```r
ggplot(gapminder, aes(x=year, lifeExp, color=continent)) + 
  geom_jitter(width = 0.7)
```

<img src="assets/fig/unnamed-chunk-163-1.png" title="plot of chunk unnamed-chunk-163" alt="plot of chunk unnamed-chunk-163" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot: Modify the shape to improve visibility

<img src="assets/fig/unnamed-chunk-164-1.png" title="plot of chunk unnamed-chunk-164" alt="plot of chunk unnamed-chunk-164" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot: Modify the shape to improve visibility


```r
ggplot(gapminder, aes(x=year, lifeExp, color=continent)) + 
  geom_jitter(width = 1, shape = 1) + 
  theme_bw()
```

<img src="assets/fig/unnamed-chunk-165-1.png" title="plot of chunk unnamed-chunk-165" alt="plot of chunk unnamed-chunk-165" width="600px" style="display: block; margin: auto;" />


---.smallcode

## ggplot: Plot year as a factor

<img src="assets/fig/unnamed-chunk-166-1.png" title="plot of chunk unnamed-chunk-166" alt="plot of chunk unnamed-chunk-166" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot: Plot year as a factor


```r
ggplot(gapminder, aes(as.factor(year), lifeExp, color=continent)) + 
  geom_jitter(width = 0.3, shape = 1) + 
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-167-1.png" title="plot of chunk unnamed-chunk-167" alt="plot of chunk unnamed-chunk-167" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : using `geom_line()` to connect points


```r
ggplot(gapminder, aes(year, lifeExp, color=continent)) + 
  geom_line() + 
  theme_classic()
```

---.smallcode

## ggplot : using `geom_line()` to connect points


```r
ggplot(gapminder, aes(year, lifeExp, color=continent)) + 
  geom_line() + 
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-169-1.png" title="plot of chunk unnamed-chunk-169" alt="plot of chunk unnamed-chunk-169" width="600px" style="display: block; margin: auto;" />


---.smallcode

## ggplot : using `geom_line()` to connect points


```r
ggplot(gapminder, aes(year, lifeExp, color=continent, group=country)) + 
  geom_line() + 
  theme_classic()
```

---.smallcode

## ggplot : using `geom_line()` to connect points


```r
ggplot(gapminder, aes(year, lifeExp, color=continent, group=country)) + 
  geom_line() + 
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-171-1.png" title="plot of chunk unnamed-chunk-171" alt="plot of chunk unnamed-chunk-171" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot: using facets - `facet_wrap()`


```r
ggplot(gapminder, aes(year, lifeExp,  group=country)) + 
  geom_line() + 
  facet_wrap(~continent) +
  theme_classic()
```

---.smallcode

## ggplot: using facets - `facet_wrap()`


```r
ggplot(gapminder, aes(year, lifeExp,  group=country)) + 
  geom_line() + 
  facet_wrap(~continent) +
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-173-1.png" title="plot of chunk unnamed-chunk-173" alt="plot of chunk unnamed-chunk-173" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : using facets - `facet_grid()`


```r
ggplot(gapminder, aes(year, lifeExp,  group=country)) + 
  geom_line() + 
  facet_grid(.~continent) +
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-174-1.png" title="plot of chunk unnamed-chunk-174" alt="plot of chunk unnamed-chunk-174" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : using facets - `facet_grid()`

<img src="assets/fig/unnamed-chunk-175-1.png" title="plot of chunk unnamed-chunk-175" alt="plot of chunk unnamed-chunk-175" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : using facets - `facet_grid()`


```r
ggplot(gapminder, aes(year, lifeExp,  group=country)) + 
  geom_line() + 
  facet_grid(continent~.) +
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-176-1.png" title="plot of chunk unnamed-chunk-176" alt="plot of chunk unnamed-chunk-176" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Adding a new *aesthetic*

<img src="assets/fig/unnamed-chunk-177-1.png" title="plot of chunk unnamed-chunk-177" alt="plot of chunk unnamed-chunk-177" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Adding a new *aesthetic*


```r
ggplot(gapminder, aes(year, lifeExp,  group=country, color=gdpPercap)) + 
  geom_line() + 
  facet_grid(continent~.) +
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-178-1.png" title="plot of chunk unnamed-chunk-178" alt="plot of chunk unnamed-chunk-178" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Transforming values to imrove visualization


```r
ggplot(gapminder, aes(year, lifeExp,  group=country, color=log(gdpPercap))) + 
  geom_line() + 
  facet_grid(continent~.) +
  scale_color_gradient( )  +
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-179-1.png" title="plot of chunk unnamed-chunk-179" alt="plot of chunk unnamed-chunk-179" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Transforming values to imrove visualization


```r
ggplot(gapminder, aes(year, lifeExp,  group=country, color=gdpPercap)) + 
  geom_line() + 
  facet_grid(continent~.) +
  scale_color_gradient( trans = 'log' )  +
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-180-1.png" title="plot of chunk unnamed-chunk-180" alt="plot of chunk unnamed-chunk-180" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Transforming values to imrove visualization


```r
ggplot(gapminder, aes(year, lifeExp,  group=country, color=gdpPercap)) + 
  geom_line(lwd = 1 ) + 
  facet_grid(continent~.) +
  scale_color_gradient( trans = 'log',guide="colourbar",breaks=c(1000,10000, 100000) )  +
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-181-1.png" title="plot of chunk unnamed-chunk-181" alt="plot of chunk unnamed-chunk-181" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Create the following plot

<img src="assets/fig/unnamed-chunk-182-1.png" title="plot of chunk unnamed-chunk-182" alt="plot of chunk unnamed-chunk-182" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Create the following plot


```r
ggplot(gapminder, aes(gdpPercap, lifeExp)) + 
  geom_point() + 
  facet_grid(year~continent) +
  theme_minimal()
```

<img src="assets/fig/unnamed-chunk-183-1.png" title="plot of chunk unnamed-chunk-183" alt="plot of chunk unnamed-chunk-183" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Improve plot quality


```r
ggplot(gapminder, aes(gdpPercap, lifeExp)) + 
  geom_point(shape = 1) + 
  facet_grid(year~continent, scales = "free_x") +
  theme_classic()
```

<img src="assets/fig/unnamed-chunk-185-1.png" title="plot of chunk unnamed-chunk-185" alt="plot of chunk unnamed-chunk-185" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Improve plot quality


```r
ggplot(gapminder, aes(gdpPercap, lifeExp)) + 
  geom_point(shape = 1) + 
  facet_grid(year~continent, scales = "free_x") +
  theme_minimal()
```

<img src="assets/fig/unnamed-chunk-186-1.png" title="plot of chunk unnamed-chunk-186" alt="plot of chunk unnamed-chunk-186" width="600px" style="display: block; margin: auto;" />


---.smallcode

## ggplot : Improve plot quality


```r
ggplot(gapminder, aes(gdpPercap, lifeExp)) + 
  geom_point(shape = 1) + 
  scale_x_log10() +
  facet_grid(year~continent, scales = "free_x") +
  theme_minimal()
```

<img src="assets/fig/unnamed-chunk-187-1.png" title="plot of chunk unnamed-chunk-187" alt="plot of chunk unnamed-chunk-187" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : Improve plot quality


```r
ggplot(gapminder, aes(gdpPercap, lifeExp)) + 
  geom_point(shape = 1) + 
  scale_x_log10() +
  facet_grid(year~continent) +
  theme_minimal()
```

<img src="assets/fig/unnamed-chunk-188-1.png" title="plot of chunk unnamed-chunk-188" alt="plot of chunk unnamed-chunk-188" width="600px" style="display: block; margin: auto;" />

---.smallcode

## ggplot : `filter()`, ggplot and piping


```r
gapminder %>%
  filter(continent != "Oceania") %>%
  ggplot(aes(gdpPercap, lifeExp)) + 
    geom_point(shape = 1) + 
    scale_x_log10() +
    facet_grid(year~continent) +
    theme_minimal()
```

<img src="assets/fig/unnamed-chunk-189-1.png" title="plot of chunk unnamed-chunk-189" alt="plot of chunk unnamed-chunk-189" width="600px" style="display: block; margin: auto;" />

---

## ggplot challenge: produce this plot

<img src="assets/fig/unnamed-chunk-190-1.png" title="plot of chunk unnamed-chunk-190" alt="plot of chunk unnamed-chunk-190" width="800px" style="display: block; margin: auto;" />

---

## ggplot challenge: produce this plot 

<img src="assets/fig/unnamed-chunk-191-1.png" title="plot of chunk unnamed-chunk-191" alt="plot of chunk unnamed-chunk-191" width="800px" style="display: block; margin: auto;" />

---

## ggplot challenge: produce this plot (for 2007)

<img src="assets/fig/unnamed-chunk-192-1.png" title="plot of chunk unnamed-chunk-192" alt="plot of chunk unnamed-chunk-192" width="800px" style="display: block; margin: auto;" />

---

## Using tidy data with ggplot

### Be able to use *geoms*
* `geom_jitter()`
* `geom_line()`

### Be able to use *aesthetics* to convey meaning
* color, size as a third dimension
### Be able to use facetting
* `facet_grid()`
* `facet_wrap()`

### Be able to modify a plot to improve visualization
* transform axes or color scales
* free or bind axes in facetted plots

