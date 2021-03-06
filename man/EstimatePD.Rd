% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MainFun.R
\name{estimatePD}
\alias{estimatePD}
\title{Computes phylogenetic diversity for specified values of sample coverage}
\usage{
estimatePD(
  data,
  nT,
  datatype = "abundance",
  tree,
  q = c(0, 1, 2),
  reftime = NULL,
  type = "PD",
  level = NULL,
  nboot = 50,
  conf = 0.95
)
}
\arguments{
\item{data}{a matrix/data.frame of species abundances (for abundance data) or species-by-site incidence raw matrix/data.frame (for incidence data). See the function \code{\link{iNEXTPD}} for details.}

\item{nT}{needed only when \code{datatype = "incidence_raw"}, a sequence of named nonnegative integers specifying the number of sampling units in each assemblage.
If \code{names(nT) = NULL}, then assemblage are automatically named as "assemblage1", "assemblage2",..., etc. Ignored if \code{datatype = "abundance"}.}

\item{datatype}{data type of input data: individual-based abundance data (\code{datatype = "abundance"}),
or species-by-site raw incidence matrix (\code{datatype = "incidence_raw"}). Default is \code{"abundance"}.}

\item{tree}{a phylo object describing the phylogenetic tree in Newick format for all observed species in the pooled assemblage.}

\item{q}{a nonnegative value or sequence specifying the diversity order. Default is \code{c(0,1,2)}.}

\item{reftime}{a positive value or sequence specifying the reference times for diversity computation. If \code{NULL},
then \code{reftime} is set to be the tree depth of the phylogenetic tree, which is spanned by all the observed species in
the pooled assemblage. Default is \code{NULL}.}

\item{type}{desired diversity type: \code{type = "PD"} for Chao et al. (2010) phylogenetic diversity
and \code{type = "meanPD"} for mean phylogenetic diversity (phylogenetic Hill number). Default is \code{"PD"}.}

\item{level}{a positive value < 1 or sequence specifying particular values of sample coverage.
If \code{NULL}, then \code{level} is set to be the minimum coverage value among all samples extrapolated up to double the reference sample sizes. Default is \code{NULL}.}

\item{nboot}{a positive integer specifying the number of bootstrap replications when assessing sampling uncertainty and constructing confidence intervals.
Enter 0 to skip the bootstrap procedures. Default is 50.}

\item{conf}{a positive number < 1 specifying the level of confidence interval. Default is 0.95.}
}
\value{
Returns a table of the computed phylogenetic diversity (PD or meanPD) for specified/default diversity orders \code{q} and reference times
for the user-specified values of sample coverage. The corresponding sample sizes and sample coverage values are also provided.
}
\description{
\code{EstimatePD} computes Chao et al.’s (2010, 2016) phylogenetic diversity (PD, effective total branch lengths,
for diversity order q = 0, 1 and 2) and mean phylogenetic diversity (meanPD, phylogenetic Hill
numbers or the effective number of lineages, q = 0, 1 and 2) at specified values of sample coverage. See Chao et al. (2010, 2015) and Hsieh and Chao (2017) for formulas and interpretations.
Use the function \code{iNEXTPD} to compute PD or meanPD for specified sample sizes.
}
\examples{
\donttest{
# Datatype: abundance data
data(data.abu)
data <- data.abu$data
tree <- data.abu$tree
out <- estimatePD(data = data, datatype = "abundance", tree = tree)
out

# Datatype: incidence_raw data
data(data.inc)
data <- data.inc$data
tree <- data.inc$tree
nT <- data.inc$nT
out <- estimatePD(data = data, nT = nT, datatype = "incidence_raw", tree = tree)
out
}
}
\references{
Chao, A., Chiu C.-H. and Jost, L. (2010). Phylogenetic diversity measures based on Hill numbers. \emph{Philosophical Transactions of the Royal Society B.}, 365, 3599-3609. \cr\cr
Chao, A., Chiu, C.-H., Hsieh, T. C., Davis, T., Nipperess, D., and Faith, D. (2015). Rarefaction and extrapolation of phylogenetic diversity. \emph{Methods in Ecology and Evolution}, 6, 380-388.\cr\cr
Chao, A., Chiu C.-H. and Jost L. (2016). Phylogenetic diversity measures and their decomposition: a framework based on Hill numbers. pp. 141-172 in Pellens R. and Grandcolas P. (eds)
\emph{Biodiversity Conservation and Phylogenetic Systematics: Preserving our Evolutionary Heritage in an Extinction Crisis}, Springer. \cr\cr
Hsieh, T. C. and Chao, A. (2017). Rarefaction and extrapolation: making fair comparison of abundance-sensitive phylogenetic diversity among multiple assemblages. \emph{Systematic Biology}, 66, 100-111.
}
