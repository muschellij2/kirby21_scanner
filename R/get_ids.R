#' @name get_ids
#' @title Get a list of the IDs
#'
#' @description Return the IDs for the people scanned
#' @export
get_ids = function(){
  data(kirby21_demog)
  return(unique(kirby21_demog$Subject_ID))
}