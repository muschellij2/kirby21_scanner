#' @name get_image_filenames
#' @title Get Image Filenames
#'
#' @description Return the fielnames for the images
#' @param ids ID to return
#' @param modalities vector of image modalities within
#' \code{c("FLAIR", "MPRAGE", "T2w")} to return
#' @param visit Vector of scan indices to return (1 or 2 or both)
#' @import kirby21.scan.1
#' @import kirby21.scan.2
#' @export
get_image_filenames = function(ids =get_ids(), 
                               modalities = c("FLAIR", "MPRAGE", "T2w"), 
                               visits = c(1,2)){
  modalities = unique(modalities)
  visits = as.numeric(visits)
  visits = sprintf("%02.0f", visits)
  v_ids = c(outer(ids, visits, paste, sep="-"))
  fnames = c(outer(v_ids, modalities, paste, sep="-"))
  fnames = paste0(fnames, ".nii.gz")
  df = data.frame(fname = fnames, stringsAsFactors = FALSE)
  ss = strsplit(df$fname, "-")
  df$id = sapply(ss, `[`, 1)
  df$visit = as.numeric(sapply(ss, `[`, 2))
  df$fname = file.path(df$id, df$fname)
  df$id = NULL
  filenames = mapply(function(x, y){
    pkg = paste0("kirby21.scan.", as.numeric(y))
    system.file(x, package=pkg)
  }, df$fname, df$visit)
  return(filenames)
}