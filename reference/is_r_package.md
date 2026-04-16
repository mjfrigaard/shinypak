# Check Directory for R Package Structure

This function checks a directory to ascertain if it has the required
files (`.Rproj` and `DESCRIPTION`) configured correctly for an R
package. It provides verbose output detailing which checks have passed
or failed.

## Usage

``` r
is_r_package(path, verbose = FALSE)
```

## Arguments

- path:

  A character string specifying the path to the directory to be checked.

- verbose:

  A logical parameter; if set to TRUE, detailed messages will be
  displayed during the check.

## Value

A logical value; `TRUE` if the directory contains a valid `DESCRIPTION`
file (and an optional `.Rproj` configured for package development),
`FALSE` otherwise.

## Details

This function wraps around `is_pkg_description` and `is_pkg_rproj`
functions to check both the `DESCRIPTION` and `.Rproj` files. If
`verbose` is `TRUE`, it will use `cli` package functions to alert the
user about the checks being performed and their results.

## Examples

``` r
is_r_package(
     system.file("pkg", package = "shinypak"),
     verbose = TRUE)
#> ✔ Package found!
#> ✔ Version found!
#> ✔ License found!
#> ✔ Description found!
#> ✔ Title found!
#> ✔ Author found!
#> ✔ Maintainer found!
#> ✔ '/home/runner/work/_temp/Library/shinypak/pkg' is an R package (DESCRIPTION found, no .Rproj)
#> [1] TRUE
is_r_package(
     system.file("app", package = "shinypak"),
     verbose = TRUE)
#> ✖ Package not in DESCRIPTION!
#> ✖ Version not in DESCRIPTION!
#> ✔ License found!
#> ✖ Description not in DESCRIPTION!
#> ✔ Title found!
#> ✔ Author found!
#> ✖ Maintainer not in DESCRIPTION!
#> ✖ '/home/runner/work/_temp/Library/shinypak/app' is not an R package (invalid DESCRIPTION, no .Rproj)
#> [1] FALSE
```
