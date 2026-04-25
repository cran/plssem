## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(plssem)

## ----syntax-------------------------------------------------------------------
m <- '
  X =~ x1 + x2 + x3
  Z =~ z1 + z2 + z3
  Y =~ y1 + y2 + y3

  Y ~ X + Z + X:Z
'

## ----boot-windows, eval = FALSE-----------------------------------------------
# fit_win <- pls(
#   m,
#   data          = oneIntOrdered,
#   ordered       = colnames(oneIntOrdered),
#   bootstrap     = TRUE,
#   boot.R        = 500,
#   boot.ncpus    = 2,
#   boot.parallel = "snow",
#   boot.iseed    = 123
# )
# summary(fit_win)

## ----boot-linux, eval = FALSE-------------------------------------------------
# fit_linux <- pls(
#   m,
#   data          = oneIntOrdered,
#   ordered       = colnames(oneIntOrdered),
#   bootstrap     = TRUE,
#   boot.R        = 500,
#   boot.ncpus    = 2,
#   boot.parallel = "multicore",
#   boot.iseed    = 123
# )
# summary(fit_linux)

