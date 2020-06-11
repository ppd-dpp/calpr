# Calendar Periods in R

## Description

A small R package for working with calendar periods (e.g., year-months, year-quarters) using base R dates. 

## Installation

```r
devtools::install_github("ppd-dpp/calpr")
```

## Examples

Consider the problem of taking a monthly price index and turning it into a quarterly index by averaging the index values for each month in a quarter. Index data are stored in a dataset called `data` that looks like this:

|date      |index|
|---       |---  |
|2017-01-01|100  |
|2017-02-01|102  |
|...       |...  |
|2019-12-01|130  |

The monthly index can easily be turned into a quarterly index as follows:

```r
aggregate(index ~ year_quarter(date), FUN = mean, data = data, subset = complete_quarters(date))
```

Despite needing to know the names of the variables in `data`, this one-liner is very flexible. It automatically drops quarters that don't have an index value for all three months in that quarter, and works if a monthly series does not start or end on a quarter, or is missing index values for certain months. Dates can also be formatted inconsistently as the first day of the month, or the last day, or any day in between, and are returned by default as the first day of the month. All these features mean that the same snippet of code can be consistently and safely reused without having to know anything more than that the index is a monthly series.

As another example, consider calculating the quarter-over-quarter change in an index. As with the previous example, this can be easily done as:

```r
data$qoq <- with(data, index / index[match(year_month(date, shift = -3), year_month(date))])
```

This approach to calculating a quarter-over-quarter change is quite robust; the index series does not need to be in chronological order, dates can be formatted inconsistently, there can be duplicate index values for a month, and the series can be missing index values for certain months. Very little needs to be known about the index series to safely calculate the quarter-over-quarter change.

As a final example, consider rebasing an index so that an entire year is the base period.

```r
data$index <- with(data, 100 * index / mean(index[year(date) == '2017-01-01' & complete_years_m(date)]))
```

The subtlety with this example is the use of `complete_years_m`, and it ensures that a year must have an index value for every month to be a suitable base period. As with the other examples, this snippet of code can easily be reused because its use requires little prior knowledge of an index series.

