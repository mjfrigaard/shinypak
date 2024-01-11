
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `shinypak`

<!-- badges: start -->
<!-- badges: end -->

The primary goal of `shinypak` is to provide easy access to the
applications in [`moviesApp`](https://github.com/mjfrigaard/moviesApp),
the example application for the [Shiny
App-Packages](https://mjfrigaard.github.io/shiny-app-pkgs/) book.

`shinypak` also has functions for checking the files and folders in a
Shiny app-package.

## Installation

You can install the development version of `shinypak` from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("mjfrigaard/shinypak")
```

``` r
library(shinypak)
```

## Git/GitHub configuration

`shinypak` uses the [`gert` package](https://docs.ropensci.org/gert/)
for Git/GitHub management (and assumes authentication was done
automatically using the `credentials` package).[^1]

## Available app-packages

The example applications are stored in the
[branches](https://github.com/mjfrigaard/moviesApp/branches/all) of the
`moviesApp` repo. To see a list of the available app-packages, use
`list_apps()`[^2]

``` r
list_apps()
#>                  branch        last_updated
#> 2     01_whole-app-game 2024-01-01 14:11:32
#> 1        02.1_shiny-app 2024-01-04 13:05:58
#> 4       02.2_movies-app 2024-01-04 13:07:59
#> 5         02.3_proj-app 2024-01-04 13:08:58
#> 6      03.1_description 2024-01-04 13:10:00
#> 7            03.2_rproj 2024-01-04 13:25:06
#> 8   03.3_create-package 2024-01-04 13:29:41
#> 9           04_devtools 2024-01-04 13:30:48
#> 10          05_roxygen2 2024-01-04 13:04:01
#> 11     06.1_pkg-exports 2024-01-04 13:34:20
#> 12     06.2_pkg-imports 2024-01-04 13:35:38
#> 13              07_data 2024-01-04 13:37:37
#> 14        08_launch-app 2024-01-04 13:38:35
#> 15        09.1_inst-www 2024-01-04 13:39:48
#> 16      09.2_inst-bslib 2024-01-04 13:40:43
#> 17        09.3_inst-dev 2024-01-04 13:41:55
#> 18       09.4_inst-prod 2024-01-04 13:42:51
#> 19       11_tests-specs 2024-01-04 13:43:52
#> 20  12.1_tests-fixtures 2024-01-04 13:44:58
#> 21   12.2_tests-helpers 2024-01-04 13:45:57
#> 22     13_tests-modules 2024-01-04 13:47:00
#> 23      14_tests-system 2024-01-04 13:49:46
#> 24            15_docker 2024-01-05 12:31:47
#> 25      16.1_cicd-style 2024-01-10 22:54:15
#> 26      16.2_cicd-shiny 2024-01-10 23:17:33
#> 27             18_golem 2024-01-04 13:54:56
#> 28        19_leprechaun 2024-01-04 13:55:57
#> 29             20_rhino 2024-01-04 13:57:52
#> 30       21.1_debugging 2024-01-04 13:59:02
#> 31       21.2_debugging 2024-01-04 13:59:56
#> 32       21.3_debugging 2024-01-04 14:00:50
#> 33       21.4_debugging 2024-01-04 14:01:41
#> 34       21.5_debugging 2024-01-04 14:02:27
#> 37   22_reactive-values 2023-11-18 06:44:24
#> 38         22_user-data 2023-11-18 08:06:19
#> 35 22.1_reactive-values 2024-01-04 14:03:30
#> 36       22.2_user-data 2024-01-04 14:04:20
#> 39   23_tests-snapshots 2024-01-04 14:05:08
#> 40       24_tests-mocks 2024-01-04 14:06:06
#> 41                 HEAD 2024-01-04 13:05:58
#> 42                 main 2023-11-22 00:17:49
#> 43      st_trace-matrix 2024-01-04 14:07:07
```

## Launching apps and app-packages

Launch an application from any section in the book using:

``` r
launch(app = "02.3_proj-app")
```

<img src="man/figures/launch_readme.gif" width="100%" style="display: block; margin: auto;" />

[^1]: Check out the documentation for the [`credentials`
    package](https://docs.ropensci.org/credentials/articles/intro.html)

[^2]: Each of the apps in `shinypak` have a corresponding chapter in
    [Shiny App-Packages](https://mjfrigaard.github.io/shiny-app-pkgs/)
    and branch in the [moviesApp
    repo](https://github.com/mjfrigaard/moviesApp/branches/all).
