
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
#>                      branch        last_updated
#> 2         01_whole-app-game 2024-01-17 12:30:27
#> 1            02.1_shiny-app 2024-01-17 12:35:35
#> 4           02.2_movies-app 2024-01-17 12:37:19
#> 5             02.3_proj-app 2024-01-17 12:39:28
#> 6          03.1_description 2024-01-17 12:40:11
#> 7                03.2_rproj 2024-01-17 12:41:14
#> 8       03.3_create-package 2024-01-17 12:42:45
#> 9               04_devtools 2024-01-17 12:44:38
#> 10              05_roxygen2 2024-01-17 12:45:34
#> 11         06.1_pkg-exports 2024-01-17 12:46:25
#> 12         06.2_pkg-imports 2024-01-17 12:47:55
#> 13                  07_data 2024-01-18 11:17:13
#> 14            08_launch-app 2024-01-17 13:46:38
#> 15            09.1_inst-www 2024-01-17 13:47:20
#> 16          09.2_inst-bslib 2024-01-17 13:48:37
#> 17            09.3_inst-dev 2024-01-17 13:49:44
#> 18           09.4_inst-prod 2024-01-17 13:50:27
#> 19           11_tests-specs 2024-01-17 13:45:33
#> 20      12.1_tests-fixtures 2024-01-17 13:54:42
#> 21       12.2_tests-helpers 2024-01-17 13:55:58
#> 22         13_tests-modules 2024-01-17 14:05:39
#> 23          14_tests-system 2024-01-17 14:10:43
#> 24                15_docker 2024-01-17 14:14:42
#> 25          16.1_cicd-style 2024-01-17 14:18:40
#> 26          16.2_cicd-shiny 2024-01-17 14:23:25
#> 27         16.3_cicd-docker 2024-01-17 22:04:03
#> 28                 17_golem 2024-01-17 14:49:00
#> 29            18_leprechaun 2024-01-18 10:59:53
#> 30                 19_rhino 2024-02-13 00:04:59
#> 31                   20_css 2024-02-12 21:36:02
#> 32                    21_js 2024-02-12 21:45:16
#> 35                22_python 2024-02-12 21:43:57
#> 33     22.1_reactive-values 2024-01-04 14:03:30
#> 34           22.2_user-data 2024-01-04 14:04:20
#> 41       23_tests-snapshots 2024-01-15 12:13:33
#> 36         23.1_debug-error 2024-02-13 04:29:39
#> 37 23.2_debug-selected_vars 2024-01-15 10:29:25
#> 38    23.3_debug-var_inputs 2024-01-15 10:25:12
#> 39  23.4_debug-scatter_plot 2024-01-15 10:21:58
#> 40         23.5_debug-print 2024-01-15 10:04:21
#> 42              24_app-data 2024-02-12 23:29:44
#> 43           24_tests-mocks 2024-01-04 14:06:06
#> 44      A_G-mocks-snapshots 2024-01-15 12:13:33
#> 45                     HEAD 2024-01-17 12:35:35
#> 46                     main 2023-11-22 00:17:49
#> 47          st_trace-matrix 2024-01-04 14:07:07
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
