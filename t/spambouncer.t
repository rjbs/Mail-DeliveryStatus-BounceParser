#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test we can spot being blocked by spambouncer.

check_report(
    't/corpus/spambouncer.msg',
    is_bounce  => 1,
    std_reason => 'spam'
);

done_testing;
