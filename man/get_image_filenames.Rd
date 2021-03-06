% Generated by roxygen2 (4.1.0.9001): do not edit by hand
% Please edit documentation in R/get_image_filenames.R
\name{get_image_filenames}
\alias{get_image_filenames}
\title{Get Image Filenames}
\usage{
get_image_filenames(ids = get_ids(), modalities = c("FLAIR", "MPRAGE",
  "T2w"), visits = c(1, 2))
}
\arguments{
\item{ids}{ID to return}

\item{modalities}{vector of image modalities within
\code{c("FLAIR", "MPRAGE", "T2w")} to return}

\item{visit}{Vector of scan indices to return (1 or 2 or both)}
}
\description{
Return the fielnames for the images
}

