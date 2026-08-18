# Inverted version of `%in%`

Returns `TRUE` for elements of `x` that are *not* in `table`.

## Usage

``` r
x %nin% table
```

## Examples

``` r
1 %nin% 1:10
#> [1] FALSE
"A" %nin% 1:10
#> [1] TRUE
```
