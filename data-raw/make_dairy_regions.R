## code to prepare `make_dairy_regions` dataset goes here

library(tidyverse)
# Read table of regions, areas, and lgas from departmental website
dairy_region_tbl =
  read_csv("./data-raw/dairy_regions.csv")

usethis::use_data(dairy_region_tbl, overwrite = TRUE)

# Get lga sf objects using read_absmap
lga_map =
  strayr::read_absmap(
    "lga2021",
    remove_year_suffix = TRUE) |>
  dplyr::filter(
    state_code == 2) |>
  dplyr::mutate(
    lga_name = str_remove(lga_name,"\\s\\(.*\\)"),
    lga_name = str_replace(lga_name,"Moreland","Merri-bek"))

# Create dairy_region_map
dairy_region_map =
  dairy_region_tbl |>
  dplyr::right_join(lga_map) |>
  sf::st_as_sf()  |>
  dplyr::group_by(region_name, is_dairy) |>
  dplyr::summarise() |>
  dplyr::group_by(region_name, is_dairy) |>
  dplyr::summarise()

# Add cent_lat and cent_long variables

dairy_region_map =
  dplyr::bind_cols(
    dairy_region_map,
    dairy_region_map |>
      dplyr::group_by(region_name, is_dairy) |>
      # Centroid
      sf::st_centroid() |>
      # Get coordinates
      sf::st_coordinates() |>
      tibble::as_tibble() |>
      dplyr::rename("cent_long"=X,"cent_lat"=Y))

# Save to data
usethis::use_data(dairy_region_map, overwrite = TRUE)

