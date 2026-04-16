# Clone a Specific Branch of the sap Repository and Optionally Open it

Clones a specified branch of the `sap` GitHub repository into the
current working directory. It cleans the cloned directory by removing
`.git` files, `.DS_Store`, and `.Rbuildignore` files, optionally renames
the R project file, and optionally opens it in a new IDE session.

## Usage

``` r
get_app(app = "main", open = FALSE)
```

## Arguments

- app:

  The name of the branch to be cloned as a character string. If not
  specified, defaults to "main".

- open:

  A logical parameter, when set to `TRUE`, the function will attempt to
  open the project directory in a new session using
  [`rstudioapi::openProject`](https://rstudio.github.io/rstudioapi/reference/projects.html).
  Defaults to `FALSE`.

## Value

Invisible `NULL`. The function is called for its side effects.

## Details

If the directory for the branch already exists, it is deleted and
re-cloned to ensure the latest version is present. After cloning, the
function performs cleanup operations:

- Deletes `.git` directory and files.

- Removes `.DS_Store` files.

- Deletes any `.Rbuildignore` files present. It then renames the R
  project file to match the name of the cloned branch and, if specified,
  opens the project in RStudio.

## Note

- The
  [`rstudioapi::openProject`](https://rstudio.github.io/rstudioapi/reference/projects.html)
  function works in RStudio and Positron. The project directory is
  passed directly, so no `.Rproj` file is required.

- The working directory is temporarily changed during the function's
  execution but is reset at the end.

## Examples

``` r
# get_app("02_movies-app")
```
