#'@title stage ndlas data into a time series file
#'@description get data from nldas and return a file handle
#'
#'@param sites a character vector of valid NWIS site IDs
#'@param variable_name short name of variable \code{\link{get_ts_variables}}
#'@param times a length 2 vector of POSIXct dates
#'@param ... additional arguments passed to \code{\link[geoknife]{geoknife}}
#'@return a file handle for time series file created 
#'@importFrom geoknife simplegeom webdata geoknife loadOutput
#'@importFrom dataRetrieval readNWISsite
#'@importFrom unitted u
#'
#'@examples
#'\dontrun{
#'file <- stage_nldas_ts(sites = c("nwis_06893820","nwis_01484680"), variable_name = "baro", 
#'                 times = c('2014-01-01','2014-02-01'))
#'}
#'@export
stage_nldas_ts <- function(sites, variable_name, times, ...){
  
  if (length(variable_name) > 1) 
    stop ('variable_name must be single value.')
  
  nwis_sites <- split_site(sites)
  site_data <- readNWISsite(nwis_sites)
  
  lon_lat <- matrix(data = NA, ncol = length(sites), nrow = 2)
  for (i in 1:length(sites)){
    location <- filter(site_data, site_no == nwis_sites[i]) %>%
      select(dec_lat_va, dec_long_va) %>% 
      summarize(lon = mean(dec_long_va, na.rm = T), dlat = mean(dec_lat_va, na.rm = T))
    lon_lat[1:2, i]  = as.numeric(location)

  }
  lon_lat_df <- as.data.frame(lon_lat)
  names(lon_lat_df) <- sites
  
  p_code <- get_var_codes(variable_name)
  
  stencil <- simplegeom(lon_lat_df)
  fabric <- webdata('nldas', variables = p_code, times = times)
  
  job <- geoknife(stencil, fabric, wait = TRUE, ...)
  data_out <- loadOutput(job, with.units = TRUE)
  
  file_handles <- c()
  for (i in 1:length(sites)){
    site_data <- select(data_out, DateTime, matches(sites[i]), variable, units) %>%
      filter(variable == p_code) %>%
      select(-variable)
    
    units <- unique(site_data$units)
    site_data <- select(site_data, -units)
    names(site_data) <- c('DateTime',p_code)
    site_data <- u(site_data, c(NA, units))
    file_handle <- sprintf('%s_%s.tsv',site,ts_name)
    write_unitted(site_data, file = file_handle, ...)
    file_handles <- c(file_handles, file_handle)
    #file_handle <- write.unitted(site_df)
    #file_handles <- c(file_handles, file_handle)
  }
  return(file_handles)
}