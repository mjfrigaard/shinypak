# Separate columns (base)

A base R utility for splitting a column into two, used internally to
separate branch names into their `source` and `branch` parts.

## Usage

``` r
sep_cols(data, col, into, sep)
```

## Arguments

- data:

  data.frame or tibble

- col:

  column to split

- into:

  columns to split into

- sep:

  regex to split on

## Value

data with new columns
