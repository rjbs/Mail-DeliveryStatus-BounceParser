#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test parsing boxbe Challenge/Response

check_report( 't/corpus/boxbe-cr.msg', is_bounce => 0 );

done_testing;
