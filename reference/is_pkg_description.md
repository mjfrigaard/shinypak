# Check `DESCRIPTION` File for Package Fields

This function ensures that a `DESCRIPTION` file contains all of the
necessary fields for an R package in [Writing R
Extensions](https://cran.r-project.org/doc/manuals/R-exts.html#The-DESCRIPTION-file).

## Usage

``` r
is_pkg_description(file, verbose = FALSE)
```

## Arguments

- file:

  A character string specifying the path to the `DESCRIPTION` file.

- verbose:

  A logical parameter; if set to TRUE, detailed messages will be
  displayed during the check.

## Value

A logical value; `TRUE` if all required fields are present, `FALSE`
otherwise.

## Examples

``` r
is_pkg_description(
     system.file("pkg", "DESCRIPTION",
                 package = "shinypak"))
#> [1] TRUE
is_pkg_description(
     system.file("pkg", "DESCRIPTION",
                 package = "shinypak"), verbose = TRUE)
#> ✔ Package found!
#> ✔ Version found!
#> ✔ License found!
#> ✔ Description found!
#> ✔ Title found!
#> ✔ Author found!
#> ✔ Maintainer found!
#> [1] TRUE
```
