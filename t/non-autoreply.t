#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

check_report( 't/corpus/non-autoreply.msg', is_bounce => 1 );

done_testing;
