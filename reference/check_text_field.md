# Check for fields in text file

Check for fields in text file

## Usage

``` r
check_text_field(file, field, verbose = FALSE)
```

## Arguments

- file:

  path to plain text file

- field:

  field in file

- verbose:

  logical; if `TRUE`, reports the check and its result via `cli`
  messages. Defaults to `FALSE`.

## Value

logical

## Examples

``` r
shinypak:::check_text_field("Package: shinypak \n Title: Shiny App Examples", "Package")
#> Warning: The `file` argument of `vroom()` must use `I()` for literal data as of vroom
#> 1.5.0.
#>   
#>   # Bad:
#>   vroom("X,Y\n1.5,2.3\n")
#>   
#>   # Good:
#>   vroom(I("X,Y\n1.5,2.3\n"))
#> ℹ The deprecated feature was likely used in the readr package.
#>   Please report the issue at <https://github.com/tidyverse/readr/issues>.
#> [1] TRUE
shinypak:::check_text_field("Package: shinypak \n Title: Shiny App Examples",
"Package", verbose = TRUE)
#> checking 'Package' field
#> ℹ 'Package' field found
#> ✔ 'Package' field found [7ms]
#> 
#> [1] TRUE
```
