## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include = FALSE----------------------------------------------
library(dialr)

## ---- warning = FALSE----------------------------------------------------
library(dialr)

x <- c(0, 0123, "0404 753 123", "61410123817", "+12015550123")

ph_valid(x, "AU")    # Is the phone number valid?
ph_possible(x, "AU") # Is the phone number possible?
ph_region(x, "AU")   # What region (ISO country code) is the phone number from?
ph_type(x, "AU")     # Is the phone number a fixed line, mobile etc.
ph_format(x, "AU")
ph_format(x, "AU", home = "AU")

