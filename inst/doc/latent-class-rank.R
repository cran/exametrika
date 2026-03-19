## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 5,
  out.width = "100%"
)

## ----library, message=FALSE, warning=FALSE------------------------------------
library(exametrika)

## ----model-lca, message=FALSE, warning=FALSE----------------------------------
LCA(J15S500, ncls = 5)

## ----results-lca-membership, message=FALSE, warning=FALSE---------------------
result.LCA <- LCA(J15S500, ncls = 5)
head(result.LCA$Students)

## ----plot-lca, fig.width=7, fig.height=5, message=FALSE, warning=FALSE--------
plot(result.LCA, type = "IRP", items = 1:6, nc = 2, nr = 3)
plot(result.LCA, type = "CMP", students = 1:9, nc = 3, nr = 3)
plot(result.LCA, type = "TRP")
plot(result.LCA, type = "LCD")

## ----model-lra, message=FALSE, warning=FALSE----------------------------------
LRA(J15S500, nrank = 6)

## ----results-lra-membership, message=FALSE, warning=FALSE---------------------
result.LRA <- LRA(J15S500, nrank = 6)
head(result.LRA$Students)

## ----plot-lra, fig.width=7, fig.height=5, message=FALSE, warning=FALSE--------
plot(result.LRA, type = "IRP", items = 1:6, nc = 2, nr = 3)
plot(result.LRA, type = "RMP", students = 1:9, nc = 3, nr = 3)
plot(result.LRA, type = "TRP")
plot(result.LRA, type = "LRD")

## ----model-lra-ordinal, eval=FALSE--------------------------------------------
# result.LRAord <- LRA(J15S3810, nrank = 3, mic = TRUE)

## ----plot-lra-ordinal-score, eval=FALSE---------------------------------------
# plot(result.LRAord, type = "ScoreFreq")
# plot(result.LRAord, type = "ScoreRank")

## ----plot-lra-ordinal-icbr, eval=FALSE----------------------------------------
# plot(result.LRAord, type = "ICBR", items = 1:4, nc = 2, nr = 2)
# plot(result.LRAord, type = "ICRP", items = 1:4, nc = 2, nr = 2)

## ----plot-lra-ordinal-rmp, eval=FALSE-----------------------------------------
# plot(result.LRAord, type = "RMP", students = 1:9, nc = 3, nr = 3)

## ----lra-rated, eval=FALSE----------------------------------------------------
# result.LRArated <- LRA(J35S5000, nrank = 10, mic = TRUE)

## ----plot-lra-rated-score, eval=FALSE-----------------------------------------
# plot(result.LRArated, type = "ScoreFreq")
# plot(result.LRArated, type = "ScoreRank")

## ----plot-lra-rated-icrp, eval=FALSE------------------------------------------
# plot(result.LRArated, type = "ICRP", items = 1:4, nc = 2, nr = 2)

