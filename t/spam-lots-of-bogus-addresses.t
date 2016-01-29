#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test an issue where a non-bounce spam message is parsed as a bounce,
# and strings in the message are (mis)identified as email addresses.

# (Currently) returns about 8 reports with bogus strings like:
# P@tchesreg
# P@&#241;k@ge
# etc.

check_report(
    't/corpus/spam-lots-of-bogus-addresses.msg',
    is_bounce => 1,
    reports   => 0
);

done_testing;
