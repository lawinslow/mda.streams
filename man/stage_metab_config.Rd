% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/stage_metab_config.R
\name{stage_metab_config}
\alias{stage_metab_config}
\title{Write a table (tsv) of configuration information for individual metabolism
modeling jobs (one row/job per site-strategy combination). This tsv should
reflect the full information needed to re-run a set of jobs. The jobs will
probably, but not necessarily, be run on a Condor cluster.}
\usage{
stage_metab_config(tag, strategy, date = Sys.time(), model = "metab_mle",
  site = choose_sites(c("doobs", "disch", "wtr")),
  doobs = choose_data_source("doobs", site),
  disch = choose_data_source("disch", site), wtr = choose_data_source("wtr",
  site), filename = "./condor_config.tsv")
}
\arguments{
\item{tag}{character of form "1.0.2" that uniquely identifies this set of
modeling runs.}

\item{strategy}{character, or vector of length sites, describing this set of
modeling runs in concise English.}

\item{date}{POSIXct indicating the date of config construction. It is
strongly recommended to use the default.}

\item{model}{character. the name of the metabolism model to construct}

\item{site}{site names}

\item{doobs}{2-column data.frame with names "type" and "src" describing where
DO data should come from}

\item{disch}{2-column data.frame with names "type" and "src" describing where
discharge data should come from}

\item{wtr}{2-column data.frame with names "type" and "src" describing where
water temperature data should come from}

\item{filename}{character or NULL. If NULL, the function returns a
data.frame, otherwise it writes that data.frame to the file specified by
filename.}
}
\value{
file name of the config file
}
\description{
Write a table (tsv) of configuration information for individual metabolism
modeling jobs (one row/job per site-strategy combination). This tsv should
reflect the full information needed to re-run a set of jobs. The jobs will
probably, but not necessarily, be run on a Condor cluster.
}
\examples{
\dontrun{
head(stage_metab_config(tag="0.0.1", strategy="test write_metab_config", filename=NULL))
stage_metab_config(tag="0.0.1", strategy="try stage_metab_config",
  site="nwis_04087142", filename=NULL)
  }
}

