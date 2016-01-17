#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Loop through a bunch of "user unknown" reject messages from various
# providers / MTAs, as delivered by Sendmail, and make sure they give us
# what we want.

my %files_and_responses = (
    "sendmail-host-unknown.msg" => {
        "reason"    => '550 Host unknown',
        "smtp_code" => 550,
        "recipient" => 'recipient@#example.net'
    },
    "postfix-host-unknown.msg" => {
        "reason"    => '[dest.example.com]: Name or service not known',
        "smtp_code" => 500,
        "recipient" => 'bounce@dest.example.com'
    },
    "no-such-domain.msg" => {
        "reason" =>
            '550 No such domain at this location (recipient@example.net)',
        "smtp_code" => "550",
        "recipient" => 'recipient@example.net',
    },
);

foreach my $file ( keys %files_and_responses ) {
    subtest $file => sub {
        my $smtp_code = $files_and_responses{$file}{"smtp_code"};
        my $reason    = $files_and_responses{$file}{"reason"};
        my $expected  = $files_and_responses{$file}{"recipient"};

        check_report(
            "t/corpus/$file",
            is_bounce  => 1,
            std_reason => 'domain_error',
            reason     => $reason,
            smtp_code  => $smtp_code,
            addresses  => [$expected]
        );

    };
}

done_testing;
