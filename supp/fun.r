# små hjelpefunkjsjoner for shinyapp bioint

val <- function(lev) {
	lev <- levels(lev)
	lev <- lev[c(which(lev != 0), which(lev == 0))]
	lev
}

nam <- function(lev) {
	lev <- levels(lev)
	lev <- lev[c(which(lev != 0), which(lev == 0))]
	lev[lev == 0] <- "NA"
	lev
}
