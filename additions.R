"additions" <-
function(objnames = dsetnames)
{
	newnames <- objects()
	existing <- as.logical(match(newnames, objnames, nomatch = 0))
	newnames[!existing]
}
