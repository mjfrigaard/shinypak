
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `shinyap`

<!-- badges: start -->
<!-- badges: end -->

The primary goal of `shinyap` is to provide easy access to the apps in
the [Shiny App-Packages](https://mjfrigaard.github.io/shiny-app-pkgs/)
book. `shinyap` also has functions for checking the files and folders in
a Shiny app-package.

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
#>                  branch        last_updated
#> 2     01_whole-app-game 2024-01-01 14:11:32
#> 1        02.1_shiny-app 2024-01-01 13:20:43
#> 4       02.2_movies-app 2024-01-04 11:54:24
#> 5         02.3_proj-app 2023-11-22 00:26:46
#> 6      03.1_description 2023-12-06 14:28:52
#> 7            03.2_rproj 2023-11-02 13:35:17
#> 8   03.3_create-package 2023-11-02 13:35:34
#> 9           04_devtools 2023-11-02 13:35:52
#> 10          05_roxygen2 2023-11-17 15:53:36
#> 11     06.1_pkg-exports 2023-11-17 15:54:17
#> 12     06.2_pkg-imports 2023-11-17 15:54:52
#> 13              07_data 2023-12-08 20:15:19
#> 14        08_launch-app 2023-11-17 15:56:49
#> 15        09.1_inst-www 2023-11-17 15:57:48
#> 16      09.2_inst-bslib 2023-11-21 10:14:32
#> 17        09.3_inst-dev 2023-11-17 15:59:04
#> 18       09.4_inst-prod 2023-11-18 05:51:27
#> 19       11_tests-specs 2023-11-18 06:30:29
#> 20  12.1_tests-fixtures 2023-11-18 06:31:06
#> 21   12.2_tests-helpers 2023-11-18 06:31:53
#> 22     13_tests-modules 2023-11-18 06:32:44
#> 23      14_tests-system 2023-11-21 10:08:21
#> 24            15_docker 2024-01-03 13:31:10
#> 25             18_golem 2023-11-18 06:36:02
#> 26        19_leprechaun 2023-11-10 13:35:13
#> 27             20_rhino 2023-12-30 21:49:09
#> 28       21.1_debugging 2023-11-18 06:39:47
#> 29       21.2_debugging 2023-11-18 06:40:34
#> 30       21.3_debugging 2023-11-18 06:41:07
#> 31       21.4_debugging 2023-11-18 06:41:46
#> 32       21.5_debugging 2023-11-18 06:42:23
#> 35   22_reactive-values 2023-11-18 06:44:24
#> 36         22_user-data 2023-11-18 08:06:19
#> 33 22.1_reactive-values 2023-11-18 06:44:24
#> 34       22.2_user-data 2023-11-18 08:06:19
#> 37   23_tests-snapshots 2023-11-18 06:35:09
#> 38       24_tests-mocks 2023-11-18 06:34:25
#> 39                 HEAD 2024-01-01 13:20:43
#> 40                 main 2023-11-22 00:17:49
#> 41      st_trace-matrix 2023-11-18 08:26:20
```

## Launch app (or app package)

Launch an application from any section in the book using:

``` r
launch(app = "02.3_proj-app")
```

<img src="man/figures/launch_readme.gif" width="100%" style="display: block; margin: auto;" />

[^1]: Check out the documentation for the [`credentials`
    package](https://docs.ropensci.org/credentials/articles/intro.html)

[^2]: Each of the apps in `shinyap` have a corresponding branch in the
    [moviesApp
    repo](https://github.com/mjfrigaard/moviesApp/branches/all).
