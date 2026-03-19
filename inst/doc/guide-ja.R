## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 5,
  out.width = "100%"
)

## ----install, eval=FALSE------------------------------------------------------
# # CRANからインストール
# install.packages("exametrika")
# 
# # または開発版をGitHubからインストール
# if (!require("devtools")) install.packages("devtools")
# devtools::install_github("kosugitti/exametrika")

## ----setup-library, message=FALSE, warning=FALSE------------------------------
library(exametrika)

## ----example-data-format------------------------------------------------------
data <- dataFormat(J15S500)
str(data)

## ----results-test-statistics, message=FALSE, warning=FALSE--------------------
TestStatistics(J15S500)

## ----results-item-statistics, message=FALSE, warning=FALSE--------------------
ItemStatistics(J15S500)

## ----results-ctt, message=FALSE, warning=FALSE--------------------------------
CTT(J15S500)

## ----model-irt, eval=FALSE----------------------------------------------------
# result.IRT <- IRT(J15S500, model = 3)
# result.IRT

## ----results-irt-ability, eval=FALSE------------------------------------------
# head(result.IRT$ability)

## ----plot-irt-curves, eval=FALSE----------------------------------------------
# plot(result.IRT, type = "IRF", items = 1:6, nc = 2, nr = 3)
# plot(result.IRT, type = "IRF", overlay = TRUE)
# plot(result.IRT, type = "IIC", items = 1:6, nc = 2, nr = 3)
# plot(result.IRT, type = "TRF")
# plot(result.IRT, type = "TIC")

## ----GRM, eval=FALSE----------------------------------------------------------
# result.GRM <- GRM(J5S1000)
# result.GRM

## ----GRM-plot, eval=FALSE-----------------------------------------------------
# plot(result.GRM, type = "IRF", nc = 2)
# plot(result.GRM, type = "IIF", nc = 2)
# plot(result.GRM, type = "TIF")

## ----model-lca, eval=FALSE----------------------------------------------------
# result.LCA <- LCA(J15S500, ncls = 5)
# head(result.LCA$Students)

## ----plot-lca, eval=FALSE-----------------------------------------------------
# plot(result.LCA, type = "IRP", items = 1:6, nc = 2, nr = 3)
# plot(result.LCA, type = "CMP", students = 1:9, nc = 3, nr = 3)
# plot(result.LCA, type = "TRP")
# plot(result.LCA, type = "LCD")

## ----model-lra, eval=FALSE----------------------------------------------------
# result.LRA <- LRA(J15S500, nrank = 6)
# head(result.LRA$Students)

## ----plot-lra, eval=FALSE-----------------------------------------------------
# plot(result.LRA, type = "IRP", items = 1:6, nc = 2, nr = 3)
# plot(result.LRA, type = "RMP", students = 1:9, nc = 3, nr = 3)
# plot(result.LRA, type = "TRP")
# plot(result.LRA, type = "LRD")

## ----model-lra-ordinal, eval=FALSE--------------------------------------------
# result.LRAord <- LRA(J15S3810, nrank = 3, mic = TRUE)

## ----plot-lra-ordinal-score, eval=FALSE---------------------------------------
# plot(result.LRAord, type = "ScoreFreq")
# plot(result.LRAord, type = "ScoreRank")

## ----plot-lra-ordinal-icbr-icrp, eval=FALSE-----------------------------------
# plot(result.LRAord, type = "ICBR", items = 1:4, nc = 2, nr = 2)
# plot(result.LRAord, type = "ICRP", items = 1:4, nc = 2, nr = 2)

## ----plot-lra-ordinal-rmp, eval=FALSE-----------------------------------------
# plot(result.LRAord, type = "RMP", students = 1:9, nc = 3, nr = 3)

## ----model-lra-rated, eval=FALSE----------------------------------------------
# result.LRArated <- LRA(J35S5000, nrank = 10, mic = TRUE)

## ----plot-lra-rated, eval=FALSE-----------------------------------------------
# plot(result.LRArated, type = "ScoreFreq")
# plot(result.LRArated, type = "ScoreRank")
# plot(result.LRArated, type = "ICRP", items = 1:4, nc = 2, nr = 2)

## ----model-biclustering, eval=FALSE-------------------------------------------
# Biclustering(J35S515, nfld = 5, ncls = 6, method = "B")

## ----model-ranklustering, eval=FALSE------------------------------------------
# result.Ranklustering <- Biclustering(J35S515, nfld = 5, ncls = 6, method = "R")
# plot(result.Ranklustering, type = "Array")
# plot(result.Ranklustering, type = "FRP", nc = 2, nr = 3)
# plot(result.Ranklustering, type = "RRV")
# plot(result.Ranklustering, type = "RMP", students = 1:9, nc = 3, nr = 3)
# plot(result.Ranklustering, type = "LRD")

## ----grid-search, eval=FALSE--------------------------------------------------
# result <- GridSearch(J35S515, method = "R", max_ncls = 10, max_nfld = 10, index = "BIC")
# result$optimal_ncls
# result$optimal_nfld
# plot(result$optimal_result, type = "Array")

## ----model-irm, eval=FALSE----------------------------------------------------
# result.IRM <- Biclustering_IRM(J35S515, gamma_c = 1, gamma_f = 1, verbose = TRUE)
# plot(result.IRM, type = "Array")
# plot(result.IRM, type = "FRP", nc = 3)
# plot(result.IRM, type = "TRP")

## ----bic-poly-ord, eval=FALSE-------------------------------------------------
# result.B.ord <- Biclustering(J35S500, ncls = 5, nfld = 5, method = "R")
# result.B.ord
# plot(result.B.ord, type = "Array")
# plot(result.B.ord, type = "FRP", nc = 3, nr = 2)
# plot(result.B.ord, type = "FCRP", nc = 3, nr = 2)
# plot(result.B.ord, type = "FCRP", style = "bar", nc = 3, nr = 2)
# plot(result.B.ord, type = "FCBR", nc = 3, nr = 2)
# plot(result.B.ord, type = "ScoreField")
# plot(result.B.ord, type = "RRV")

## ----bic-poly-nom, eval=FALSE-------------------------------------------------
# result.B.nom <- Biclustering(J20S600, ncls = 5, nfld = 4)
# result.B.nom
# plot(result.B.nom, type = "Array")
# plot(result.B.nom, type = "FRP", nc = 2, nr = 2)
# plot(result.B.nom, type = "FCRP", nc = 2, nr = 2)
# plot(result.B.nom, type = "FCRP", style = "bar", nc = 2, nr = 2)
# plot(result.B.nom, type = "ScoreField")
# plot(result.B.nom, type = "RRV")

## ----setup-igraph, eval=FALSE-------------------------------------------------
# library(igraph)
# DAG <- matrix(
#   c(
#     "Item01", "Item02", "Item02", "Item03", "Item02", "Item04",
#     "Item03", "Item05", "Item04", "Item05"
#   ),
#   ncol = 2, byrow = TRUE
# )
# g <- igraph::graph_from_data_frame(DAG)
# adj_mat <- as.matrix(igraph::get.adjacency(g))

## ----model-bnm, eval=FALSE----------------------------------------------------
# result.BNM <- BNM(J5S10, adj_matrix = adj_mat)
# result.BNM

## ----model-ga-bnm, eval=FALSE-------------------------------------------------
# BNM_GA(J5S10,
#   population = 20, Rs = 0.5, Rm = 0.002, maxParents = 2,
#   maxGeneration = 100, crossover = 2, elitism = 2
# )

## ----model-pbil-bnm, eval=FALSE-----------------------------------------------
# BNM_PBIL(J5S10,
#   population = 20, Rs = 0.5, Rm = 0.005, maxParents = 2,
#   alpha = 0.05, estimate = 4
# )

## ----setup-ldlra-dag, eval=FALSE----------------------------------------------
# DAG_dat <- matrix(c(
#   "From", "To", "Rank",
#   "Item01", "Item02", 1, "Item04", "Item05", 1,
#   "Item01", "Item02", 2, "Item02", "Item03", 2,
#   "Item04", "Item05", 2, "Item08", "Item09", 2,
#   "Item08", "Item10", 2, "Item09", "Item10", 2, "Item08", "Item11", 2,
#   "Item01", "Item02", 3, "Item02", "Item03", 3,
#   "Item04", "Item05", 3, "Item08", "Item09", 3,
#   "Item08", "Item10", 3, "Item09", "Item10", 3, "Item08", "Item11", 3,
#   "Item02", "Item03", 4, "Item04", "Item06", 4,
#   "Item04", "Item07", 4, "Item05", "Item06", 4,
#   "Item05", "Item07", 4, "Item08", "Item10", 4,
#   "Item08", "Item11", 4, "Item09", "Item11", 4,
#   "Item02", "Item03", 5, "Item04", "Item06", 5,
#   "Item04", "Item07", 5, "Item05", "Item06", 5,
#   "Item05", "Item07", 5, "Item09", "Item11", 5,
#   "Item10", "Item11", 5, "Item10", "Item12", 5
# ), ncol = 3, byrow = TRUE)
# 
# edgeFile <- tempfile(fileext = ".csv")
# write.csv(DAG_dat, edgeFile, row.names = FALSE, quote = TRUE)

## ----model-ldlra, eval=FALSE--------------------------------------------------
# result.LDLRA <- LDLRA(J12S5000, ncls = 5, adj_file = edgeFile)
# result.LDLRA

## ----plot-ldlra, eval=FALSE---------------------------------------------------
# plot(result.LDLRA, type = "IRP", nc = 4, nr = 3)
# plot(result.LDLRA, type = "TRP")
# plot(result.LDLRA, type = "LRD")

## ----cleanup-ldlra, include=FALSE---------------------------------------------
if (exists("edgeFile")) unlink(edgeFile)

## ----setup-ldb, eval=FALSE----------------------------------------------------
# conf <- c(
#   1, 6, 6, 8, 9, 9, 4, 7, 7, 7, 5, 8, 9, 10, 10,
#   9, 9, 10, 10, 10, 2, 2, 3, 3, 5, 5, 6, 9, 9, 10,
#   1, 1, 7, 9, 10
# )
# 
# edges_data <- data.frame(
#   "From Field (Parent) >>>" = c(6, 4, 5, 1, 1, 4, 3, 4, 6, 2, 4, 4, 3, 6, 4, 1, 7, 9, 6, 7),
#   ">>> To Field (Child)" = c(8, 7, 8, 7, 2, 5, 5, 8, 8, 4, 6, 7, 5, 8, 5, 8, 10, 10, 8, 9),
#   "At Class/Rank (Locus)" = c(2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5)
# )
# 
# edgeFile <- tempfile(fileext = ".csv")
# write.csv(edges_data, file = edgeFile, row.names = FALSE)

## ----model-ldb, eval=FALSE----------------------------------------------------
# result.LDB <- LDB(U = J35S515, ncls = 5, conf = conf, adj_file = edgeFile)
# result.LDB

## ----plot-ldb, eval=FALSE-----------------------------------------------------
# plot(result.LDB, type = "Array")
# plot(result.LDB, type = "TRP")
# plot(result.LDB, type = "LRD")
# plot(result.LDB, type = "RMP", students = 1:9, nc = 3, nr = 3)
# plot(result.LDB, type = "FRP", nc = 3, nr = 2)
# plot(result.LDB, type = "FieldPIRP")

## ----cleanup-ldb, include=FALSE-----------------------------------------------
if (exists("edgeFile")) unlink(edgeFile)

## ----setup-binet, eval=FALSE--------------------------------------------------
# conf <- c(
#   1, 5, 5, 5, 9, 9, 6, 6, 6, 6, 2, 7, 7, 11, 11,
#   7, 7, 12, 12, 12, 2, 2, 3, 3, 4, 4, 4, 8, 8, 12,
#   1, 1, 6, 10, 10
# )
# 
# edges_data <- data.frame(
#   "From Class (Parent) >>>" = c(1, 2, 3, 4, 5, 7, 2, 4, 6, 8, 10, 6, 6, 11, 8, 9, 12),
#   ">>> To Class (Child)" = c(2, 4, 5, 5, 6, 11, 3, 7, 9, 12, 12, 10, 8, 12, 12, 11, 13),
#   "At Field (Locus)" = c(1, 2, 2, 3, 4, 4, 5, 5, 5, 5, 5, 7, 8, 8, 9, 9, 12)
# )
# 
# edgeFile <- tempfile(fileext = ".csv")
# write.csv(edges_data, file = edgeFile, row.names = FALSE)

## ----model-binet, eval=FALSE--------------------------------------------------
# result.BINET <- BINET(
#   U = J35S515, ncls = 13, nfld = 12,
#   conf = conf, adj_file = edgeFile
# )
# print(result.BINET)

## ----plot-binet, eval=FALSE---------------------------------------------------
# plot(result.BINET, type = "Array")
# plot(result.BINET, type = "TRP")
# plot(result.BINET, type = "LRD")
# plot(result.BINET, type = "RMP", students = 1:9, nc = 3, nr = 3)
# plot(result.BINET, type = "FRP", nc = 3, nr = 2)
# plot(result.BINET, type = "LDPSR", nc = 3, nr = 2)

## ----cleanup-binet, include=FALSE---------------------------------------------
if (exists("edgeFile")) unlink(edgeFile)

