## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = identical(Sys.getenv("IN_PKGDOWN"), "true")
)

library(plssem)
library(modsem)

## ----interaction-syntax-------------------------------------------------------
# m <- '
#   X =~ x1 + x2 + x3
#   Z =~ z1 + z2 + z3
#   Y =~ y1 + y2 + y3
# 
#   Y ~ X + Z + X:Z
# '

## ----interaction-continuous, message=FALSE, warning=FALSE---------------------
# fit_cont <- pls(
#   m,
#   data      = modsem::oneInt,
#   bootstrap = TRUE,
#   boot.R    = 50
# )
# summary(fit_cont)

## ----interaction-ordered, message=FALSE, warning=FALSE------------------------
# fit_ord <- pls(
#   m,
#   data      = oneIntOrdered,
#   bootstrap = TRUE,
#   boot.R    = 50,
#   ordered   = colnames(oneIntOrdered) # explicitly specify variables as ordered
# )
# summary(fit_ord)

