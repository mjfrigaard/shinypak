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
check_text_field("Package: shinypak \n Title: Shiny App Examples", "Package")
#> Error in check_text_field("Package: shinypak \n Title: Shiny App Examples",     "Package"): could not find function "check_text_field"
check_text_field("Package: shinypak \n Title: Shiny App Examples",
"Package", verbose = TRUE)
#> Error in check_text_field("Package: shinypak \n Title: Shiny App Examples",     "Package", verbose = TRUE): could not find function "check_text_field"
```
