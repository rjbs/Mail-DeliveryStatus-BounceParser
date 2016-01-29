#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

for my $fn ( glob 't/corpus/quota*.msg' ) {
    subtest $fn => sub {
        check_report(
            $fn,
            is_bounce       => 1,
            std_reason      => 'over_quota',
            todo_std_reason => ( $fn =~ /quota-5/ ? 'not done yet' : undef )
        );
    };
}

done_testing;
