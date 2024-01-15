
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
#> 2         01_whole-app-game 2024-01-12 08:33:14
#> 1            02.1_shiny-app 2024-01-11 16:02:26
#> 4           02.2_movies-app 2024-01-12 08:34:39
#> 5             02.3_proj-app 2024-01-12 08:35:02
#> 6          03.1_description 2024-01-12 08:35:20
#> 7                03.2_rproj 2024-01-12 08:35:39
#> 8       03.3_create-package 2024-01-12 08:35:57
#> 9               04_devtools 2024-01-12 08:36:49
#> 10              05_roxygen2 2024-01-12 08:37:05
#> 11         06.1_pkg-exports 2024-01-12 08:37:21
#> 12         06.2_pkg-imports 2024-01-12 08:37:45
#> 13                  07_data 2024-01-12 08:38:49
#> 14            08_launch-app 2024-01-12 08:39:15
#> 15            09.1_inst-www 2024-01-12 08:39:38
#> 16          09.2_inst-bslib 2024-01-12 11:01:12
#> 17            09.3_inst-dev 2024-01-12 11:01:46
#> 18           09.4_inst-prod 2024-01-12 11:02:43
#> 19           11_tests-specs 2024-01-12 11:03:06
#> 20      12.1_tests-fixtures 2024-01-12 11:03:30
#> 21       12.2_tests-helpers 2024-01-12 11:03:54
#> 22         13_tests-modules 2024-01-12 11:04:16
#> 23          14_tests-system 2024-01-15 10:51:05
#> 24                15_docker 2024-01-12 11:05:06
#> 25          16.1_cicd-style 2024-01-12 11:05:45
#> 26          16.2_cicd-shiny 2024-01-12 11:06:57
#> 27         16.3_cicd-docker 2024-01-12 14:03:23
#> 28            17_code-tools 2024-01-15 11:26:50
#> 29                 18_golem 2024-01-12 11:07:56
#> 30            19_leprechaun 2024-01-12 11:08:27
#> 31                 20_rhino 2024-01-12 15:31:27
#> 32         21.1_debug-error 2024-01-15 10:34:07
#> 33 21.2_debug-selected_vars 2024-01-15 10:29:25
#> 34    21.3_debug-var_inputs 2024-01-15 10:25:12
#> 35  21.4_debug-scatter_plot 2024-01-15 10:21:58
#> 36         21.5_debug-print 2024-01-15 10:04:21
#> 37     22.1_reactive-values 2024-01-04 14:03:30
#> 38           22.2_user-data 2024-01-04 14:04:20
#> 39       23_tests-snapshots 2024-01-15 12:13:33
#> 40           24_tests-mocks 2024-01-04 14:06:06
#> 41                     HEAD 2024-01-11 16:02:26
#> 42                     main 2023-11-22 00:17:49
#> 43          st_trace-matrix 2024-01-04 14:07:07
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
