# List Branches of the sap Repository

Clones the [`sap`](https://github.com/mjfrigaard/sap) GitHub repository
to a temporary directory, then returns its branches and their last
update times as a data frame. The temporary directory is removed before
the function returns, so nothing is left in your working directory.

## Usage

``` r
list_apps(regex = NULL)
```

## Arguments

- regex:

  An optional character string containing a regular expression (regex)
  to filter branch names

## Value

A data frame with two columns: `branch` (the branch name) and
`last_updated` (the date the branch was last updated), ordered
alphabetically by branch name. Branches named `HEAD`, `main`, and
`gh-pages` are excluded.

## How it works

1.  Saves the current working directory so it can be restored later

2.  Clones the [`sap`](https://github.com/mjfrigaard/sap) repository
    from GitHub into a temporary directory

3.  Lists all branches of the cloned repository

4.  Separates each branch `name` into `source` and `branch`

5.  Filters the branches to those matching `regex`, if one is supplied

6.  Deletes the temporary directory and restores the original working
    directory

## Examples

``` r
list_apps()
#> # A tibble: 42 × 2
#>    branch              last_updated       
#>    <chr>               <dttm>             
#>  1 01_whole-app-game   2025-03-11 13:28:36
#>  2 02.1_shiny-app      2025-03-11 13:30:37
#>  3 02.2_movies-app     2025-03-11 13:42:22
#>  4 02.3_proj-app       2025-03-11 13:43:18
#>  5 03.1_description    2025-03-11 13:44:18
#>  6 03.2_rproj          2025-03-11 13:44:55
#>  7 03.3_create-package 2025-03-11 13:45:29
#>  8 04_devtools         2025-03-11 13:46:59
#>  9 05_roxygen2         2026-06-19 19:02:42
#> 10 06.1_exports        2026-06-19 18:45:37
#> # ℹ 32 more rows
list_apps(regex = "tests")
#> # A tibble: 1 × 2
#>   branch         last_updated       
#>   <chr>          <dttm>             
#> 1 14_tests_suite 2026-06-19 18:45:45
```
