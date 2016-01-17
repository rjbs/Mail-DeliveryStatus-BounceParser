#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test we can spot being blocked by spamassassin.

check_report(
    't/corpus/spam-rejection-uribl.msg',
    is_bounce  => 1,
    std_reason => 'spam'
);

done_testing;
