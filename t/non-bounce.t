#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

sub check_one {
    my $fn = shift;
    subtest $fn => sub {
        check_report( $fn, is_bounce => 0 );
    };
}

check_one('t/corpus/aol-vacation.msg');

check_one('t/corpus/polish-autoreply.msg');

# Test parsing bluebottle Challenge/Response
check_one('t/corpus/bluebottle.msg');

# Test parsing boxbe Challenge/Response
check_one('t/corpus/boxbe-cr.msg');
check_one('t/corpus/boxbe-cr2.msg');
check_one('t/corpus/whitelist.msg');

done_testing;
