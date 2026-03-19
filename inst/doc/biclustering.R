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

## ----model-biclustering, message=FALSE, warning=FALSE-------------------------
Biclustering(J35S515, nfld = 5, ncls = 6, method = "B")

## ----model-ranklustering, message=FALSE, warning=FALSE------------------------
result.Ranklustering <- Biclustering(J35S515, nfld = 5, ncls = 6, method = "R")

## ----plot-ranklustering, fig.width=7, fig.height=5, message=FALSE, warning=FALSE----
plot(result.Ranklustering, type = "Array")
plot(result.Ranklustering, type = "FRP", nc = 2, nr = 3)
plot(result.Ranklustering, type = "RRV")
plot(result.Ranklustering, type = "RMP", students = 1:9, nc = 3, nr = 3)
plot(result.Ranklustering, type = "LRD")

## ----grid-search, eval=FALSE--------------------------------------------------
# result <- GridSearch(J35S515, method = "R", max_ncls = 10, max_nfld = 10, index = "BIC")
# result$optimal_ncls
# result$optimal_nfld
# result$optimal_result

## ----model-irm, eval=FALSE----------------------------------------------------
# result.IRM <- Biclustering_IRM(J35S515, gamma_c = 1, gamma_f = 1, verbose = TRUE)
# plot(result.IRM, type = "Array")
# plot(result.IRM, type = "FRP", nc = 3)
# plot(result.IRM, type = "TRP")

## ----bic-ord, eval=FALSE------------------------------------------------------
# result.B.ord <- Biclustering(J35S500, ncls = 5, nfld = 5, method = "R")
# result.B.ord
# plot(result.B.ord, type = "Array")

## ----bic-ord-frp, eval=FALSE--------------------------------------------------
# plot(result.B.ord, type = "FRP", nc = 3, nr = 2)

## ----bic-ord-fcrp, eval=FALSE-------------------------------------------------
# plot(result.B.ord, type = "FCRP", nc = 3, nr = 2)
# plot(result.B.ord, type = "FCRP", style = "bar", nc = 3, nr = 2)

## ----bic-ord-fcbr, eval=FALSE-------------------------------------------------
# plot(result.B.ord, type = "FCBR", nc = 3, nr = 2)

## ----bic-ord-scorefield, eval=FALSE-------------------------------------------
# plot(result.B.ord, type = "ScoreField")
# plot(result.B.ord, type = "RRV")

## ----bic-nom, eval=FALSE------------------------------------------------------
# result.B.nom <- Biclustering(J20S600, ncls = 5, nfld = 4)
# result.B.nom
# plot(result.B.nom, type = "Array")

## ----bic-nom-plots, eval=FALSE------------------------------------------------
# plot(result.B.nom, type = "FRP", nc = 2, nr = 2)
# plot(result.B.nom, type = "FCRP", nc = 2, nr = 2)
# plot(result.B.nom, type = "FCRP", style = "bar", nc = 2, nr = 2)
# plot(result.B.nom, type = "ScoreField")
# plot(result.B.nom, type = "RRV")

