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
#> Error in is_pkg_rproj(system.file("pkg", "pkg.Rproj", package = "shinypak"),     verbose = TRUE): The .Rproj file '' does not exist. Please provide a valid file path.
is_pkg_rproj(system.file("pkg", "pkg.Rproj", package = "shinypak"))
#> Error in is_pkg_rproj(system.file("pkg", "pkg.Rproj", package = "shinypak")): The .Rproj file '' does not exist. Please provide a valid file path.
```
