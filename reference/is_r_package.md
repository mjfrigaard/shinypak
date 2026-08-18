# Check Directory for R Package Structure

Checks whether a directory has the files an R package needs (a valid
`DESCRIPTION`, and optionally an `.Rproj` configured for package
development). Set `verbose = TRUE` to see which checks passed and which
failed.

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

This is a wrapper around
[`is_pkg_description()`](https://mjfrigaard.github.io/shinypak/reference/is_pkg_description.md)
and
[`is_pkg_rproj()`](https://mjfrigaard.github.io/shinypak/reference/is_pkg_rproj.md),
which check the `DESCRIPTION` and `.Rproj` files respectively. When
`verbose` is `TRUE`, `cli` messages report each check and its result.

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
