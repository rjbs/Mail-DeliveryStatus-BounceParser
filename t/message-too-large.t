#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

for my $fn ( glob 't/corpus/message-too-large*.msg' ) {
    subtest $fn => sub {
        check_report(
            $fn,
            is_bounce  => 1,
            std_reaons => 'message_too_large'
        );
    };
}

done_testing;
