#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test we can spot being blocked by spamassassin.

check_report(
    't/corpus/malformed-dns.msg',
    is_bounce  => 1,
    std_reason => 'domain_error',
    status     => '5.4.4'
);

done_testing;
