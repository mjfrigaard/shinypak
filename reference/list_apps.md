# List Branches of the sap Repository

This function clones the 'sap' GitHub repository, extracts the list of
branches along with their last update time, and then returns this
information as a tibble. The repository is cloned to a temporary
directory, which is removed after the function executes.

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

The function operates in several steps:

1.  It saves the current working directory to revert back to it later

2.  It clones the ['sap'](https://github.com/mjfrigaard/sap) repository
    from GitHub into a temporary directory

3.  It lists all branches of the cloned repository

4.  It separates the branch `name`s into `source` and `branch_name`

5.  If `regex` is supplied, it filters branches to those matching the
    pattern

6.  It cleans up by deleting the temporary directory and restoring the
    original working directory

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
#>  9 05_roxygen2         2025-03-11 13:48:24
#> 10 06.1_exports        2025-03-11 13:49:18
#> # ℹ 32 more rows
list_apps(regex = "tests")
#> # A tibble: 1 × 2
#>   branch         last_updated       
#>   <chr>          <dttm>             
#> 1 14_tests_suite 2025-03-11 14:14:32
```
