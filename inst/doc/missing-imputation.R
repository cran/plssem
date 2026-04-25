## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

library(plssem)

## -----------------------------------------------------------------------------
# model <- "Survived ~ Age + Female + Age:Female"
# fit <- pls(model, data = titanic, missing = "listwise", ordered = "Survived")

## -----------------------------------------------------------------------------
# model <- "Survived ~ Age + Female + Age:Female"
# fit <- pls(model, data = titanic, missing = "mean", ordered = "Survived")

## -----------------------------------------------------------------------------
# model <- "Survived ~ Age + Female + Age:Female"
# fit <- pls(model, data = titanic, missing = "kNN",
#            ordered = "Survived", knn.k = 5) # use the 5 nearest neighbors

## -----------------------------------------------------------------------------
# library(mice)
# 
# m <- 20 # Number of imputations
# vars <- c("Survived", "Age", "Female") # Variables to impute/use in the analysis
# 
# imputations <- mice(titanic[vars], m = m)
# 
# COEF <- NULL # Matrix with estimated coefficients for each imputation
# BOOT <- NULL # Matrix with all the bootstraps from all imputations
# 
# model <- "Survived ~ Age + Female + Age:Female"
# 
# for (i in seq_len(m)) {
#   fit.i <- pls(model, data = complete(imputations, i), # get the ith imputation
#                ordered = "Survived",
#                bootstrap = TRUE,
#                boot.R = 100,
#                boot.parallel = "multicore", # Use parallel bootstrap
#                boot.ncpus = 2L)
# 
#   COEF <- rbind(COEF, coef(fit.i))
#   BOOT <- rbind(BOOT, boot(fit.i))
# }
# 
# apply(COEF, MARGIN = 2, FUN = mean) # Mean estimate across imputations
# apply(BOOT, MARGIN = 2, FUN = sd)   # Standard errors

