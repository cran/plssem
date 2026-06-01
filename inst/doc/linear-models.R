## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(plssem)
library(modsem)

## ----tpb-syntax---------------------------------------------------------------
tpb <- '
# Outer Model (Based on Hagger et al., 2007)
  ATT =~ att1 + att2 + att3 + att4 + att5
  SN =~ sn1 + sn2
  PBC =~ pbc1 + pbc2 + pbc3
  INT =~ int1 + int2 + int3
  BEH =~ b1 + b2

# Inner Model (Based on Steinmetz et al., 2011)
  INT ~ ATT + SN + PBC
  BEH ~ INT + PBC
'

## ----tpb-linear, message=FALSE, warning=FALSE---------------------------------
fit_tpb <- pls(
  tpb,
  data      = modsem::TPB,
  bootstrap = TRUE,
  boot.R    = 50
)
summary(fit_tpb)

