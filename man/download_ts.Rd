% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/download_ts.R
\name{download_ts}
\alias{download_ts}
\title{download timeseries data to local file destination}
\usage{
download_ts(site, variable, folder = tempdir(), ...)
}
\arguments{
\item{site}{a valid mda.streams site (see \link{get_sites})}

\item{variable}{a valid variable name for timeseries data (see \link{get_ts_variables})}

\item{folder}{string for a folder location}

\item{...}{additional arguments passed to \code{\link[sbtools]{session_check_reauth}}}
}
\value{
file handle for downloaded file
}
\description{
download a timeseries file to a user-specified (or temp file) location
}
\examples{
\dontrun{
download_ts(site = 'nwis_06893300', variable = 'doobs')
}
}
\author{
Corinna Gries, Jordan S Read, Luke A Winslow
}

