
#' Get ISO country code
#' 
#' Get [ISO country code][dialr-region] from a country name.
#'
#' @param country A character vector of country names.
#' @return A vector of [ISO country codes][dialr-region] (`NA` where not found).
#' @examples
#' get_cc("Australia")
#' get_cc(c("Australia", "China", "United states"))
#' @export
get_cc <- function(country) {
  country <- toupper(country)

  as.vector(sapply(country,
                   function(d) {
                     if (d %in% names(cc_lookup)) {
                       cc_lookup[[d]]
                     } else {
                       NA_character_
                     }
                   }))
}

#' Check ISO country code
#' 
#' Check whether an [ISO country code][dialr-region] is valid.
#'
#' @param country A character vector of [ISO country codes][dialr-region].
#' @return A logical vector flagging which elements are valid codes.
#' @examples
#' check_cc(c("AU", "US", "CN", "WRONG", NA))
#' @export
check_cc <- function(country) {
  country %in% cc_lookup
}

# internal country code existence check - throws error if not found
validate_cc <- function(country) {
  chk <- check_cc(country)
  if (any(!chk)) stop("invalid country codes: ",
                      paste0(unique(country[!chk]), collapse = ", "),
                      call. = FALSE)
  NULL
}

