# Check `.Rproj` File for Package Fields

Checks an `.Rproj` file for the fields RStudio writes when a project is
configured with build tools: `BuildType`, `PackageUseDevtools`, and
`PackageInstallArgs`.

## Usage

``` r
is_pkg_rproj(file, verbose = FALSE)
```

## Arguments

- file:

  character string specifying the path to the `.Rproj` file.

- verbose:

  logical; if `TRUE`, detailed messages will be displayed

## Value

A logical value; `TRUE` if all fields are found, `FALSE` otherwise.

## Examples

``` r
is_pkg_rproj(system.file("pkg", "pkg.Rproj", package = "shinypak"),
             verbose = TRUE)
#> ✔ BuildType found!
#> ✔ PackageUseDevtools found!
#> ✔ PackageInstallArgs found!
#> [1] TRUE
is_pkg_rproj(system.file("pkg", "pkg.Rproj", package = "shinypak"))
#> [1] TRUE
```
