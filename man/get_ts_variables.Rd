% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/get_ts_variables.R
\name{get_ts_variables}
\alias{get_ts_variables}
\title{Get a vector of timeseries variable names}
\usage{
get_ts_variables(site = NULL, ...)
}
\arguments{
\item{site}{a valid mda.streams site (see \link{get_sites}) or NULL for all
sites}

\item{...}{additional arguments passed to \code{\link[sbtools]{session_check_reauth}},
  for example \code{username}}
}
\value{
an alphabetically sorted character vector of unique timeseries
  variable names for given sites
}
\description{
get_ts_variables() returns a list of all possible timeseries variables, while
get_ts_variables(site) returns the data available to a specific site.
}
\examples{
\dontrun{
get_ts_variables() #list all timeseries variable names
get_ts_variables(site = 'nwis_01018035')
}
}

