#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

my @test_files = ( "user-unknown-disabled.msg", "polish-unknown.msg" );

for my $fn (@test_files) {
    subtest $fn => sub {
        check_report( "t/corpus/$fn", is_bounce => 1, std_reason => 'user_disabled' );
    };
}

done_testing;
