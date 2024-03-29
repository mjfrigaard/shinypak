% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_pkg_description.R
\name{is_pkg_description}
\alias{is_pkg_description}
\title{Check \code{DESCRIPTION} File for Package Fields}
\usage{
is_pkg_description(file, verbose = FALSE)
}
\arguments{
\item{file}{A character string specifying the path to the \code{DESCRIPTION} file.}

\item{verbose}{A logical parameter; if set to TRUE, detailed messages will
be displayed during the check.}
}
\value{
A logical value; \code{TRUE} if all required fields are present, \code{FALSE}
otherwise.
}
\description{
This function ensures that a \code{DESCRIPTION} file contains all of the necessary
fields for an R package in \href{https://cran.r-project.org/doc/manuals/R-exts.html#The-DESCRIPTION-file}{Writing R Extensions}.
}
\examples{
is_pkg_description(
     system.file("pkg", "DESCRIPTION",
                 package = "shinypak"))
is_pkg_description(
     system.file("pkg", "DESCRIPTION",
                 package = "shinypak"), verbose = TRUE)
}
\keyword{internal}
