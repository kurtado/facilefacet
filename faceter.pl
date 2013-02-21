#!/usr/bin/perl
use strict;
use ElasticSearch;

my $es_server = 'localhost:9200';
my $facet = $ARGV[0];
if (!$facet) {die "Please supply a facet term.\n";}
my $dt_period = $ARGV[1] || 'now-1h';

my $es = ElasticSearch->new(
               servers      => $es_server,   # default ’127.0.0.1:9200’
               transport    => 'http',                  # default ’http’
#               trace_calls  => 'log_file',
               no_refresh   => 0,
    ) || die "can't get new \$es\n";

print "Faceting on $facet\n";

my $result = $es->search(
    facets  => {
	my_facet => {
	    terms => { field => $facet  },
	    facet_filterb => { 
		_timestamp => { 'gte' => $dt_period },
	    },
	}
    }
    );

foreach my $res (@{$result->{'facets'}->{'my_facet'}->{'terms'}}) {
    print "$res->{'term'}: $res->{'count'}\n";
}
