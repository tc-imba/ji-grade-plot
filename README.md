# JI Grade Plot

## Requirements

You only need `R` to run this program.

You need to install some packages in `R`:

```r
install.packages(c('data.table', 'dplyr', 'tidyr', 'ggplot2'))
```

## Running

The `example.csv` is used to generate `distribution.pdf`.

The `plot_grade` function's arguments are
+ data: a data.table
+ main: title
+ from: x axis min
+ to:   x axis max
+ at:   y axis of boxplot
+ bins: number of buckets
