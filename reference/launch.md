# Launch a Shiny App from the sap Repository

Downloads (if needed) and launches a Shiny application from the
[`sap`](https://github.com/mjfrigaard/sap) GitHub repository. How the
app is launched depends on what the branch contains: if the directory is
an R package, it's loaded with
[`pkgload::load_all()`](https://pkgload.r-lib.org/reference/load_all.html)
and run with
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html). Plain
Shiny apps (those without a `DESCRIPTION`) are run directly with
[`shiny::shinyAppDir()`](https://rdrr.io/pkg/shiny/man/shinyApp.html).

## Usage

``` r
launch(app)
```

## Arguments

- app:

  A character string giving the branch name of the application to launch
  (e.g., `"02.3_proj-app"` or `"05_roxygen2"`).

## Value

Called for its side effects (launches the Shiny app). Returns
`invisible(NULL)`.

## Examples

``` r
# launch("02.1_movies-app")
# launch("05_roxygen2")
```
