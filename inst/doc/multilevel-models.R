## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(plssem)

## ----slopes-syntax------------------------------------------------------------
slopes_model <- "
  X =~ x1 + x2 + x3
  Z =~ z1 + z2 + z3
  Y =~ y1 + y2 + y3
  W =~ w1 + w2 + w3
  Y ~ X + Z + (1 + X + Z | cluster)
  W ~ X + Z + (1 + X + Z | cluster)
"

## ----slopes-continuous, message=FALSE, warning=FALSE--------------------------
fit_slopes_cont <- pls(
  slopes_model,
  data      = randomSlopes,
  bootstrap = TRUE,
  boot.R    = 50
)
summary(fit_slopes_cont)

## ----slopes-ordered, message=FALSE, warning=FALSE-----------------------------
fit_slopes_ord <- pls(
  slopes_model,
  data      = randomSlopesOrdered,
  bootstrap = TRUE,
  boot.R    = 50,
  ordered   = colnames(randomSlopesOrdered) # explicitly specify variables as ordered
)
summary(fit_slopes_ord)

## ----intercepts-syntax--------------------------------------------------------
intercepts_model <- '
  f =~ y1 + y2 + y3
  f ~ x1 + x2 + x3 + w1 + w2 + (1 | cluster)
'

## ----intercepts-continuous, message=FALSE, warning=FALSE----------------------
fit_intercepts_cont <- pls(
  intercepts_model,
  data      = randomIntercepts,
  bootstrap = TRUE,
  boot.R    = 50
)
summary(fit_intercepts_cont)

## ----intercepts-ordered, message=FALSE, warning=FALSE-------------------------
fit_intercepts_ord <- pls(
  intercepts_model,
  data      = randomInterceptsOrdered,
  bootstrap = TRUE,
  boot.R    = 50,
  ordered   = colnames(randomInterceptsOrdered) # explicitly specify variables as ordered
)
summary(fit_intercepts_ord)

