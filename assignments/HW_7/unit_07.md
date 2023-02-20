W271 Assignment 7
================

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

    ## 
    ## Attaching package: 'magrittr'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     set_names

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     extract

    ## 
    ## Attaching package: 'lubridate'

    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

    ## 
    ## Attaching package: 'tsibble'

    ## The following object is masked from 'package:lubridate':
    ## 
    ##     interval

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, union

    ## Loading required package: fabletools

    ## Registered S3 method overwritten by 'quantmod':
    ##   method            from
    ##   as.zoo.data.frame zoo

    ## Loading required package: zoo

    ## 
    ## Attaching package: 'zoo'

    ## The following object is masked from 'package:tsibble':
    ## 
    ##     index

    ## The following objects are masked from 'package:base':
    ## 
    ##     as.Date, as.Date.numeric

``` r
theme_set(theme_minimal())
```

# AIC and BIC and “Stringency”

## (4 points) Question 1

In the async lecture, Jeffrey says “BIC is in general more stringent
than AIC or AICc”. Let’s illustrate that and reason about it.

1.  Produce a dataset, `d`, that includes 100 observations of pure
    white-noise.
    -   The outcome variable should be a variable `y` that has 100 draws
        from `rnorm`, with `mean=0` and `sd=1`.
    -   The input variables should be variables `x1`
        ![\dots](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Cdots "\dots")
        `x10` that are also 100 draws from `rnorm` each with `mean=0`
        and `sd=1`.
    -   There are fancy ways to write this code; the goal for this isn’t
        to place a clever coding task in front of you, so feel free to
        use copy-paste to create the data object in any way that you
        can.
2.  After producing data, fit 11 models against that data, stored as
    `model0` through `model10`. (The number appended to `model`
    corresponds to the number of parameters that you have used in your
    estimation).
3.  After estimating your models, create a new dataset, `results_data`,
    that contains the number of parameters that you have used in an
    estimation, and the AIC and BIC values that you calculated for that
    number of parameters.
    1.  Note – this is another place where the way that you create the
        data, and the way that the data is the most useful to use are
        incongruent.
    2.  When we created the data, we created a dataset that has a column
        called `parameters`, a column called `aic` and a column called
        `bic`.
    3.  However, it is much more useful to have “tidy” data that has
        these values stacked. If you find yourself creating the dataset
        in the “wide” form that we have described above, you can use the
        `dplyr::pivot_longer` function to pivot your data into a tidy
        format. Specifically, we used this call
        `pivot_longer(cols = c('aic', 'bic'))` with our input data
        structure.
4.  Finally, produce a plot that shows the AIC and BIC values on the
    y-axis and the number of estimated parameters on the x-axis. In the
    subtitle to your plot, note whether a relatively higher or lower AIC
    or BIC means that a model is performing better or worse (i.e. either
    “Higher values are better” or “Lower values are better”). What do
    you notice about these plots, and what does this tell you about the
    “stringency” of AIC vs. BIC?

> What do you note? Fill this in!

## (2 points) Question 2

Now, suppose that you had data that, *in the population model* actually
held a relationship between the input features and the outcome feature.
Specifically, suppose that for every unit increase in `x1` there was a
`0.1` increase in the outcome, for every unit increase in `x2` there was
a `0.2` increase in the outcome,
![\dots](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Cdots "\dots"),
for every unit increase in `x10` there was a `1.0` unit increase in the
outcome. Suppose that if all `x1`
![\dots](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Cdots "\dots")
`x10` were zero, that the outcome would have an expectation of zero, but
with white-noise around it with
![\mu = 0](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Cmu%20%3D%200 "\mu = 0")
and
![\sigma = 1](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Csigma%20%3D%201 "\sigma = 1").

-   Modify the code that you wrote above to create data according to
    this schedule.
-   Estimate 11 models as before.
-   Produce a new dataset `resutls_data` that contains the AIC and BIC
    values from each of these models.
-   Produce the same plot as you did before with the white noise series.
    Comment on what, if anything is similar or different between this
    plot, and the plot you created before.

> What do you notice about this plot and the model performance overall?

# Weather in NYC

Our goals with this question are to:

-   (If necessary) Clean up code that we’ve written before to re-use.
    This task of writing code, and then coming back and using it later
    is often overlooked in the MIDS program. Here’s a chance to
    practice!
-   Estimate several different polynomial regressions against a time
    series and evaluate at what point we have produced a model with
    “enough complexity” that the model evaluation scores cease to tell
    us that additional model parameters are improving the model fit.

## (1 point) Load the Weather Data

Load the weather data in the same way as you did in the previous
assignment, recalling that there was some weird duplication of data for
one of the days. Then, create an object, `weather_weekly` that
aggregates the data to have two variables `average_temperature` and
`average_dewpoint` at the year-week level, for each airport. After your
aggregation is complete, you should have a `tsibble` that has the
following shape:

    A tsibble: 159 x 4 [1W]
    # Key:       origin [3]
       origin week_index average_temperature average_dewpoint
       <chr>      <week>               <dbl>            <dbl>
     1 EWR      2013 W01                34.3            19.4 
     2 EWR      2013 W02                42.7            33.3 
     3 EWR      2013 W03                39.6            26.5 

## (2 points) Fit Polynomial Regression Models

For each of the `average_temperature` and `average_dewpoint` create ten
models that include polynomials of increasing order.

-   One issue that you’re likely to come across is dealing with how to
    make the time index that you’re using in your `tsibble` work with
    either `poly` or some other function to produce the polynomial
    terms; this arises because although the time index is ordered, it
    isn’t really a “numeric” feature so when you call for something
    like, `poly(week_index, degree=2)` you will be met with an error.
-   Cast the index to a numeric variable, where the first week is
    indexed to be `0`. Recall that Jeffrey notes that this form of
    translation only changes the way that the intercept is interpreted;
    we will note that because the `as.numeric(week_index)` creates input
    variables that are in the vicinity, it also changes the magnitude of
    the higher-order polynomial terms that are estimated, though it does
    not change the regression diagnostics and model scoring to transform
    (or not) these time index variables.

Additionally, you might recall that in 203, we actually recommended you
away from using the `poly` function. That was a recommendation based on
students’ knowledge at the time, when we were considering fitting log
and square root transformations of data. At this point, you can handle
the additional complexity and can take the recommendation that `poly` is
nice for working with polynomial translations of time.

## (2 points) Evalute the model fits best for each outcomes

For each of the outcomes – `average_temperature` at the weekly level,
and `average_dewpoint` at the weekly level – make an assessment based on
either AIC or BIC for why one polynomial degree produces the best
fitting model. In doing so, describe why you have chosen to use either
AIC or BIC, what the particular scoring of this metric is doing
(i.e. write the formula, and explain to your reader what is happening in
that formula). Especially compelling in producing your argument for why
you prefer a particular model form is to create a plot of the polynomial
degree on the x-axis and the metric score on the y-axis.

Looking at these two BIC scoring criteria there seems to be a clear
**lack** of improvement beyond a polynomial order of four. *Perhaps*
moving from four to five would still increase the model’s performance,
but it is small compared to the polynomials 2-4. For us, if we were
fitting this model, we would be likely to stop at `poly( , degree = 4)`.

# Smooth Moves

In the async lecture, Jeffrey proposes four different smoothers that
might be used:

1.  **Moving Average**: These moving average smoothers can be either
    symmetric or, often preferred, backward smoothers. Please use a
    backward smoother, and make the choice about the number of periods
    based off of some evaluation of different choices. You might consult
    \[[this page](https://otexts.com/fpp3/moving-averages.html)\] in
    *Forecasting Principles and Practice 3*.
2.  **Regression Smoothers**: Please use the polynomial regression that
    you stated you most preferred from your BIC analysis to the last
    question.
3.  (Optional) **Spline Smoothers**: There is a reading in the
    repository that provides some more background (it is a review
    from 2019) on using spline smoothers. The current implementation
    that we prefer in R is the `splines2` library. For your spline
    smoother, use the `splines2::naturalSpline` function. Once you have
    fitted this spline, you can use the `predict` method to produce
    values. A good starting place for this is
    \[[here](https://wwenjie.org/splines2/articles/splines2-intro#natural-cubic-splines)\].
    We’ll note that this is the most challenging of the smoothers to get
    running in this assignment, and so getting it running successfully
    is optional.
4.  **Kernel Smoothers**.: Please use the `ksmooth` function that is
    available to you in the `stats` library. Because `stats` is always
    loaded in R, we have not referred to it using the `::` notation.

## (6 points, with 2 optional) Create Smoothers

With the weekly weather data that you used for the previous question,
produce a smoothed variable for `average_temperature` and
`average_dewpoint` using each of the four smoothers described in the
async. Three smoothers are required of this question – (1) Moving
Average; (2) Regression Smoothers; and, (3) Kernel Smoothers. The
fourth, splines, is optional but if you produce a spline smoother that
is working effectively, you can earn two bonus points. (Note that the
homework maximum score is still 100%.)

When you are done with this task, you should have created eight new
variables that are each a smoothed version of this series.

For each smoother that you produce:

-   Fit the smoother **within** each origin. That is, fit the smoother
    for JFK separately from LaGuardia and Newark.  
-   Attach the values that are produced by the smoother onto the
    `weekly_weather` dataframe.
-   Produce a plot that shows the original data as `geom_point()`, and
    the smoother’s predictions as `geom_line()`.
-   Your goal is not to produce **any** smoother, but instead, for each
    class of smoother, the version that is doint the best job that is
    possible by this smoother. That is, you are working through the
    hyperparametrs to these algorithms to produce their most effective
    output.

# (3 points) Is Unemployment a Moving Average Process?

You did work in the last homework to produce a data pipeline that pulled
the unemployment rate from official BLS sources. Reuse that pipeline to
answer this final question in the homework:

> “Are unemployment claims in the US a moving average process? If so,
> how many periods are involved in that moving average?”

In your answer, consider two different scales for the time index that
you are evaluating:

1.  Consider the monthly unemployment (which is the resolution that you
    used in the last homework).
2.  Also consider the weekly unemployment.

Using the tools that you have available to you from the async and live
session, make an argument for whether the unemployment rate can be
described as a moving average process of some particular order.
