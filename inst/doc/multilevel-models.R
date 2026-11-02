## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = identical(Sys.getenv("IN_PKGDOWN"), "true")
)

library(plssem)

## ----two-level-syntax---------------------------------------------------------
# two_level_model <- "
#   level: 1
#     fw =~ y1 + y2 + y3
#     fw ~ x1 + x2 + x3
#   level: 2
#     fb =~ y1 + y2 + y3
#     fb ~ w1 + w2
# "

## ----two-level-continuous, message=FALSE, warning=FALSE-----------------------
# fit_two_level_cont <- pls(
#   two_level_model,
#   data      = randomSlopes,
#   cluster   = "cluster",
#   bootstrap = TRUE,
#   boot.R    = 50
# )
# summary(fit_two_level_cont)

## ----two-level-ordered, message=FALSE, warning=FALSE--------------------------
# fit_two_level_ord <- pls(
#   two_level_model,
#   data      = randomSlopesOrdered,
#   cluster   = "cluster",
#   bootstrap = TRUE,
#   boot.R    = 50,
#   ordered   = colnames(randomSlopesOrdered) # explicitly specify variables as ordered
# )
# summary(fit_two_level_ord)

## ----slopes-syntax------------------------------------------------------------
# slopes_model <- '
#   level: 1
#     fw =~ y1 + y2 + y3
#     fw ~ rv("s1")*x1 + rv("s2")*x2 + x3
#   level: 2
#     fb =~ y1 + y2 + y3
#     fb ~ w1 + w2
#     # the random slopes are latent variables at the between level
#     s1 + s2 ~ w1 + w2
# '

## ----slopes-continuous, message=FALSE, warning=FALSE--------------------------
# fit_slopes_cont <- pls(
#   slopes_model,
#   data      = randomSlopes,
#   cluster   = "cluster",
#   bootstrap = TRUE,
#   boot.R    = 50
# )
# summary(fit_slopes_cont)

## ----slopes-ordered, message=FALSE, warning=FALSE-----------------------------
# fit_slopes_ord <- pls(
#   slopes_model,
#   data      = randomSlopesOrdered,
#   cluster   = "cluster",
#   bootstrap = TRUE,
#   boot.R    = 50,
#   ordered   = colnames(randomSlopesOrdered) # explicitly specify variables as ordered
# )
# summary(fit_slopes_ord)

