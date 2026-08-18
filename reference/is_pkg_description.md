# Check `DESCRIPTION` File for Package Fields

Checks a `DESCRIPTION` file for the fields an R package requires:
`Package`, `Version`, `License`, `Description`, `Title`, `Author`, and
`Maintainer`. These are described in the [Writing R
Extensions](https://cran.r-project.org/doc/manuals/R-exts.html#The-DESCRIPTION-file)
manual.

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
