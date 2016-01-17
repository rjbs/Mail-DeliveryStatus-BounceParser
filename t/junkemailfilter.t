#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

check_report(
    't/corpus/junkemailfilter.msg',
    is_bounce  => 1,
    std_reason => 'spam'
);

done_testing;
