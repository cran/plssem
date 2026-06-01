## ----include = FALSE----------------------------------------------------------
EVAL_DEFAULT <- identical(Sys.getenv("PLSSEM_VIGNETTES"), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE
)

## ----setup--------------------------------------------------------------------
library(plssem)

## -----------------------------------------------------------------------------
library(modsem)

tpb_2so <- '
  # First order latent variables
  ATT =~ att1 + att2 + att3
  SN  =~ sn1 + sn2 + sn3
  PB =~ pb1 + pb2 + pb3
  PC =~ pc1 + pc2 + pc3
  BEH =~ b1 + b2

  # Higher order latent variables
  INT =~ ATT + SN
  PBC =~ PC + PB

  # Structural model
  BEH ~ PBC + INT + INT:PBC
'

fit <- pls(tpb_2so, data = TPB_2SO, bootstrap = TRUE, boot.R = 50)
summary(fit)

