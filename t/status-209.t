#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Make sure we don't interpret part of an IP address as a status code
# See bug #20734

check_report(
    't/corpus/postfix-smtp-550.msg',
    is_bounce => 1,
    smtp_code => 550
);

done_testing;
