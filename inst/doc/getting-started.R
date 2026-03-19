## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 5,
  out.width = "100%"
)

## ----install, eval=FALSE------------------------------------------------------
# # Install from CRAN
# install.packages("exametrika")
# 
# # Or install the development version from GitHub
# if (!require("devtools")) install.packages("devtools")
# devtools::install_github("kosugitti/exametrika")

## ----library, message=FALSE, warning=FALSE------------------------------------
library(exametrika)

## ----example-data-format------------------------------------------------------
# Format raw data for analysis
data <- dataFormat(J15S500)
str(data)

## ----test-statistics, message=FALSE, warning=FALSE----------------------------
TestStatistics(J15S500)

## ----item-statistics, message=FALSE, warning=FALSE----------------------------
ItemStatistics(J15S500)

## ----ctt, message=FALSE, warning=FALSE----------------------------------------
CTT(J15S500)

