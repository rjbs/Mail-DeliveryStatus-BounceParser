#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test we can spot being blocked by spamassassin.

my @files = glob('t/corpus/spam-rejection*.msg');

foreach my $fn (@files) {
    subtest $fn => sub {
        check_report( $fn, is_bounce => 1, std_reason => 'spam' );
    };
}

done_testing;
