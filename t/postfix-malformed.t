#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test a postfix message where we got a DNS failure
# not marked as domain_error before this test added

check_report(
    't/corpus/postfix-malformed.msg',
    is_bounce       => 1,
    addresses       => ['exampleuser@yyahoo.com'],
    orig_message_id => '<42@server4.example.co.uk>',
    std_reason      => 'domain_error'
);

done_testing;
