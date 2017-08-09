---
title       : Introduction to R for reproducible data visualization and analysis 
subtitle    : Session 3
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

## Session 3 - Using R to run reproducible data analysis

### Project structure

### Importing data

### Visualizing data

### Reporting results

### Making informative plots with ggplot

---

## Open Data from a Posner experiment

### Paper [HERE](https://link.springer.com/article/10.3758%2Fs13428-017-0935-1) 

### Data [HERE](https://osf.io/cwzds/)


<img class=center
  src=assets/img/session_3_paper_header.png width=800px>


---

## Step 1: create a project folder structure

Project directories should be organized consistently and methodically. My preferred structure would be:

### project_name/ (root directory)
* name_of_analysis.Rmd (Rnotebook with main analysis code)
* R/ (project-specific R function files)
* data/ (original data - READ ONLY)
* figure/ (figures automatically saved when running code)
* figure_output (figures for use elsewhere)
* output/ (processed or simulated data, other non-final output )

**Navigate to R_Workshop_Exercises**


---

## Step 2: Open our R Notebook for our analysis

 


---.smallcode

## Importing data

### Use `read_csv()` to import the data


```r
raw_data<-read_csv("data/study3_allsubjects_Posner.csv")
```

---.smallcode

## Importing data

### Use `read_csv()` to import the data


```r
raw_data<-read_csv("data/study3_allsubjects_Posner.csv")
```

```
## Warning: Duplicated column names deduplicated: '1' => '1_1' [2], '1' =>
## '1_2' [5], '1' => '1_3' [8]
```

```
## Parsed with column specification:
## cols(
##   `1` = col_integer(),
##   `1_1` = col_integer(),
##   `0.3` = col_double(),
##   `2` = col_integer(),
##   `1_2` = col_integer(),
##   `0.4316` = col_double(),
##   P10 = col_character(),
##   `1_3` = col_integer()
## )
```


---.smallcode

## Importing data

### Use `read_csv()` to import the data

Modify the code to not assign the first row to column names


```r
raw_data<-read_csv("data/study3_allsubjects_Posner.csv", col_names = FALSE)
```

```
## Parsed with column specification:
## cols(
##   X1 = col_integer(),
##   X2 = col_integer(),
##   X3 = col_double(),
##   X4 = col_integer(),
##   X5 = col_integer(),
##   X6 = col_double(),
##   X7 = col_character(),
##   X8 = col_integer()
## )
```

---.smallcode

## Preprocess data: first glimpse of the dataset

### Quick overview: variable number and type, number of rows ....


---.smallcode

## Preprocess data: first glimpse of the dataset

### Quick overview: variable number and type, number of rows ....



```r
raw_data
```

```
## # A tibble: 51,200 x 8
##       X1    X2    X3    X4    X5      X6    X7    X8
##    <int> <int> <dbl> <int> <int>   <dbl> <chr> <int>
##  1     1     1   0.3     2     1 0.43160   P10     1
##  2     1     2   0.3     0     1 0.39841   P10     1
##  3     1     3   0.4     2     1 0.38182   P10     1
##  4     1     4   0.3     0     1 0.41502   P10     1
##  5     1     5   0.5     0     1 0.29885   P10     1
##  6     1     6   0.5     2     1 0.29885   P10     1
##  7     1     7   0.6     0     1 0.23247   P10     1
##  8     1     8   0.3     2     1 0.43160   P10     1
##  9     1     9   0.5     0     1 0.29885   P10     1
## 10     1    10   0.6     0     1 0.26564   P10     1
## # ... with 51,190 more rows
```

---.smallcode

## Preprocess data: assign column names

### Use the `names()` command to assign names to variables
1. block
2. trial_number
3. SOA (delay between cue onset and target) in seconds
4. condition (0 = valid,  2=invalid)
5. response  (correct (1) or incorrect (0) )
6. RT: Reaction time (seconds)
7. Participant ID

---.smallcode

## Preprocess data: assign column names

### Use the `names()` command to assign names to variables
1. block
2. trial_number
3. SOA (delay between cue onset and target) in seconds
4. condition (0 = valid,  2=invalid)
5. response  (correct (1) or incorrect (0) )
6. RT: Reaction time (seconds)
7. Participant ID


```r
names(raw_data)<-c("block", "trial_number", "SOA", "condition", "response", "RT", "part_nb", "session_nb" )
```

---.smallcode

## Preprocess data: Modify variables ?


---.smallcode

## Preprocess data: Modify variables ?

```r
glimpse(raw_data)
```

```
## Observations: 51,200
## Variables: 8
## $ block        <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
## $ trial_number <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15...
## $ SOA          <dbl> 0.3, 0.3, 0.4, 0.3, 0.5, 0.5, 0.6, 0.3, 0.5, 0.6,...
## $ condition    <int> 2, 0, 2, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0...
## $ response     <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1...
## $ RT           <dbl> 0.43160, 0.39841, 0.38182, 0.41502, 0.29885, 0.29...
## $ part_nb      <chr> "P10", "P10", "P10", "P10", "P10", "P10", "P10", ...
## $ session_nb   <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
```


---.smallcode

## Preprocess data: Modify variables ?

```r
summary(raw_data)
```

```
##      block       trial_number         SOA          condition  
##  Min.   :1.00   Min.   :  1.00   Min.   :0.300   Min.   :0.0  
##  1st Qu.:1.75   1st Qu.: 40.75   1st Qu.:0.375   1st Qu.:0.0  
##  Median :2.50   Median : 80.50   Median :0.450   Median :0.0  
##  Mean   :2.50   Mean   : 80.50   Mean   :0.450   Mean   :0.4  
##  3rd Qu.:3.25   3rd Qu.:120.25   3rd Qu.:0.525   3rd Qu.:0.0  
##  Max.   :4.00   Max.   :160.00   Max.   :0.600   Max.   :2.0  
##                                                               
##     response            RT             part_nb            session_nb 
##  Min.   :0.0000   Min.   : -0.0190   Length:51200       Min.   :1.0  
##  1st Qu.:1.0000   1st Qu.:  0.2488   Class :character   1st Qu.:1.0  
##  Median :1.0000   Median :  0.2823   Mode  :character   Median :1.5  
##  Mean   :0.9806   Mean   :  0.3005                      Mean   :1.5  
##  3rd Qu.:1.0000   3rd Qu.:  0.3320                      3rd Qu.:2.0  
##  Max.   :1.0000   Max.   :117.3200                      Max.   :2.0  
##                   NA's   :994
```

---.smallcode

## Preprocess data: Modify variables ?

Convert block and session to factors

```r
raw_data$block<- as.factor()
```

---.smallcode

## Preprocess data: Modify variables ?

Convert block and session to factors

```r
raw_data$block<- as.factor(raw_data$block)
raw_data$session_nb<- as.factor(raw_data$session_nb)
```

---.smallcode

## Preprocess data: Modify variables ?

Use `mutate()` and `if_else` to recode condition to descriptive values

```r
raw_data %>% 
  mutate(condition_f = if_else(condition == 0, "valid", "invalid")) -> raw_data
```


---.smallcode

## Check that participants were 'behaving well'

Use `group_by()` and `summarise()`  to inspect individual hit-rates for each session.




---.smallcode

## `group_by()` and `summarise()`


```r
data %>%
  group_by(session) %>%
  summarise(count = n(), mean = mean(RT))
```

<img class=center
  src=assets/img/session_3_group_by.png width=800px>

---.smallcode

## Check that participants were 'behaving well'

Use `group_by()` and `summarise()`  to inspect individual hit-rates for each session. 


```r
raw_data %>%
  group_by() %>%
  summarise()
```


---.smallcode

## Check that participants were 'behaving well'

Use `group_by()` and `summarise()` to inspect individual hit-rates for each session. 


```r
raw_data %>%
  group_by(part_nb, session_nb) %>%
  summarise(hit_rate = mean(response))
```

```
## # A tibble: 80 x 3
## # Groups:   part_nb [?]
##    part_nb session_nb  hit_rate
##      <chr>     <fctr>     <dbl>
##  1      P1          1 0.9671875
##  2      P1          2 0.9859375
##  3     P10          1 0.9718750
##  4     P10          2 0.9625000
##  5     P12          1 0.9718750
##  6     P12          2 0.9687500
##  7     P13          1 0.9593750
##  8     P13          2 0.9812500
##  9     P14          1 0.9875000
## 10     P14          2 0.9937500
## # ... with 70 more rows
```

---.smallcode

## Check that participants were 'behaving well'

Use `group_by()` and `summarise()`  to inspect individual hit-rates for each session. 

A picture is worth a thousand tables, fill in the code to produce this plot:


```
## `stat_bindot()` using `bins = 30`. Pick better value with `binwidth`.
```

<img src="assets/fig/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" width="500px" style="display: block; margin: auto;" />

---.smallcode

## Check that participants were 'behaving well'

Use `group_by()` and `summarise()`  to inspect individual hit-rates for each session. 

A picture is worth a thousand tables


```r
raw_data %>%
  group_by(part_nb, session_nb) %>%
  summarise(hit_rate = mean(response)) %>%
  ggplot(aes(x = session_nb, y = hit_rate)) + 
  geom_dotplot(binaxis='y', stackdir = "center")
```

<img src="assets/fig/unnamed-chunk-15-1.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" width="400px" style="display: block; margin: auto;" />



---.smallcode

## Explore individual data for possible outliers

* Write the ggplot code to produce this plot:

<img src="assets/fig/unnamed-chunk-16-1.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" width="700px" style="display: block; margin: auto;" />

---.smallcode

## Explore individual data for possible outliers


```r
ggplot(raw_data, aes(y = RT, x = condition_f) ) + 
  geom_boxplot(na.rm = TRUE) +
  facet_wrap(~part_nb)
```

<img src="assets/fig/unnamed-chunk-17-1.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" width="600px" style="display: block; margin: auto;" />

---.smallcode

## Explore individual data for possible outliers

### Use the filter funtion to remove the outlier data point of subject 23



```r
raw_data %>% 
  filter() -> raw_data
```

---.smallcode

## Use the filter funtion to remove the outlier


```r
raw_data %>% 
  filter(RT < 5) -> raw_data
```

---.smallcode

## Explore individual data for possible outliers

### What additional criteria could /should we apply ??

<img src="assets/fig/unnamed-chunk-20-1.png" title="plot of chunk unnamed-chunk-20" alt="plot of chunk unnamed-chunk-20" width="680px" style="display: block; margin: auto;" />

---.smallcode

## Explore individual data for possible outliers

### Criteria applied by the original study:
* RTs less than 100 ms (no one is that fast)
* RTs above median RT +  3 times the median absolute deviation

---.smallcode

## Explore individual data for possible outliers

### Criteria applied by the original study:

* RTs less than 100 ms (Only The Flash is that fast)

### Use `summarise`,  `n()` and `group_by` to count the `nb_outliers` for each participant.


```r
raw_data %>%
  filter( ) %>%
  group_by() %>%
  summarise()
```


---.smallcode

## Explore individual data for possible outliers

### Criteria applied by the original study:

* RTs less than 100 ms (Only The Flash is that fast)

### Use `summarise`,  `n()` and `group_by` to count the `nb_outliers` for each participant.


```r
raw_data %>%
  filter( RT < .1) %>%
  group_by(part_nb) %>%
  summarise(nb_outliers = n())
```

---.smallcode

## Explore individual data for possible outliers

### Criteria applied by the original study:

* RTs less than 100 ms (Only The Flash is that fast)

### Now add ggplot code using  `geom_col()` to produce this plot:


```r
raw_data %>%
  filter( RT < .1) %>%
  group_by(part_nb) %>%
  summarise(nb_outliers = n()) %>%
  ggplot() +
  geom_col()
```

<img src="assets/fig/unnamed-chunk-24-1.png" title="plot of chunk unnamed-chunk-24" alt="plot of chunk unnamed-chunk-24" width="500px" style="display: block; margin: auto;" />

---.smallcode

## Explore individual data for possible outliers

### Criteria applied by the original study:

* RTs below 100 ms (Only The Flash is that fast)

### Now add ggplot code using  `geom_col()` to produce this plot:



```r
raw_data %>%
  filter( RT < .1) %>%
  group_by(part_nb) %>%
  summarise(nb_outliers = n()) %>%
  ggplot(aes(x=part_nb, y=nb_outliers)) +
  geom_col()
```

<img src="assets/fig/unnamed-chunk-25-1.png" title="plot of chunk unnamed-chunk-25" alt="plot of chunk unnamed-chunk-25" width="500px" style="display: block; margin: auto;" />


---.smallcode

## Explore individual data for possible outliers

### Criteria applied by the original study:
* RTs above median RT +  3 times the median absolute deviation 

### Use the `mad()` function to produce the same figure for this criteria 


```r
raw_data %>%
  filter( ) %>%
  group_by(part_nb) %>%
  summarise(???) %>%
  ggplot(aes(x=part_nb, y=nb_outliers)) +
  geom_col()
```

---.smallcode

## Explore individual data for possible outliers

### Criteria applied by the original study:
* RTs above median RT +  3 times the median absolute deviation 

### Use the `mad()` function to produce the same figure for this criteria 



```r
raw_data %>%
  group_by(part_nb) %>%
  filter( RT > median(RT) + 3*mad(RT)) %>%
  summarise(nb_outliers = n()) %>%
  ggplot(aes(x=part_nb, y=nb_outliers)) +
  geom_col()
```

<img src="assets/fig/unnamed-chunk-27-1.png" title="plot of chunk unnamed-chunk-27" alt="plot of chunk unnamed-chunk-27" width="500px" style="display: block; margin: auto;" />


---.smallcode

## Explore individual data for possible outliers

### Put it all together to remove outliers
* RTs below 100 ms (no one is that fast)
* RTs above median+ 3 times the median absolute deviation 

Fill in the code to remove all trials with outlier RTs


```r
raw_data %>%
  group_by(part_nb) %>%
  filter( ) -> preproc_data
```

---.smallcode

## Explore individual data for possible outliers

### Put it all together to remove outliers
* RTs over median+ 3 times the median absolute deviation 
* RTs less than 100 ms (only The Flash is that fast)


```r
raw_data %>%
  group_by(part_nb) %>%
  filter((RT > 0.1 & (RT < median(RT) + 3*mad(RT)))) -> preproc_data
```

---.smallcode

## Visualize preprocessed individual data


```r
ggplot( ) + 
  geom_boxplot() +
  facet_wrap()
```

<img src="assets/fig/unnamed-chunk-31-1.png" title="plot of chunk unnamed-chunk-31" alt="plot of chunk unnamed-chunk-31" width="680px" style="display: block; margin: auto;" />

---.smallcode

## Visualize preprocessed individual data


```r
ggplot(preproc_data, aes(y = RT, x = condition_f) ) + 
  geom_boxplot(na.rm = TRUE) +
  facet_wrap(~part_nb)
```

<img src="assets/fig/unnamed-chunk-32-1.png" title="plot of chunk unnamed-chunk-32" alt="plot of chunk unnamed-chunk-32" width="680px" style="display: block; margin: auto;" />



---.smallcode

## Compute individual performance 

### Dependent/measured  variable: 
* RT 

### Independent/manipulated variables: 
* condition_f 
* session_nb

---.smallcode

## Compute individual performance 

### Dependent/measured  variable: 
* RT 

### Independent/manipulated variables: 
* condition_f 
* session_nb

### Compute individual mean RTs for each condition and session  

```r
preproc_data %>%
  group_by() %>%
  summarise() -> indiv_data
```

---.smallcode

## Evaluate individual performance 

### Dependent/measured  variable: 
* RT 

### Independent/manipulated variables: 
* condition_f 
* session_nb

### Compute individual mean RTs for each condition and session  

```r
preproc_data %>%
  group_by(part_nb, condition_f, session_nb) %>%
  summarise(RT_mean = mean(RT, na.rm=TRUE) , 
            RT_sd = sd(RT, na.rm=TRUE)) -> indiv_data
```

---.smallcode

## The classical plot 

<img src="assets/fig/unnamed-chunk-35-1.png" title="plot of chunk unnamed-chunk-35" alt="plot of chunk unnamed-chunk-35" width="680px" style="display: block; margin: auto;" />


---.smallcode

## The classical plot - DON'T DO IT

<img src="assets/fig/unnamed-chunk-36-1.png" title="plot of chunk unnamed-chunk-36" alt="plot of chunk unnamed-chunk-36" width="680px" style="display: block; margin: auto;" />


---

## Informative plotting of data

<img class=center
  src=assets/img/session_3_between_figures.png width=650px>


[Weissgerber TL, Milic NM, Winham SJ, Garovic VD (2015) Beyond Bar and Line Graphs: Time for a New Data Presentation Paradigm.](http://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1002128)

---

## Informative plotting of data

<img class=center
  src=assets/img/session_3_group_comps.png width=450px>


[Rousselet, G. A., Foxe, J. J. and Bolam, J. P. (2016), A few simple steps to improve the description of group results in neuroscience. Eur J Neurosci, 44: 2647-2651.](http://onlinelibrary.wiley.com/doi/10.1111/ejn.13400/full)

---.smallcode &twocol_l

## Plotting a 2 x 2 within participant design: your choice !

*** =left

### Option 1: visualize the direction of individual differences

<img src="assets/fig/unnamed-chunk-37-1.png" title="plot of chunk unnamed-chunk-37" alt="plot of chunk unnamed-chunk-37" width="400px" style="display: block; margin: auto;" />

*** =right

### Option 2: Plot within-subject RT differences between invalid and valid trials

<img src="assets/fig/unnamed-chunk-38-1.png" title="plot of chunk unnamed-chunk-38" alt="plot of chunk unnamed-chunk-38" width="450px" style="display: block; margin: auto;" />

---.smallcode
## Exporting your plot

Use `ggsave()` to export your plot to a variety of formats:
* "png", "eps", "ps", "pdf", "jpeg", "tiff", "png", "bmp", "svg"

* Arguments

```r
ggsave(filename, plot = last_plot(), device = NULL, path = NULL,
  scale = 1, width = NA, height = NA, units = c("in", "cm", "mm"),
  dpi = 300, limitsize = TRUE, ...)
```

* Examples

```r
ggsave("figure_ouput/myfig.pdf")
ggsave("figure_ouput/myfig.png")
ggsave("figure_ouput/myfig.pdf", width = 8.7, height = 10, units = "cm")
```




---.smallcode

## Next analysis step : Inferential statistics !

### Our hypotheses:
* RTs are faster for valid than invalid trials
* This difference in RTs varies across sessions

---.smallcode

## Next analysis step : Inferential statistics !

### Our hypotheses:
* RTs are faster for valid than invalid trials
* This difference in RTs varies across sessions

### One possible statistical test: the 2 X 2 Repeated Measures ANOVA
* Factor 1: condition_f 
* Factor 2: session_nb

---.smallcode

## Next analysis step : Inferential statistics !

### Our hypotheses:
* RTs are faster for valid than invalid trials
* This difference in RTs varies across sessions

### One possible statistical test: the 2 X 2 Repeated Measures ANOVA
* Factor 1: condition_f 
* Factor 2: session_nb

--- .smallcode

### A package for ANOVAs made easy: ez


```r
library(ez)
```


```r
anova_model <- ezANOVA(data = indiv_data,
                       dv = RT_mean,
                       wid = part_nb,
                       within = .(condition_f, session_nb))
```

--- .smallcode

### Reproducible ANOVA analysis


```r
anova_model <- ezANOVA(data = indiv_data,
                       dv = RT_mean,
                       wid = part_nb,
                       within = .(condition_f, session_nb))
```

```
## Warning: Converting "part_nb" to factor for ANOVA.
```

```
## Warning: Converting "condition_f" to factor for ANOVA.
```


```r
anova_model
```

```
## $ANOVA
##                   Effect DFn DFd         F            p p<.05          ges
## 2            condition_f   1  39 66.053127 6.406377e-10     * 0.0672843366
## 3             session_nb   1  39 12.418875 1.102401e-03     * 0.0178617456
## 4 condition_f:session_nb   1  39  1.048709 3.121149e-01       0.0001098009
```

Add the ANOVA analysis to your analysis file as well as a paragraph explaining the results.

--- .smallcode

### Reproducible data analysis

Your reproducible data analysis file is now ready and complete. 

Press the *Knit* button to process your file into an html document.

Well done !!!



---

## Informative plotting of data - independent groups

<img class=center
  src=assets/img/session_3_group_comps.png width=450px>


[Rousselet, G. A., Foxe, J. J. and Bolam, J. P. (2016), A few simple steps to improve the description of group results in neuroscience. Eur J Neurosci, 44: 2647-2651.](http://onlinelibrary.wiley.com/doi/10.1111/ejn.13400/full)

---
## Informative plotting of data - independent groups

Create a new .Rmd file in R/R_Workshop/Exercises

Use this .Rmd file and R chuncks to keep a trace of all you code !

First we will *modify* our data to simulate independent group data

---.smallcode

## Plotting options for fully independent groups
Use `rename()`and `mutate`  to change 
* condition_f to group : 
  * "valid" to "CTRL"
  * "invalid" to "DYS"
* session_nb to age
  * "1" to "young"
  * "2" to "old"


```r
indiv_data %>%
  ungroup() %>%
  select(-part_nb) %>%
  rename()%>% 
  mutate() -> indep_data
```


---.smallcode

## Plotting options for fully independent groups
Use `rename()`and `mutate`  to change 
* condition_f to group : 
  * "valid" to "CTRL"
  * "invalid" to "DYS"
* session_nb to age
  * "1" to "young"
  * "2" to "old"


```r
indiv_data %>%
  ungroup() %>%
  select(-part_nb) %>%
  rename(group = condition_f, age = session_nb)%>% 
  mutate(group = ifelse( group == "valid", "CTRL", "DYS"),
         age = ifelse(age == 1, "young" , "old")) -> indep_data
```


---.smallcode &twocol_l

## Plotting options for fully independent groups: your choice !

*** =left

### Option 1: boxplot and jittered individua data

<img src="assets/fig/unnamed-chunk-47-1.png" title="plot of chunk unnamed-chunk-47" alt="plot of chunk unnamed-chunk-47" width="450px" style="display: block; margin: auto;" />

```
## <ggproto object: Class ScaleDiscrete, Scale>
##     aesthetics: fill
##     axis_order: function
##     break_info: function
##     break_positions: function
##     breaks: CTRL DYS
##     call: call
##     clone: function
##     dimension: function
##     drop: TRUE
##     expand: waiver
##     get_breaks: function
##     get_breaks_minor: function
##     get_labels: function
##     get_limits: function
##     guide: legend
##     is_discrete: function
##     is_empty: function
##     labels: Normal readers Dyslexic readers
##     limits: NULL
##     make_sec_title: function
##     make_title: function
##     map: function
##     map_df: function
##     n.breaks.cache: NULL
##     na.translate: TRUE
##     na.value: grey50
##     name: Group
##     palette: function
##     palette.cache: NULL
##     position: left
##     range: <ggproto object: Class RangeDiscrete, Range>
##         range: NULL
##         reset: function
##         train: function
##         super:  <ggproto object: Class RangeDiscrete, Range>
##     reset: function
##     scale_name: hue
##     train: function
##     train_df: function
##     transform: function
##     transform_df: function
##     super:  <ggproto object: Class ScaleDiscrete, Scale>
```

*** =right

### Option 2: Pirate plots : yarrr !!!

* load the yarrr library

```r
library(yarrr)
```


<img src="assets/fig/unnamed-chunk-49-1.png" title="plot of chunk unnamed-chunk-49" alt="plot of chunk unnamed-chunk-49" width="450px" style="display: block; margin: auto;" />


---.smallcode

## Plotting options for fully independent groups

Option 1: boxplot and jittered individua data


```r
ggplot(indep_data, aes(x = age, y = RT_mean, fill= group) ) + 
  geom_boxplot(na.rm = TRUE, width = 0.4, outlier.shape = NA, alpha = 0.7) +
   geom_point(pch = 21, position = position_jitterdodge(jitter.width = 0.1, dodge.width = 0.4), size = 2)+
  theme_bw() +
  ggtitle("Effect of reading ability and age on reaction times") +
  xlab("Session") + ylab("Mean reaction times") + 
  theme(text=element_text(size = 28))
```

<img src="assets/fig/unnamed-chunk-50-1.png" title="plot of chunk unnamed-chunk-50" alt="plot of chunk unnamed-chunk-50" width="450px" style="display: block; margin: auto;" />

```r
   scale_fill_discrete(name="Group",
                          breaks=c("CTRL", "DYS"),
                         labels=c("Normal readers", "Dyslexic readers"))
```

```
## <ggproto object: Class ScaleDiscrete, Scale>
##     aesthetics: fill
##     axis_order: function
##     break_info: function
##     break_positions: function
##     breaks: CTRL DYS
##     call: call
##     clone: function
##     dimension: function
##     drop: TRUE
##     expand: waiver
##     get_breaks: function
##     get_breaks_minor: function
##     get_labels: function
##     get_limits: function
##     guide: legend
##     is_discrete: function
##     is_empty: function
##     labels: Normal readers Dyslexic readers
##     limits: NULL
##     make_sec_title: function
##     make_title: function
##     map: function
##     map_df: function
##     n.breaks.cache: NULL
##     na.translate: TRUE
##     na.value: grey50
##     name: Group
##     palette: function
##     palette.cache: NULL
##     position: left
##     range: <ggproto object: Class RangeDiscrete, Range>
##         range: NULL
##         reset: function
##         train: function
##         super:  <ggproto object: Class RangeDiscrete, Range>
##     reset: function
##     scale_name: hue
##     train: function
##     train_df: function
##     transform: function
##     transform_df: function
##     super:  <ggproto object: Class ScaleDiscrete, Scale>
```

---.smallcode

## Plotting options for fully independent groups

Option 2: Pirate plots : yarrr !!!


```r
pirateplot(formula = RT_mean ~ group + age,
           data = indep_data,
           theme = 1,
           pal = "xmen",
           point.pch = 16,
           gl.col = gray(.8),
           main = "Effect of cue validity and session on reaction times")
```

<img src="assets/fig/unnamed-chunk-51-1.png" title="plot of chunk unnamed-chunk-51" alt="plot of chunk unnamed-chunk-51" width="450px" style="display: block; margin: auto;" />


--- Create informative ERP plots

## Plotting ERP data

<img class=center
  src=assets/img/session_3_ERP_plots.png width=520px>


[Rousselet, G. A., Foxe, J. J. and Bolam, J. P. (2016), A few simple steps to improve the description of group results in neuroscience. Eur J Neurosci, 44: 2647-2651.](http://onlinelibrary.wiley.com/doi/10.1111/ejn.13400/full)


---.smallcode

## Create informative ERP plots

### Load the data from the ERP library


```r
library(ERP)
data(erpcz)
erp_data<-as.tibble(erpcz)
```

### Wrangle the data to get the following tibble


```r
erp_data %>%
  gather(key = x_time, value=amplitude, -Subject, -Instruction) %>%
  separate(col = x_time, into=c("x","time"), sep="X") %>%
  mutate(time = as.numeric(time)) ->erp_data
```


---.smallcode

## Create informative ERP plots

### Wrangle the data to get the following tibble


```r
erp_data %>%
  gather() %>%
  separate() %>%
  mutate() ->erp_data
```


```
## Warning: Too few values at 30120 locations: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
## 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...
```

```
## # A tibble: 30,120 x 5
##    Subject Instruction     x  time amplitude
##     <fctr>      <fctr> <chr> <dbl>     <chr>
##  1      S1         TBR     x    NA          
##  2      S1         TBF     x    NA          
##  3      S2         TBR     x    NA          
##  4      S2         TBF     x    NA          
##  5      S3         TBR     x    NA          
##  6      S3         TBF     x    NA          
##  7      S4         TBR     x    NA          
##  8      S4         TBF     x    NA          
##  9      S5         TBR     x    NA          
## 10      S5         TBF     x    NA          
## # ... with 30,110 more rows
```

---.smallcode

## Create informative ERP plots

### Wrangle the data to get the following tibble


```r
erp_data %>%
  gather(key = x_time, value=amplitude, -Subject, -Instruction) %>%
  separate(col = x_time, into=c("x","time"), sep="X") %>%
  mutate(time = as.numeric(time)) -> erp_data
```

```
## Warning: Too few values at 90360 locations: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
## 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...
```


```r
erp_data
```

```
## # A tibble: 90,360 x 5
##    Subject Instruction     x  time amplitude
##     <fctr>      <fctr> <chr> <dbl>     <chr>
##  1      S1         TBR     x    NA         x
##  2      S1         TBF     x    NA         x
##  3      S2         TBR     x    NA         x
##  4      S2         TBF     x    NA         x
##  5      S3         TBR     x    NA         x
##  6      S3         TBF     x    NA         x
##  7      S4         TBR     x    NA         x
##  8      S4         TBF     x    NA         x
##  9      S5         TBR     x    NA         x
## 10      S5         TBF     x    NA         x
## # ... with 90,350 more rows
```


---.smallcode

## Create informative ERP plots

### Load the data from the ERP library


```r
library(ERP)
data(erpcz)
erp_data<-as.tibble(erpcz)
```

### Wrangle the data to get the following tibble


```r
erp_data %>%
  gather(key = x_time, value=amplitude, -Subject, -Instruction) %>%
  separate(col = x_time, into=c("x","time"), sep="X") %>%
  mutate(time = as.numeric(time)) ->erp_data
```

---.smallcode

## Create informative ERP plots

First create this non-informative plot of the group-averaged ERP

<img src="assets/fig/unnamed-chunk-60-1.png" title="plot of chunk unnamed-chunk-60" alt="plot of chunk unnamed-chunk-60" width="680px" style="display: block; margin: auto;" />

---.smallcode

## Create informative ERP plots

First create this non-informative plot of the group-averaged ERP


```r
erp_data %>% 
  group_by(Instruction, time) %>%
  summarise(Mean=mean(amplitude)) %>%
ggplot(aes(x=time, y = Mean, color= Instruction, fill = Instruction)) + 
  geom_line(size = 3) +
  theme_bw()  + 
  theme(text = element_text(size = 28))
```

<img src="assets/fig/unnamed-chunk-61-1.png" title="plot of chunk unnamed-chunk-61" alt="plot of chunk unnamed-chunk-61" width="450px" style="display: block; margin: auto;" />

---.smallcode

## Create informative ERP plots

Now let's add the individual ERPs in the background

<img src="assets/fig/unnamed-chunk-62-1.png" title="plot of chunk unnamed-chunk-62" alt="plot of chunk unnamed-chunk-62" width="680px" style="display: block; margin: auto;" />

---.smallcode

## Create informative ERP plots

Now let's add the individual ERPs in the background


```r
erp_data %>% 
  group_by(Instruction, time) %>%
  summarise(Mean=mean(amplitude)) -> mean_erp_data

ggplot(erp_data, aes(x=time, y = amplitude, color= Instruction)) + 
  geom_line(aes(color= Instruction, group = interaction(Subject, Instruction)), alpha = 0.5, size =0.2) +
  geom_line(data = mean_erp_data, aes(y=Mean), size =2) +
  theme_bw() + 
  theme(text = element_text(size = 28))
```

<img src="assets/fig/unnamed-chunk-63-1.png" title="plot of chunk unnamed-chunk-63" alt="plot of chunk unnamed-chunk-63" width="480px" style="display: block; margin: auto;" />


---.smallcode

## Create informative ERP plots - differences

Compute the difference between conditions


```r
erp_data %>% 
  spread(key = , value = ) %>%
  mutate() -> diff_erp_data
diff_erp_data
```


```
## # A tibble: 5,020 x 6
##    Subject     x  time       TBF        TBR amplitude_diff
##     <fctr> <chr> <dbl>     <dbl>      <dbl>          <dbl>
##  1      S1           0 1.2075636 -0.2856621     -1.4932258
##  2      S1           4 1.3754103 -0.1936692     -1.5690796
##  3      S1           8 0.8019341 -0.5003122     -1.3022463
##  4      S1          12 1.5642378 -0.5148374     -2.0790752
##  5      S1          16 1.4103783 -0.3534464     -1.7638247
##  6      S1          20 0.9045071 -0.1855997     -1.0901068
##  7      S1          24 0.9954240 -0.2614535     -1.2568775
##  8      S1          28 0.8392334  0.1145876     -0.7246458
##  9      S1          32 1.0280609  0.1839858     -0.8440751
## 10      S1          36 0.6224315  0.2614535     -0.3609780
## # ... with 5,010 more rows
```

---.smallcode

## Create informative ERP plots - differences

Compute the difference between conditions


```r
erp_data %>% 
  spread(key = Instruction, value = amplitude) %>%
  mutate(amplitude_diff = TBR - TBF) -> diff_erp_data
diff_erp_data
```

```
## # A tibble: 5,020 x 6
##    Subject     x  time       TBF        TBR amplitude_diff
##     <fctr> <chr> <dbl>     <dbl>      <dbl>          <dbl>
##  1      S1           0 1.2075636 -0.2856621     -1.4932258
##  2      S1           4 1.3754103 -0.1936692     -1.5690796
##  3      S1           8 0.8019341 -0.5003122     -1.3022463
##  4      S1          12 1.5642378 -0.5148374     -2.0790752
##  5      S1          16 1.4103783 -0.3534464     -1.7638247
##  6      S1          20 0.9045071 -0.1855997     -1.0901068
##  7      S1          24 0.9954240 -0.2614535     -1.2568775
##  8      S1          28 0.8392334  0.1145876     -0.7246458
##  9      S1          32 1.0280609  0.1839858     -0.8440751
## 10      S1          36 0.6224315  0.2614535     -0.3609780
## # ... with 5,010 more rows
```

---.smallcode

## Create informative ERP plots - differences

Compute non-parametric confidence intervals using bootstrapping

* load the `rcompanion` library


```r
library(rcompanion)
```

---.smallcode

## Create informative ERP plots - differences

Compute non-parametric confidence intervals using bootstrapping

* Compute the ajusted bootstrapped percentile confidence intervals

```r
erp_boot_data <- groupwiseMean(amplitude_diff ~ time ,
              data   = diff_erp_data,
              conf   = 0.95,
              digits = 3,
              R      = 1000,
              boot        = TRUE,
              traditional = FALSE,
              normal      = FALSE,
              basic       = FALSE,
              percentile  = FALSE,
              bca         = TRUE)
head(erp_boot_data)
```

```
##   time  n   Mean Boot.mean Conf.level Bca.lower Bca.upper
## 1    0 20 -0.487    -0.482       0.95     -1.43   0.42900
## 2    4 20 -0.768    -0.758       0.95     -1.66   0.00345
## 3    8 20 -0.642    -0.645       0.95     -1.56   0.18400
## 4   12 20 -0.568    -0.569       0.95     -1.50   0.37000
## 5   16 20 -0.553    -0.577       0.95     -1.48   0.50300
## 6   20 20 -0.456    -0.451       0.95     -1.48   0.65900
```


---.smallcode

## Create informative ERP plots

Create this plot using `geom_ribbon` to visualize the confidence intervals

<img src="assets/fig/unnamed-chunk-69-1.png" title="plot of chunk unnamed-chunk-69" alt="plot of chunk unnamed-chunk-69" width="580px" style="display: block; margin: auto;" />

---.smallcode

## Create informative ERP plots

Create this plot using `geom_ribbon` to visualize the confidence intervals


```r
ggplot(erp_boot_data, aes(x=time, y = Mean)) + 
  geom_hline(yintercept = 0, color='red') +
  geom_ribbon(aes(ymin= Bca.lower, ymax= Bca.upper), alpha = 0.2) + 
  geom_line() +
  theme_bw()
```

<img src="assets/fig/unnamed-chunk-70-1.png" title="plot of chunk unnamed-chunk-70" alt="plot of chunk unnamed-chunk-70" width="480px" style="display: block; margin: auto;" />


---.smallcode

## Create informative ERP plots

Modify your plot to add individual differences in ERP response

<img src="assets/fig/unnamed-chunk-71-1.png" title="plot of chunk unnamed-chunk-71" alt="plot of chunk unnamed-chunk-71" width="580px" style="display: block; margin: auto;" />

---.smallcode

## Create informative ERP plots

Modify your plot to add individual differences in ERP response


```r
ggplot(erp_boot_data, aes(x=time, y = Mean)) + 
  geom_hline(yintercept = 0, color='red') +
  geom_line(data=diff_erp_data, aes(x=time, y=amplitude_diff, group = Subject ), color= "light gray", size =0.2) +
  geom_ribbon(aes(ymin= Bca.lower, ymax= Bca.upper), fill= NA, color = "blue",size = 1) + 
  geom_line(size = 2, color = "blue") +
  theme_bw()
```

<img src="assets/fig/unnamed-chunk-72-1.png" title="plot of chunk unnamed-chunk-72" alt="plot of chunk unnamed-chunk-72" width="480px" style="display: block; margin: auto;" />

---.smallcode

## Create informative ERP plots

Time-course of individual differences with colors mapping amplitudes

<img src="assets/fig/unnamed-chunk-73-1.png" title="plot of chunk unnamed-chunk-73" alt="plot of chunk unnamed-chunk-73" width="580px" style="display: block; margin: auto;" />

---.smallcode

## Create informative ERP plots

Time-course of individual differences with colors mapping amplitudes


```r
library(viridis)

ggplot(diff_erp_data, aes(x=time, y = Subject)) + 
  geom_raster(aes(fill = amplitude_diff)) +
  scale_x_continuous( limits = c(0,1000),expand = c(0, 0)) +
  scale_y_discrete( expand = c(0, 0)) +
  scale_fill_viridis() +
  theme_bw()
```

<img src="assets/fig/unnamed-chunk-74-1.png" title="plot of chunk unnamed-chunk-74" alt="plot of chunk unnamed-chunk-74" width="480px" style="display: block; margin: auto;" />


---

## Session 3 - Using R to run reproducible data analysis

### Project structure

### Importing data

### Visualizing data

### Reporting results

### Making informative plots with ggplot


---

## Making informative plots with ggplot

### Be able to use *geoms*
* Use `geom_col()` to visualize counts
* Use `geom_line()` to link selected data points
* Use `geom_ribbon()` to visualize confidence intervals
* Use `geom_raster()` to make heatmaps


### Be able to modify a plot to improve visualization
* transform axes or color scales
* use `theme()` to modify text size
* Use `xlab()`, `ylab()`, `ggtitle()`

