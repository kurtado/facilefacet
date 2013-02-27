facilefacet
===========

Usage:
faceter.pl <facetfield> <timeslice>

Easy faceting of Elasticsearch indices with Perl. 

Simply run this script from the command line with one argument: facet field. You will be returned a list of the top ten terms, plus freqeuency.

Examples:

./faceter.pl uri
 (returns the top uris for documents in the collection)

./faceter.pl uri now-5m
 (returns the top uris in the last 5 minutes)

./faceter.pl addr now-4h
 (returns the top IP addresses accessing your site in the last 4 hours)
 
