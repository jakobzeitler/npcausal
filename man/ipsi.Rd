% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ipsi.R
\name{ipsi}
\alias{ipsi}
\title{Estimating effects of incremental propensity score interventions}
\usage{
ipsi(dat, x.trt, x.out, delta.seq, nsplits)
}
\arguments{
\item{y}{outcome of interest measured at end of study.}

\item{a}{binary treatment.}

\item{x.trt}{covariate matrix for treatment regression.}

\item{x.out}{covariate matrix for outcome regression.}

\item{time}{measurement time.}

\item{id}{subject identifier.}

\item{delta.seq}{sequence of delta increment values.}

\item{nsplits}{integer number of sample splits for nuisance estimation.
If nsplits=1, sample splitting is not used, and nuisance functions are estimated
on full sample (in which case validity of SEs/CIs requires empirical
process conditions). Otherwise must have nsplits>1.}
}
\value{
A list containing the following components:
\item{res}{ estimates/SEs and uniform CIs for population means.}
\item{res.ptwise}{ estimates/SEs and pointwise CIs for population means.}
\item{calpha}{ multiplier bootstrap critical value.}
}
\description{
\code{ipsi} is used to estimate effects of incremental propensity score interventions, i.e., estimates of mean outcomes if the odds of receiving treatment were multiplied by a factor delta.
}
\section{Details}{

Treatment and covariates are expected to be time-varying and measured throughout the course of the study. Therefore if \code{n} is the number of subjects and \code{T} the number of timepoints, then \code{a}, \code{time}, and \code{id} should all be vectors of length \code{n}x\code{T}, and \code{x.trt} and \code{x.out} should be matrices with \code{n}x\code{T} rows. However \code{y} should be a vector of length \code{n} since it is only measured at the end of the study. The subject ordering should be consistent across function inputs, based on the ordering specified by \code{id}. See example below for an illustration.
}

\examples{
n <- 500; T <- 4

time <- rep(1:T,n); id <- rep(1:n,rep(T,n))
x.trt <- matrix(rnorm(n*T*5),nrow=n*T)
x.out <- matrix(rnorm(n*T*5),nrow=n*T)
a <- rbinom(n*T,1,.5); y <- rnorm(n)

d.seq <- seq(0.1,5,length.out=10)

ipsi.res <- ipsi(y,a, x.trt,x.out, time,id, d.seq)

}
\references{
Kennedy EH. Nonparametric causal effects based on incremental propensity score interventions. \href{https://arxiv.org/abs/1704.00211}{arxiv:1704.00211}
}
