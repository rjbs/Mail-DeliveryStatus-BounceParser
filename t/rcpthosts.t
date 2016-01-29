#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

check_report(
    't/corpus/rcpthosts.msg',
    is_bounce  => 1,
    std_reason => 'domain_error'
);

done_testing;
