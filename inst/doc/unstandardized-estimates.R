## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE,
  eval = identical(Sys.getenv("IN_PKGDOWN"), "true")
)

library(plssem)

## -----------------------------------------------------------------------------
# m <- '
#   X =~ x1 + x2 + x3
#   Z =~ z1 + z2 + z3
#   Y =~ y1 + y2 + y3
# 
#   Y ~ X + Z + X:Z + X:X
# '
# 
# fit <- pls(m, modsem::oneInt, bootstrap = TRUE, boot.R = 100)
# summary(fit, unstandardized = TRUE)

## -----------------------------------------------------------------------------
# unstandardized_estimates(fit)

## -----------------------------------------------------------------------------
# # x1 is unstandardized
# subset(
#   unstandardized_estimates(fit, unstandardized = c("x1", "X")),
#   lhs == "X" | rhs == "X"
# )
# 
# # x1 is standardized
# subset(
#   unstandardized_estimates(fit, unstandardized = "X"),
#   lhs == "X" | rhs == "X"
# )

