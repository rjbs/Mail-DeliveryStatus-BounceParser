#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test parsing AOL "recipient not accepting attachment" messages

my $expected_reason =
    "Your mail to the following recipients could not be delivered because they are not accepting mail with attachments or embedded images:";

check_report(
    't/corpus/aol.attachment.msg',
    is_bounce => 1,
    addresses => ['exampleuser@aol.com'],
    reason    => $expected_reason
);

done_testing;
