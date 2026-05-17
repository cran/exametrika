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

## ----bic-rated, message=FALSE, warning=FALSE----------------------------------
result.B.rated <- Biclustering(J21S300, ncls = 5, nfld = 3, method = "R", maxiter = 300)
result.B.rated
plot(result.B.rated, type = "Array")
plot(result.B.rated, type = "FRP", nc = 3, nr = 1)

## ----irm-rated, message=FALSE, warning=FALSE----------------------------------
result.IRM.rated <- Biclustering_IRM(J21S300, gamma_c = 1, gamma_f = 1, verbose = FALSE)
plot(result.IRM.rated, type = "Array")
plot(result.IRM.rated, type = "FRP", nc = 3, nr = 1)

## ----distractor, eval=FALSE---------------------------------------------------
# result.B.rated <- Biclustering(J21S300, ncls = 5, nfld = 3, method = "R", maxiter = 300)
# da <- DistractorAnalysis(result.B.rated)
# 
# # Full output (grouped by field for Biclustering)
# print(da)
# 
# # Filter by items and/or ranks
# print(da, items = 1:7, ranks = c(1, 5))
# 
# # Plot distractor bar charts
# plot(da, items = 1:6, nc = 3, nr = 2)

## ----distractor-lra, eval=FALSE-----------------------------------------------
# result.LRA.rated <- LRA(J21S300, nrank = 5, mic = TRUE)
# da_lra <- DistractorAnalysis(result.LRA.rated)
# print(da_lra, items = 1:3)
# plot(da_lra, items = 1:6, nc = 3, nr = 2)

