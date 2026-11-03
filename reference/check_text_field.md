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
pkg_rproj <- system.file("pkg", "pkg.Rproj", package = "shinypak")
shinypak:::check_text_field(pkg_rproj, "BuildType")
#> [1] TRUE
shinypak:::check_text_field(pkg_rproj, "BuildType", verbose = TRUE)
#> checking 'BuildType' field
#> ℹ 'BuildType' field found
#> ✔ 'BuildType' field found [9ms]
#> 
#> [1] TRUE
```
