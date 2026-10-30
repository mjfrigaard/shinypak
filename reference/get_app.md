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

The path to the cloned app, invisibly. The function is called for its
side effects.

## Details

The branch is cloned into a temporary folder first. If the clone
succeeds and the directory for the branch already exists, the old copy
is replaced so you always get the latest commit. If the clone fails, the
existing copy is left untouched. After cloning, `get_app()` removes:

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

## Examples

``` r
if (FALSE) { # interactive()
get_app("02.2_movies-app")
}
```
