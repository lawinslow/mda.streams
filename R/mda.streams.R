#' Functions for managing the Continental Stream Metabolism data on ScienceBase
#' 
#' mda.streams stands for Macro Data Analysis for Streams.
#' 
#' For lower-level functions generic to all ScienceBase tasks, see 
#' \pkg{sbtools}. For higher-level functions that make it easy to use the Powell
#' Center project data in particular, see \pkg{powstreams}.
#' 
#' 
#' @section Logging in:
#'   
#'   Use the \code{\link[sbtools]{authenticate_sb}} command from \pkg{sbtools} 
#'   to establish session credentials for working with ScienceBase.
#'   
#'   Use \code{\link{get_scheme}} and \code{\link{set_scheme}} to see/specify 
#'   the ScienceBase scheme to use. The default is "mda_streams", but another 
#'   option is "mda_streams_dev" for trial modifications to SB.
#'   
#' @section Navigating ScienceBase:
#'   
#'   \itemize{
#'   
#'   \item \code{\link{get_sites}} - lists all site IDs (e.g. "nwis_04067500") 
#'   that are currently on ScienceBase
#'   
#'   \item \code{\link{get_ts_variables}} - Given a site ID, returns a list of 
#'   timeseries variables stored for that site
#'   
#'   }
#'   
#'   
#' @section Reading data from ScienceBase:
#'   
#'   \itemize{
#'   
#'   \item \code{\link{download_ts}} - given a site ID and variable name, finds 
#'   and downloads the timeseries file from SB
#'   
#'   \item \code{\link{get_watershed_WFS}} - gets watershed geospatial data
#'   
#'   \item \code{\link{get_watershed_WMS}} - gets watershed geospatial data
#'   
#'   }
#'   
#'   
#' @section Preparing data to write to ScienceBase:
#'   
#'   
#'   \itemize{
#'   
#'   \item \code{\link{init_nwis_sites}} - generate a list of site IDs that meet
#'   data availability criteria
#'   
#'   }
#'   
#'   
#' @section Writing to ScienceBase:
#'   
#'   \itemize{
#'   
#'   \item \code{\link{create_site}} - given a site ID, create an SB node for 
#'   the site
#'   
#'   \item \code{\link{post_ts}} - given a data.frame with data, do a little 
#'   format checking and post those data to SB. Where would such data come from?
#'   
#'   \item \code{\link{post_watershed}} - given a vector of watershed filenames,
#'   posts those files to SB. Where do the files come from?
#'   
#'   }
#'   
#'   
#' @section Internal functions:
#'   
#'   \itemize{
#'   
#'   \item \code{build_data.R} - creates the data needed within the package
#'   
#'   \item \code{mda_helpers.R} - utilities used within the package. Includes 
#'   functions make_ts_name, parse_ts_name, make_site_name, and parse_site_name.
#'   
#'   }
#'   
#' @docType package
#' @name mda.streams
NULL