# Clone a Specific Branch of the sap Repository and Optionally Open it

Clones a branch of the [`sap`](https://github.com/mjfrigaard/sap) GitHub
repository into the current working directory, then cleans it up: `.git`
files, `.DS_Store` files, and `.Rbuildignore` files are removed, and the
`.Rproj` file is renamed to match the branch. Set `open = TRUE` to open
the result in a new IDE session.

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

If the directory for the branch already exists, it's deleted and
re-cloned so you always get the latest commit. After cloning,
`get_app()` removes:

- The `.git` directory and files

- Any `.DS_Store` files

- Any `.Rbuildignore` files

It then renames the `.Rproj` file to match the cloned branch and, if
`open = TRUE`, opens the project.

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
