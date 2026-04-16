# Topic lookup table for the sap repository

Maps each branch of the [`sap`](https://github.com/mjfrigaard/sap)
GitHub repository to its book part and chapter in the [Shiny
App-Packages book](https://mjfrigaard.github.io/shiny-app-pkgs/).

## Usage

``` r
topic_lookup
```

## Format

A data frame with 40 rows and 3 columns:

- branch:

  Character. The branch name (e.g., `"05_roxygen2"`).

- part:

  Character. The book part the branch belongs to (e.g.,
  `"App-packages"`, `"Tests"`, `"Deploy"`, `"Frameworks"`,
  `"Shiny & LLMs"`).

- chapter:

  Character. The chapter topic (e.g., `"Documentation"`).

## Source

<https://github.com/mjfrigaard/sap>
