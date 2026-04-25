## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(plssem)

## ----tpb-ordered, message=FALSE, warning=FALSE--------------------------------
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

fit_cat <- pls(
  tpb,
  data      = TPB_Ordered,
  bootstrap = TRUE,
  boot.R    = 50,
  ordered   = colnames(TPB_Ordered) # explicitly specify ordered variables
)
summary(fit_cat)

