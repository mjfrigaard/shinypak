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

## Value

logical

## Examples

``` r
check_text_field("Package: shinypak \n Title: Getting your app into an R package",
"Package")
#> Error in check_text_field("Package: shinypak \n Title: Getting your app into an R package",     "Package"): could not find function "check_text_field"
check_text_field("Package: shinypak \n Title: Getting your app into an R package",
"Package", verbose = TRUE)
#> Error in check_text_field("Package: shinypak \n Title: Getting your app into an R package",     "Package", verbose = TRUE): could not find function "check_text_field"
```
