#' Read a Morpheo Data Format (MDF) directory to a list.
#'
#' @references P. Bouchequet, D. Jin, G. Solelhac, M. Chennaoui, D. Leger, "Morpheo Data Format (MDF), un nouveau format de données simple, robuste et performant pour stocker et analyser les enregistrements de sommeil", Médecine du Sommeil, vol. 15, n 1, p. 48‑49, march 2018.
#' @param mdfPath character. MDF path.
#' @param channels character. Channels to read.
#' @param metadata boolean. Read or not the metadata.
#' @return A list.
#' @export
read_mdf <- function(mdfPath, channels = c(NA), metadata = TRUE) {
  
  # Init list
  mdf <- list()
  
  # Filter channels to read
  mdfchannels <- list.dirs(mdfPath,full.names = FALSE)[-1]
  if (length(channels) > 0){
    if (!is.na(channels[1])){
      mdfchannels <- mdfchannels[mdfchannels %in% channels]
    }
  } else {
    mdfchannels <- c()
  }
  
  for (channel in mdfchannels){
    mdf[["channels"]][[channel]][["metadata"]] <- jsonlite::read_json(
      paste0(mdfPath,"/",channel,"/metadata.json"))
    mdf[["channels"]][[channel]][["signal"]] <- readBin(
      con = paste0(mdfPath,"/",channel,"/data.bin"),
      what = "numeric",
      endian = "little",
      n = mdf[["channels"]][[channel]][["metadata"]]$sLength,
      size = 4)
  }
  
  # Read metadata
  if(metadata){
    metadataPath <- paste0(mdfPath,"/metadata.json")
    if(file.exists(metadataPath)){
      mdf[["metadata"]] <- jsonlite::read_json(metadataPath)
    }
  }
  
  eventsPath <- paste0(mdfPath,"/events.json")
  if(file.exists(eventsPath)){
    mdf[["events"]] <- jsonlite::read_json(eventsPath,simplifyVector = TRUE)
    mdf[["events"]]$begin <- as.POSIXlt(mdf[["events"]]$begin)
    mdf[["events"]]$end <- as.POSIXlt(mdf[["events"]]$end)
  }
  
  return(mdf)
}
