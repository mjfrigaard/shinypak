
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
#>    source               branch_name             updated
#> 1    <NA>                      main 2023-10-25 08:12:48
#> 2  origin             02_movies-app 2023-11-19 14:23:38
#> 3  origin               03_proj-app 2023-11-17 14:50:17
#> 4  origin            04_description 2023-11-02 13:35:02
#> 5  origin                  05_rproj 2023-11-02 13:35:17
#> 6  origin        06a_create-package 2023-11-02 13:35:34
#> 7  origin              06b_devtools 2023-11-02 13:35:52
#> 8  origin               07_roxygen2 2023-11-17 14:53:36
#> 9  origin           08a_pkg-exports 2023-11-17 14:54:17
#> 10 origin           08b_pkg-imports 2023-11-17 14:54:52
#> 11 origin                   09_data 2023-11-17 14:55:45
#> 12 origin             10_launch-app 2023-11-17 14:56:49
#> 13 origin              11a_inst-www 2023-11-17 14:57:48
#> 14 origin            11b_inst-bslib 2023-11-17 14:58:21
#> 15 origin              11c_inst-dev 2023-11-17 14:59:04
#> 16 origin             11d_inst-prod 2023-11-18 04:51:27
#> 17 origin           12a_tests-specs 2023-11-18 05:30:29
#> 18 origin        12b_tests-fixtures 2023-11-18 05:31:06
#> 19 origin         12c_tests-helpers 2023-11-18 05:31:53
#> 20 origin         12d_tests-modules 2023-11-18 05:32:44
#> 21 origin          12e_tests-system 2023-11-18 05:33:35
#> 22 origin           12f_tests-mocks 2023-11-18 05:34:25
#> 23 origin       12g_tests-snapshots 2023-11-18 05:35:09
#> 24 origin                    fw_gap 2023-11-18 05:36:02
#> 25 origin                    fw_lap 2023-11-10 12:35:13
#> 26 origin                    fw_rap 2023-11-06 14:55:08
#> 27 origin                      HEAD 2023-10-25 08:12:48
#> 28 origin                      main 2023-10-25 08:12:48
#> 29 origin   spec_topic-debugging-01 2023-11-18 05:39:47
#> 30 origin   spec_topic-debugging-02 2023-11-18 05:40:34
#> 31 origin   spec_topic-debugging-03 2023-11-18 05:41:07
#> 32 origin   spec_topic-debugging-04 2023-11-18 05:41:46
#> 33 origin   spec_topic-debugging-05 2023-11-18 05:42:23
#> 34 origin spec_topic-reactiveValues 2023-11-18 05:44:24
#> 35 origin   spec_topic-trace-matrix 2023-11-18 07:26:20
#> 36 origin       spec_topic-userData 2023-11-18 07:06:19
```

## Clone an app

``` r
get_app("app name")
```

## Launch an app (or app package)

``` r
launch_app("app name")
```

[^1]: Check out the documentation for the [`credentials`
    package](https://docs.ropensci.org/credentials/articles/intro.html)

[^2]: Each of the apps in `shinyap` have a corresponding branch in the
    [moviesApp
    repo](https://github.com/mjfrigaard/moviesApp/branches/all).
