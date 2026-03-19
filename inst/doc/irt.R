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

## ----model-irt, message=FALSE, warning=FALSE----------------------------------
result.IRT <- IRT(J15S500, model = 3)
result.IRT

## ----results-irt-ability, message=FALSE, warning=FALSE------------------------
head(result.IRT$ability)

## ----plot-irt-irf, fig.width=7, fig.height=5, message=FALSE, warning=FALSE----
plot(result.IRT, type = "IRF", items = 1:6, nc = 2, nr = 3)

## ----plot-irt-overlay, fig.width=7, fig.height=5, message=FALSE, warning=FALSE----
plot(result.IRT, type = "IRF", overlay = TRUE)

## ----plot-irt-iic, fig.width=7, fig.height=5, message=FALSE, warning=FALSE----
plot(result.IRT, type = "IIC", items = 1:6, nc = 2, nr = 3)

## ----plot-irt-trf, fig.width=7, fig.height=5, message=FALSE, warning=FALSE----
plot(result.IRT, type = "TRF")

## ----plot-irt-tic, fig.width=7, fig.height=5, message=FALSE, warning=FALSE----
plot(result.IRT, type = "TIC")

## ----grm, message=FALSE, warning=FALSE----------------------------------------
result.GRM <- GRM(J5S1000)
result.GRM

## ----grm-irf, fig.width=7, fig.height=8, message=FALSE, warning=FALSE---------
plot(result.GRM, type = "IRF", nc = 2)

## ----grm-iif, fig.width=7, fig.height=8, message=FALSE, warning=FALSE---------
plot(result.GRM, type = "IIF", nc = 2)

## ----grm-tif, fig.width=7, fig.height=5, message=FALSE, warning=FALSE---------
plot(result.GRM, type = "TIF")

