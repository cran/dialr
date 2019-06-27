## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include = FALSE----------------------------------------------
library(dialr)
# load dplyr here to avoid mask warnings
library(dplyr, warn.conflicts = FALSE)

## ------------------------------------------------------------------------
library(dialr)

# Parse phone number vector
x <- c(0, 0123, "0404 753 123", "61410123817", "+12015550123")
x <- phone(x, "AU")

is.phone(x)
print(x)

## ------------------------------------------------------------------------
is_parsed(x)    # Was the phone number successfully parsed?
is_valid(x)     # Is the phone number valid?
is_possible(x)  # Is the phone number possible?
get_region(x)   # What region (ISO country code) is the phone number from?
get_type(x)     # Is the phone number a fixed line, mobile etc.

## ------------------------------------------------------------------------
phone("0404 753 123", "AU") == phone("+61404753123", "US")
phone("0404 753 123", "AU") == phone("0404 753 123", "US")
phone("0404 753 123", "AU") != phone("0404 753 123", "US")

## ------------------------------------------------------------------------
phone("0404 753 123", "AU") == c("+61404753123", "0404 753 123")

## ------------------------------------------------------------------------
is_match(phone("0404 753 123", "AU"), c("+61404753123", "0404753123", "1234"))
is_match(phone("0404 753 123", "AU"), c("+61404753123", "0404753123", "1234"), detailed = TRUE)
is_match(phone("0404 753 123", "AU"), c("+61404753123", "0404753123", "1234"), strict = FALSE)

## ------------------------------------------------------------------------
x <- phone(c(0, 0123, "0404 753 123", "61410123817", "+12015550123"), "AU")

format(x, format = "RFC3966")
format(x, format = "RFC3966", clean = FALSE)

format(x, format = "E164", clean = FALSE)
format(x, format = "NATIONAL", clean = FALSE)
format(x, format = "INTERNATIONAL", clean = FALSE)
format(x, format = "RFC3966", clean = FALSE)

# Change the default
getOption("dialr.format")
format(x)
options(dialr.format = "NATIONAL")
format(x)
options(dialr.format = "E164")

## ------------------------------------------------------------------------
format(x, home = "AU")
format(x, home = "US")
format(x, home = "JP")

## ------------------------------------------------------------------------
format(x)
format(x, strict = TRUE)

## ------------------------------------------------------------------------
as.character(x)
as.character(x, raw = FALSE)

## ------------------------------------------------------------------------
# Use with dplyr
library(dplyr)

y <- tibble(id = 1:4,
            phone1 = c(0, 0123, "0404 753 123", "61410123817"),
            phone2 = c("03 9388 1234", 1234, "+12015550123", 0),
            country = c("AU", "AU", "AU", "AU"))

y %>%
  mutate_at(vars(matches("^phone")), ~phone(., country)) %>%
  mutate_at(vars(matches("^phone")),
            list(valid = is_valid,
                 region = get_region,
                 type = get_type,
                 clean = format))

