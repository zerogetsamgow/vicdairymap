#' Simple feature collection with 5 fields
#'
#' @format ## `dairy_region_map`

#' \describe{
#'   \item{region_name}{Region name}
#'   \item{geometry}{geometry}
#'   \item{is_dairy}{Logical denoting whether region is a dairy region}
#'   \item{cent_long}{Longitude of centroid}
#'   \item{cent_lat}{Latitude of centroid}
#'   ...
#' }
#' @source <https://www.vic.gov.au/regional-model-department-education>
"dairy_region_map"


#' Region Table
#'
#' A tibble of with 3 columns and 79 rows.
#'
#' @format ## `region_tbl`

#' \describe{
#'   \item{region_name}{Region name, with four values}
#'   \item{lga_name}{Local government area name, with 79 values}
#'   \item{is_dairy}{Logical denoting whether region is a dairy region}
#'   ...
#' }
#' @source <https://www.vic.gov.au/regional-model-department-education>
"dairy_region_tbl"


