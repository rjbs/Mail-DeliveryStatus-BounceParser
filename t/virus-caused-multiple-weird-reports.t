#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test an issue where a non-bounce virus message is parsed as a bounce, and
# bogus binary strings in the message are identified as an email address.

# Originally returned 160 (!!) reports with bogus junk

check_report(
    't/corpus/virus-caused-multiple-weird-reports.msg',
    is_bounce => 1,
    reports   => 0
);

done_testing;
