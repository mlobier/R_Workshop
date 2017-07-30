---
title       : Introduction to R Workshop 
subtitle    : Session 1
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
  margin-bottom: -10px;
}
</style>

## Introduction to R for data analysis and visualization

### Workshop agenda

* Scientific data analysis should: 
  * be reproducible 
    * by me
    * by others (if given my code and data)
  * follow rigorous statistical standards
  * use open tools 
  
  
* R is a great way to achieve this


--- .class #id 

## Introduction to R for data analysis and visualization

### Overarching objective: 
* Be able to use R and R-studio to:
  * establish a reproducible and documented data-analysis pipeline

###  Specific Learning goals:
* How to structure a data analysis project
* How to import, clean up and transform data
* How to visualize data and make publication ready figures
* How to run simple inferential statistical analyses
* How to run less-simple inferential statistical analyses

--- .class #id 

## Introduction to R for data analysis and visualization

### Insctructor's philosophy and priors:

* Learning the most efficient tools first is more ... efficient
* Learning to solve problems is more efficient than:
  * reading code written by someone else to solve a fake problem
  * listening to the instructor drone on and on and make bad jokes
* The tidyverse and ggplot are awesome

### What this workshop is not:
* A complete overview of all that R can do
* An R programming course
 

---

## Session 1 - Learning goals

* Using R-Studio
* Your first R Markdown file
* How to structure a data analysis project
* Data strucures in T
* What is Tidy data
* Transforming and restructuring data

---

## R-studio

So let's start by opening R-Studio !!


---

## R-studio

R can be used as a simple calculator.


```r
4+9
```

```
## [1] 13
```
 You can also make comparisons with R, it will output a boolean
 

```r
67 > 52
```

```
## [1] TRUE
```

```r
"Tree" == "tree"
```

```
## [1] FALSE
```


---

## R-studio and markdown documents

* Let's now create your first R Markdown documents.

* Markdown documents are great because you can:
  * Combine text and code in the same document: Reproducible Research 
  * Execute parts of the code (code chunks) sequentially for ease of coding
  * ouput a html (or pdf or even .doc) file as your documented analysis.

* Open the pre-templated RMarkdown (.Rmd) file at:
  * ./R_Workshop/my_first_RMarkdown_file.Rmd


---

## R-Markdown

The top part of the file is the YAML header


```r
---
title: "My first file"
output: html_document
---
```

* R code is inserted in chunks:
* Press the green arrow to execute  


```r
6*7
```

---

## R-Markdown

The top part of the file is the YAML header


```r
---
title: "My first file"
output: html_document
---
```

* R code is inserted in chunks:
* Press the green arrow to execute  


```r
6*7
```

```
## [1] 42
```

---

## R-Markdown

* R relies on packages or libraries for added functionality.
* You will need in every R session to load the libraries needed for your analysis.
* Press the green arrow to execute the code and load the *tidyverse* library.



```r
library(tidyverse)
```

---

## Inspect data

>* We will use a data set included in r as the dataframe `iris`. 
>* Dataframes are the main structure for data handling in R.
  * Columns are variables
  * Rows are observations
>* Let's take a look a the first rows of the dataset:
  * Type the command `head(iris)`  in the code chunk below. 
  * Press the green arrow to run the code



```r
head(iris)
```

---

## Inspect data


```r
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

---

## Inspect data

* Another way to get a "glimpse" of our dataset is to use the `glimpse()` command.
  * excute the code below
  * What additional information did you obtain ??
  


```r
glimpse(iris)
```

---

## Inspect data


```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
```



```r
glimpse(iris)
```

```
## Observations: 150
## Variables: 5
## $ Sepal.Length <dbl> 5.1, 4.9, 4.7, 4.6, 5.0, 5.4, 4.6, 5.0, 4.4, 4.9,...
## $ Sepal.Width  <dbl> 3.5, 3.0, 3.2, 3.1, 3.6, 3.9, 3.4, 3.4, 2.9, 3.1,...
## $ Petal.Length <dbl> 1.4, 1.4, 1.3, 1.5, 1.4, 1.7, 1.4, 1.5, 1.4, 1.5,...
## $ Petal.Width  <dbl> 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1,...
## $ Species      <fctr> setosa, setosa, setosa, setosa, setosa, setosa, ...
```

---

## Inspect data

* To learn more about our dataset, we can get a summary:
  * insert a code chunk by clicking on insert/R
  * type and execute the code `summary(iris)`


```r
summary(iris)
```

---

## Inspect data

* To learn more about our dataset, we can get a summary:
  * insert a code chunk by clicking on insert/R
  * type and execute the code `summary(iris)`


```r
summary(iris)
```

```
##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
##        Species  
##  setosa    :50  
##  versicolor:50  
##  virginica :50  
##                 
##                 
## 
```

---

## Plotting data

You can embed plots in your markdown documents.

* Here we create a plot using ggplot, which we will use throughout the course. 
* We first plot Sepal.Length as a function of each species. 
* We use `geom_point()` to plot a point for each observation. 



```r
ggplot(iris, aes(x=Species, y=Sepal.Length)) + 
  geom_point()
```

<img src="assets/fig/unnamed-chunk-16-1.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" width="800px" style="display: block; margin: auto;" />

---

## Plotting data

We can also plot directly a boxplot 
  * ggplot computes automatically the median and quartiles of the data.


```r
ggplot(iris, aes(x=Species, y=Sepal.Length)) + 
  geom_boxplot()
```

<img src="assets/fig/unnamed-chunk-17-1.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" width="340px" style="display: block; margin: auto;" />

---

## Plotting data

Modify the code below to plot Petal.Length instead of Sepal.Length


```r
ggplot(iris, aes(x=Species, y=Sepal.Length)) + 
  geom_boxplot()
```

---

## Plotting data

Modify the code below to plot Petal.Length instead of Sepal.Length


```r
ggplot(iris, aes(x=Species, y=Petal.Length)) + 
  geom_boxplot()
```

<img src="assets/fig/unnamed-chunk-19-1.png" title="plot of chunk unnamed-chunk-19" alt="plot of chunk unnamed-chunk-19" width="380px" style="display: block; margin: auto;" />

---

## Plotting

We can also do a scatterplot of Petal.Length as a function of  Sepal.Length using the  geom_point() command.
* Modify the code below to produce this plot.


```r
ggplot(iris, aes(x=, y=)) + 
  geom_boxplot()
```

---

## Plotting

We can also do a scatterplot of Petal.Length as a function of Sepal.Length using the  geom_point() command.
* Modify the code below to produce this plot.


```r
ggplot(iris, aes(x=Sepal.Length, y= Petal.Length)) + 
  geom_point()
```

<img src="assets/fig/unnamed-chunk-21-1.png" title="plot of chunk unnamed-chunk-21" alt="plot of chunk unnamed-chunk-21" width="400px" style="display: block; margin: auto;" />

---

## Plotting - adding colors

* The `aes()`  in the `ggplot()` command codes all which 'aesthetics' are assigned to which variable.
* Add a new aesthetics color=Species to the aes() command to add color to your plot


```r
ggplot(iris, aes(x=Petal.Length, y=Sepal.Length)) + 
  geom_point()
```


---

## Plotting - adding colors

* The `aes()`  in the `ggplot()` command codes all which 'aesthetics' are assigned to which variable.
* Add a new aesthetics color=Species to the aes() command to add color to your plot


```r
ggplot(iris, aes(x=Petal.Length, y=Sepal.Length, color=Species)) + 
  geom_point()
```

<img src="assets/fig/unnamed-chunk-23-1.png" title="plot of chunk unnamed-chunk-23" alt="plot of chunk unnamed-chunk-23" width="400px" style="display: block; margin: auto;" />

---

## Knitting your document into an html file

Now you can press Knit at the top of the script pane to knit and visualize the output html file !!

<iframe src='./assets/img/session_1_knit.png'>
</iframe> 

---

## Important points

>* Use RMarkdown documents to combine text, analysis code and figures
>* Dataframes can be inspected using:
  * `head()`
  * `glimpse()`
  * `summary()`
>* Plots can be made easily using the `ggplot` library

---

## Coming-up next - Data types and structures

>* The 5 main data types
>* Vectors
>* Lists

---

## Quick overview of data types 

> * There are 5 main data types in R
  * numeric doubles : 5.56
  * numeric integers:  2
  * strings/characters: "Hello World"
  * boolean: `TRUE` / `FALSE`
  * complex: 5 + 4.3i

> * Other types are:
  * NA
  * Inf

---

## Manipulating data types

* Evaluate the type of an object

```r
typeof(5.3)
```

```
## [1] "double"
```

---

## Manipulating data types


* Evaluate the type of an object

```r
typeof(5.3)
```

```
## [1] "double"
```
* Test the type of an object

```r
is.integer(5.3)
```

```
## [1] FALSE
```

---

## Manipulating data types


* Evaluate the type of an object

```r
typeof(5.3)
```

```
## [1] "double"
```
* Test the type of an object

```r
is.integer(5.3)
```

```
## [1] FALSE
```
* Convert the type of an object

```r
as.integer(5.3)
```

```
## [1] 5
```

---

## Vectors

* The simplest object type:


```r
print(6)
```

```
## [1] 6
```

* Concatenate objects into a vector using the `c()` operator:

```r
c(5, 7, 9, 63)
```

```
## [1]  5  7  9 63
```

* The `:` operator:

```r
c(1:10)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

---

## Vectors

What happens if different data types are assigned to a vector ?

```r
c(6L, "The dog", 56, FALSE)
```

---

## Vectors

What happens if different data types are assigned to a vector ?


```r
c(6L, "The dog", 56, FALSE)
```

```
## [1] "6"       "The dog" "56"      "FALSE"
```

All elements of the vector are *coerced* to the chararcter type **WITHOUT WARNING**.

---

## Vectors

Operations are vectorized


```r
c(10,20,30,40) + 1
```

```
## [1] 11 21 31 41
```

---

## Vectors

Operations are vectorized


```r
c(10,20,30,40) + 1
```

```
## [1] 11 21 31 41
```


```r
2^c(1:5)
```

```
## [1]  2  4  8 16 32
```

---

## Vector indexing

* Calling an element in done using the `[]` operator

---

## Vector indexing

* Calling an element in done using the `[]` operator
* For example, here is the `LETTER` vector


```r
LETTERS
```

```
##  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q"
## [18] "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
```

---

## Vector indexing

* Calling an element in done using the `[]` operator
* For example, here is the `LETTER` vector


```r
LETTERS
```

```
##  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q"
## [18] "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
```
* And here is the second element of the vector

```r
LETTERS[2]
```

```
## [1] "B"
```

---

## Vector indexing

Index the vector to ouput your name...


```r
LETTERS[]
```

**TIP**

Remember the difference between 


```r
2,5,7,10
```
and 

```r
c(2,5,7,10)
```

```
## [1]  2  5  7 10
```

---

## Vector indexing

Index the vector to ouput your name...


```r
LETTERS[c(13, 25, 13, 25)]
```

```
## [1] "M" "Y" "M" "Y"
```

---

## Vector indexing

The `:` operator indexes vectors


```r
LETTERS[1:5]
```

```
## [1] "A" "B" "C" "D" "E"
```

The function `length()` returns ... the length of your vector

```r
length(LETTERS)
```

```
## [1] 26
```

---

## Vector indexing: PRACTICE

How do I get this ouput:

```
## [1] "E" "F" "G" "H" "I" "J"
```
How do I get this ouput:

```
## [1] "E" "F" "G" "H" "I" "J" "Q"
```
How do I ouput the first 3 letters and the second to last one:

```
## [1] "A" "B" "C" "Y"
```
How do I ouput all letters except M and Y (*negative indexes ??*):

```
## [1] "A" "B" "C" "Y"
```

---

## Vector indexing: PRACTICE

How do I get this ouput:

```r
LETTERS[5:10]
```

```
## [1] "E" "F" "G" "H" "I" "J"
```
How do I get this ouput:

```r
LETTERS[c(5:10, 17)]
```

```
## [1] "E" "F" "G" "H" "I" "J" "Q"
```

---

## Vector indexing: PRACTICE
How do I ouput the first 3 letters and the second to last one:

```r
LETTERS[c(1:3, length(LETTERS)-1)]
```

```
## [1] "A" "B" "C" "Y"
```
How do I ouput all letters except M and Y (*negative indexes ??*):

```r
LETTERS[c(1:3, length(LETTERS)-1)]
```

```
## [1] "A" "B" "C" "Y"
```


---

## Vectors and Lists

![image](assets/img/session_1_vectors.png)

source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)


---

## Lists 

Lists can contain objects of different types

```r
my_list<-list(str_var="r", int_var=7L, dbl_var=56, bool_var=FALSE)
```

The `str()` command outputs the structure of the list

```r
str(my_list)
```

```
## List of 4
##  $ str_var : chr "r"
##  $ int_var : int 7
##  $ dbl_var : num 56
##  $ bool_var: logi FALSE
```

--- &twocol

## Subsetting Lists 

*** =left


```r
a <- list(a = 1:3, b = "a string", 
          c = pi, d = list(-1, -5))
str(a)
```

```
## List of 4
##  $ a: int [1:3] 1 2 3
##  $ b: chr "a string"
##  $ c: num 3.14
##  $ d:List of 2
##   ..$ : num -1
##   ..$ : num -5
```


*** =right

<img class=center
  src=assets/img/session_1_r_list2.png height=100px>


*** =fullwidth

<br>
  Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)

--- &twocol

## Subsetting Lists 

`[` extracts a sub-list. The ouput is a list.

*** =left


```r
str(a[1:2])
```

```
## List of 2
##  $ a: int [1:3] 1 2 3
##  $ b: chr "a string"
```

```r
str(a[4])
```

```
## List of 1
##  $ d:List of 2
##   ..$ : num -1
##   ..$ : num -5
```

*** =right

<img class=center
  src=assets/img/lists-subsetting.png width=400px>


*** =fullwidth

<br>
  Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)




--- &twocol

## Subsetting Lists 

`[[` extracts a single component from a list.

*** =left


```r
str(a[[1]])
```

```
##  int [1:3] 1 2 3
```

```r
str(a[[4]])
```

```
## List of 2
##  $ : num -1
##  $ : num -5
```

*** =right

<img class=center
  src=assets/img/lists-subsetting.png width=400px>


*** =fullwidth

<br>
  Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)

--- &twocol

## Subsetting Lists 

`[[` extracts a single component from a list.

*** =left


```r
str(a[[1]])
```

```
##  int [1:3] 1 2 3
```

```r
str(a[[2]])
```

```
##  chr "a string"
```

```r
str(a[[3]])
```

```
##  num 3.14
```
*** =right

<img class=center
  src=assets/img/lists-subsetting.png width=400px>


*** =fullwidth

<br>
  Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)


--- &twocol

## Subsetting Lists 

`[[` extracts a single component from a list.

*** =left


```r
str(a[[4]])
```

```
## List of 2
##  $ : num -1
##  $ : num -5
```

```r
str(a[[4]][1])
```

```
## List of 1
##  $ : num -1
```

*** =right

<img class=center
  src=assets/img/lists-subsetting.png width=400px>


*** =fullwidth

<br>
  Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)

--- &twocol

## Subsetting Lists 

`$` extracts a named components from a list.

*** =left


```r
str(a$a)
```

```
##  int [1:3] 1 2 3
```

```r
str(a$d)
```

```
## List of 2
##  $ : num -1
##  $ : num -5
```

*** =right

<img class=center
  src=assets/img/lists-subsetting.png width=400px>


*** =fullwidth

<br>
  Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)



--- &twocol

## Subsetting Lists 

`"name"` can also used.

*** =left


```r
str(a["a"])
```

```
## List of 1
##  $ a: int [1:3] 1 2 3
```

```r
str(a[["a"]])
```

```
##  int [1:3] 1 2 3
```

*** =right

<img class=center
  src=assets/img/lists-subsetting.png width=400px>


*** =fullwidth

<br>
  Source: **H. Wickham** - [*R* for data science](http://r4ds.had.co.nz/vectors.html) - [CC license](https://creativecommons.org/licenses/by-nc-nd/3.0/us/)



---  

## Subsetting Lists - Let's practice

* Outputs of statistical tests are often lists.
* Let's apply a t-test to the built-in sleep data set


```r
glimpse(sleep)
```

```
## Observations: 20
## Variables: 3
## $ extra <dbl> 0.7, -1.6, -0.2, -1.2, -0.1, 3.4, 3.7, 0.8, 0.0, 2.0, 1....
## $ group <fctr> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
## $ ID    <fctr> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, ...
```


---  

## Subsetting Lists - Let's practice

* Outputs of statistical tests are often lists.
* Let's apply a t-test to the built-in sleep data set


```r
glimpse(sleep)
```

```
## Observations: 20
## Variables: 3
## $ extra <dbl> 0.7, -1.6, -0.2, -1.2, -0.1, 3.4, 3.7, 0.8, 0.0, 2.0, 1....
## $ group <fctr> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
## $ ID    <fctr> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, ...
```
* Run a student's t-test to compare the mean `extra` between groups.
* Store the result in the test_result object

```r
test_result<-t.test(extra ~ group, sleep, var.equal=TRUE)
```

---  

## Subsetting Lists - Let's practice

* Use the str command to inspect the `test_result` object


---  

## Subsetting Lists - Let's practice

* Use the str command to inspect the `test_result` object

```r
str(test_result)
```

```
## List of 9
##  $ statistic  : Named num -1.86
##   ..- attr(*, "names")= chr "t"
##  $ parameter  : Named num 18
##   ..- attr(*, "names")= chr "df"
##  $ p.value    : num 0.0792
##  $ conf.int   : atomic [1:2] -3.364 0.204
##   ..- attr(*, "conf.level")= num 0.95
##  $ estimate   : Named num [1:2] 0.75 2.33
##   ..- attr(*, "names")= chr [1:2] "mean in group 1" "mean in group 2"
##  $ null.value : Named num 0
##   ..- attr(*, "names")= chr "difference in means"
##  $ alternative: chr "two.sided"
##  $ method     : chr " Two Sample t-test"
##  $ data.name  : chr "extra by group"
##  - attr(*, "class")= chr "htest"
```

---

## Subsetting Lists - Let's practice
* Which of these commands give the same output?

```r
test_result$p.value
test_result["p.value"]
test_result[3]
test_result[[3]]
```

* NO TYPING !! Use your head!!


```r
str(test_result)[1:4]
```

```
## List of 9
##  $ statistic  : Named num -1.86
##   ..- attr(*, "names")= chr "t"
##  $ parameter  : Named num 18
##   ..- attr(*, "names")= chr "df"
##  $ p.value    : num 0.0792
##  $ conf.int   : atomic [1:2] -3.364 0.204
##   ..- attr(*, "conf.level")= num 0.95
##  $ estimate   : Named num [1:2] 0.75 2.33
##   ..- attr(*, "names")= chr [1:2] "mean in group 1" "mean in group 2"
##  $ null.value : Named num 0
##   ..- attr(*, "names")= chr "difference in means"
##  $ alternative: chr "two.sided"
##  $ method     : chr " Two Sample t-test"
##  $ data.name  : chr "extra by group"
##  - attr(*, "class")= chr "htest"
```

```
## NULL
```

--- &twocol

## Subsetting Lists 


*** =left


```r
test_result$p.value
```

```
## [1] 0.07918671
```

*** =right


--- &twocol

## Subsetting Lists 

*** =left


```r
test_result$p.value
```

```
## [1] 0.07918671
```

*** =right

```r
test_result["p.value"]
```

```
## $p.value
## [1] 0.07918671
```

--- &twocol_l

## Subsetting Lists 

*** =left


```r
test_result$p.value
```

```
## [1] 0.07918671
```

*** =right

```r
test_result["p.value"]
```

```
## $p.value
## [1] 0.07918671
```

```r
test_result[3]
```

```
## $p.value
## [1] 0.07918671
```

--- &twocol

## Subsetting Lists 

*** =left


```r
test_result$p.value
```

```
## [1] 0.07918671
```

```r
test_result[[3]]
```

```
## [1] 0.07918671
```

*** =right

```r
test_result["p.value"]
```

```
## $p.value
## [1] 0.07918671
```

```r
test_result[3]
```

```
## $p.value
## [1] 0.07918671
```

---
## Subsetting Lists - Let's practice

* Find as many ways as you can to output 


```
##         t 
## -1.860813
```


```
## $statistic
##         t 
## -1.860813
```



```
## [1] -1.860813
```

--- &twocol

## Subsetting Lists 

*** =left


```r
test_result$statistic
```

```
##         t 
## -1.860813
```

```r
test_result[1]
```

```
## $statistic
##         t 
## -1.860813
```

*** =right

```r
test_result$statistic[[1]]
```

```
## [1] -1.860813
```

```r
test_result[1][[1]]
```

```
##         t 
## -1.860813
```


---

## Important Points

>* Five main data types in R
>* Vectors and vector indexing
>* Lists and list indexing

---

## Putting it all together !!

Let's make your first analysis file !

* Open the *my_first_analysis_file.Rmd* file in the R_Workshop_exercises folder.
* Follow instructions !!

---

## Putting it all together !!

 [Example knitted File](./data/Exercises/session_1)

---

## IMPORTANT POINTS

### Use R-Markdown files to create reproducible data analysis scripts
### Data types and structures in R:
* Dataframes
* Vectors
* Lists
