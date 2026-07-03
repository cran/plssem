## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = identical(Sys.getenv("IN_PKGDOWN"), "true")
)

library(plssem)

## ----syntax-------------------------------------------------------------------
# m <- '
#   X =~ x1 + x2 + x3
#   Z =~ z1 + z2 + z3
#   Y =~ y1 + y2 + y3
# 
#   Y ~ X + Z + X:Z
# '

## ----boot-windows, eval = FALSE-----------------------------------------------
# fit_ms <- pls(
#   m,
#   data          = oneIntOrdered,
#   ordered       = colnames(oneIntOrdered),
#   bootstrap     = TRUE,
#   boot.R        = 500,
#   boot.ncores   = 2,
#   boot.parallel = "multisession",
#   boot.iseed    = 123
# )
# summary(fit_ms)

## ----boot-linux, eval = FALSE-------------------------------------------------
# fit_linux <- pls(
#   m,
#   data          = oneIntOrdered,
#   ordered       = colnames(oneIntOrdered),
#   bootstrap     = TRUE,
#   boot.R        = 500,
#   boot.ncores   = 2,
#   boot.parallel = "multicore",
#   boot.iseed    = 123
# )
# summary(fit_linux)

