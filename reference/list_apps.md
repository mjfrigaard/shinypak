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

1.  Clones the [`sap`](https://github.com/mjfrigaard/sap) repository
    from GitHub into a temporary directory

2.  Lists all branches of the cloned repository

3.  Separates each branch `name` into `source` and `branch`

4.  Filters the branches to those matching `regex`, if one is supplied

5.  Deletes the temporary directory (even if an earlier step fails)

## Examples

``` r
if (FALSE) { # interactive()
list_apps()
list_apps(regex = "tests")
}
```
