#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test an issue where binary image attachments were being parsed,
# resulting in tons of junk reports for each message.
# Fixes bug #20751

check_report( 't/corpus/spam-with-image.msg', is_bounce => 1, reports => 0 );

done_testing;
