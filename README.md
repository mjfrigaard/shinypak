
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `shinyap`

<!-- badges: start -->
<!-- badges: end -->

The goal of `shinyap` is to provide easy access to the apps in the
[Shiny App-Packages](https://mjfrigaard.github.io/shiny-app-pkgs/) book.

## Installation

You can install the development version of `shinyap` from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("mjfrigaard/shinyap")
```

``` r
library(shinyap)
```

## Git/GitHub configuration

`shinyap` uses the [`gert` package](https://docs.ropensci.org/gert/) for
Git/GitHub management (and assumes authentication was done automatically
using the `credentials` package).[^1]

## Available app-packages

To see a list of the available app-packages in `shinyap`, use
`list_apps()`[^2]

``` r
list_apps()
```

## Clone an app

``` r
clone_app("app name")
```

## Launch an app (or app package)

``` r
launch_app("app name")
```

## Update an app (or app-package)

To get the most recent version of an app-package, use `update_app()`

``` r
update_app("app name")
```

`update_app()`

[^1]: Check out the documentation for the [`credentials`
    package](https://docs.ropensci.org/credentials/articles/intro.html)

[^2]: Each of the apps in `shinyap` have a corresponding branch in the
    [moviesApp
    repo](https://github.com/mjfrigaard/moviesApp/branches/all).
