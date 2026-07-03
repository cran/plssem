## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = identical(Sys.getenv("IN_PKGDOWN"), "true")
)

library(plssem)

## ----data---------------------------------------------------------------------
# head(titanic[, c("Survived", "Age", "Sex", "Female", "Pclass")])

## ----linear, message=FALSE, warning=FALSE-------------------------------------
# m_linear <- "Survived ~ Age + Female"
# 
# fit_linear <- pls(
#   m_linear,
#   data          = titanic,
#   ordered       = "Survived",
#   boot.R        = 50,
#   bootstrap     = TRUE,
#   boot.parallel = "multicore",
#   boot.ncores   = 2
# )
# 
# summary(fit_linear)

## ----linear-predict, message=FALSE, warning=FALSE-----------------------------
# pls_predict(fit_linear, benchmark = "acc")

## ----interaction, message=FALSE, warning=FALSE--------------------------------
# m_int <- "Survived ~ Age + Female + Age:Female"
# 
# fit_int <- pls(
#   m_int,
#   data          = titanic,
#   ordered       = "Survived",
#   boot.R        = 50,
#   bootstrap     = TRUE,
#   boot.parallel = "multicore",
#   boot.ncores   = 2
# )
# 
# summary(fit_int)

## ----interaction-predict, message=FALSE, warning=FALSE------------------------
# pls_predict(fit_int, benchmark = "acc")

