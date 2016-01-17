#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test parsing bluebottle Challenge/Response
check_report( 't/corpus/whitelist.msg', is_bounce => 0 );

done_testing;
