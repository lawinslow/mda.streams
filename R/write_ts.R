
#'@title write timeseries format compressed file
#'@param data unitted data.frame
#'@param site the full site name (e.g., 'nwis_06893820')
#'@param variable the variable name of the output
#'@param folder the folder to write the file in
#'@keywords internal
#'@export
write_ts <- function(data, site, variable, folder){
  
  if (!verify_ts(data, variable))
    stop('timeseries input for site',site,'and variable',varible,'is not valid')
  
  if (nrow(data) == 0)
    invisible(NULL)
  
  ts_name <- make_ts_name(variable)
  
  fpath <- file.path(folder, sprintf('%s-%s.%s.gz', site, ts_name, pkg.env$ts_extension))
  gz_con <- gzfile(fpath, "w")
  write_unitted(data,  file = gz_con, sep=pkg.env$ts_delim)
  close(gz_con)
  invisible(fpath)
}