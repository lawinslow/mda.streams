% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/config_to_metab.R
\name{config_to_metab}
\alias{config_to_metab}
\title{Actually run the model as specified by the configuration arguments}
\usage{
config_to_metab(model, site, doobs.type, doobs.src, disch.type, disch.src,
  wtr.type, wtr.src, config, row = 1)
}
\arguments{
\item{model}{model name shorthand, e.g. "simple"}

\item{site}{site name}

\item{doobs.type}{doobs data type}

\item{doobs.src}{doobs data src}

\item{disch.type}{disch data type}

\item{disch.src}{disch data src}

\item{wtr.type}{wtr data type}

\item{wtr.src}{wtr data src}

\item{config}{data.frame, or file/filename to read a data.frame from. As an
alternative to all preceding arguments, this single config argument may be
passed in. The data.frame columns must correspond precisely to the list of
preceding arguments.}

\item{row}{integer. The row number of the config data.frame to use for this
particular model run.}
}
\description{
Actually run the model as specified by the configuration arguments
}
\examples{
suppressWarnings(config_to_metab(
  model="metab_mle", site=NA, doobs.type=NA, doobs.src=NA,
  disch.type=NA, disch.src=NA, wtr.type=NA, wtr.src=NA))
suppressWarnings(config_to_metab(config=data.frame(
  model="metab_mle", site=NA, doobs.type=NA, doobs.src=NA,
  disch.type=NA, disch.src=NA, wtr.type=NA, wtr.src=NA)))
suppressWarnings(config_to_metab(config=stage_metab_config(
  tag="0.0.1", strategy="try stage_metab_config",
  site="nwis_04087142", filename=NULL)))
\dontrun{
config_to_metab(
  model="metab_mle", site=NA, doobs.type=NA, doobs.src=NA,
  disch.type=NA, disch.src=NA, wtr.type=NA, wtr.src=NA)
config_to_metab(config=stage_metab_config(
  tag="0.0.1", strategy="try stage_metab_config",
  site="nwis_04087142", filename=NULL))
}
}

