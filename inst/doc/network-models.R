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
library(igraph)

## ----setup-igraph, message=FALSE, warning=FALSE-------------------------------
DAG <- matrix(
  c(
    "Item01", "Item02",
    "Item02", "Item03",
    "Item02", "Item04",
    "Item03", "Item05",
    "Item04", "Item05"
  ),
  ncol = 2, byrow = TRUE
)

# Graph object
g <- igraph::graph_from_data_frame(DAG)
g

# Adjacency matrix
adj_mat <- as.matrix(igraph::get.adjacency(g))
print(adj_mat)

## ----model-bnm, message=FALSE, warning=FALSE----------------------------------
result.BNM <- BNM(J5S10, adj_matrix = adj_mat)
result.BNM

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

## ----setup-ldlra-dag, message=FALSE, warning=FALSE----------------------------
DAG_dat <- matrix(c(
  "From", "To", "Rank",
  "Item01", "Item02", 1,
  "Item04", "Item05", 1,
  "Item01", "Item02", 2,
  "Item02", "Item03", 2,
  "Item04", "Item05", 2,
  "Item08", "Item09", 2,
  "Item08", "Item10", 2,
  "Item09", "Item10", 2,
  "Item08", "Item11", 2,
  "Item01", "Item02", 3,
  "Item02", "Item03", 3,
  "Item04", "Item05", 3,
  "Item08", "Item09", 3,
  "Item08", "Item10", 3,
  "Item09", "Item10", 3,
  "Item08", "Item11", 3,
  "Item02", "Item03", 4,
  "Item04", "Item06", 4,
  "Item04", "Item07", 4,
  "Item05", "Item06", 4,
  "Item05", "Item07", 4,
  "Item08", "Item10", 4,
  "Item08", "Item11", 4,
  "Item09", "Item11", 4,
  "Item02", "Item03", 5,
  "Item04", "Item06", 5,
  "Item04", "Item07", 5,
  "Item05", "Item06", 5,
  "Item05", "Item07", 5,
  "Item09", "Item11", 5,
  "Item10", "Item11", 5,
  "Item10", "Item12", 5
), ncol = 3, byrow = TRUE)

edgeFile <- tempfile(fileext = ".csv")
write.csv(DAG_dat, edgeFile, row.names = FALSE, quote = TRUE)

## ----model-ldlra, eval=FALSE--------------------------------------------------
# result.LDLRA <- LDLRA(J12S5000, ncls = 5, adj_file = edgeFile)
# result.LDLRA

## ----plot-ldlra, eval=FALSE---------------------------------------------------
# plot(result.LDLRA, type = "IRP", nc = 4, nr = 3)
# plot(result.LDLRA, type = "TRP")
# plot(result.LDLRA, type = "LRD")

## ----cleanup-ldlra, include=FALSE---------------------------------------------
if (exists("edgeFile")) unlink(edgeFile)

## ----model-pbil-ldlra, eval=FALSE---------------------------------------------
# result.LDLRA.PBIL <- LDLRA_PBIL(J35S515,
#   seed = 123, ncls = 5, method = "R",
#   elitism = 1, successiveLimit = 15
# )
# result.LDLRA.PBIL

## ----setup-ldb, message=FALSE, warning=FALSE----------------------------------
conf <- c(
  1, 6, 6, 8, 9, 9, 4, 7, 7, 7, 5, 8, 9, 10, 10,
  9, 9, 10, 10, 10, 2, 2, 3, 3, 5, 5, 6, 9, 9, 10,
  1, 1, 7, 9, 10
)

edges_data <- data.frame(
  "From Field (Parent) >>>" = c(
    6, 4, 5, 1, 1, 4,
    3, 4, 6, 2, 4, 4,
    3, 6, 4, 1,
    7, 9, 6, 7
  ),
  ">>> To Field (Child)" = c(
    8, 7, 8, 7, 2, 5,
    5, 8, 8, 4, 6, 7,
    5, 8, 5, 8,
    10, 10, 8, 9
  ),
  "At Class/Rank (Locus)" = c(
    2, 2, 2, 2, 2, 2,
    3, 3, 3, 3, 3, 3,
    4, 4, 4, 4,
    5, 5, 5, 5
  )
)

edgeFile <- tempfile(fileext = ".csv")
write.csv(edges_data, file = edgeFile, row.names = FALSE)

## ----model-ldb, eval=FALSE----------------------------------------------------
# result.LDB <- LDB(U = J35S515, ncls = 5, conf = conf, adj_file = edgeFile)
# result.LDB

## ----plot-ldb, eval=FALSE-----------------------------------------------------
# plot(result.LDB, type = "Array")
# plot(result.LDB, type = "TRP")
# plot(result.LDB, type = "LRD")
# plot(result.LDB, type = "RMP", students = 1:9, nc = 3, nr = 3)
# plot(result.LDB, type = "FRP", nc = 3, nr = 2)

## ----plot-ldb-fieldpirp, eval=FALSE-------------------------------------------
# plot(result.LDB, type = "FieldPIRP")

## ----cleanup-ldb, include=FALSE-----------------------------------------------
if (exists("edgeFile")) unlink(edgeFile)

## ----setup-binet, message=FALSE, warning=FALSE--------------------------------
conf <- c(
  1, 5, 5, 5, 9, 9, 6, 6, 6, 6, 2, 7, 7, 11, 11,
  7, 7, 12, 12, 12, 2, 2, 3, 3, 4, 4, 4, 8, 8, 12,
  1, 1, 6, 10, 10
)

edges_data <- data.frame(
  "From Class (Parent) >>>" = c(
    1, 2, 3, 4, 5, 7,
    2, 4, 6, 8, 10,
    6, 6, 11, 8, 9, 12
  ),
  ">>> To Class (Child)" = c(
    2, 4, 5, 5, 6, 11,
    3, 7, 9, 12, 12,
    10, 8, 12, 12, 11, 13
  ),
  "At Field (Locus)" = c(
    1, 2, 2, 3, 4, 4,
    5, 5, 5, 5, 5,
    7, 8, 8, 9, 9, 12
  )
)

edgeFile <- tempfile(fileext = ".csv")
write.csv(edges_data, file = edgeFile, row.names = FALSE)

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

## ----plot-binet-ldpsr, eval=FALSE---------------------------------------------
# plot(result.BINET, type = "LDPSR", nc = 3, nr = 2)

## ----cleanup-binet, include=FALSE---------------------------------------------
if (exists("edgeFile")) unlink(edgeFile)

