#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test parsing AOL "sender block" messages

check_report(
    't/corpus/aol-senderblock.msg',
    is_bounce => 1,
    addresses => ['mykewlaolacct@aol.com']
);

done_testing;
