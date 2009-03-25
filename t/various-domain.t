#!perl -wT
use strict;

use Test::More tests => 12;

use Mail::DeliveryStatus::BounceParser;

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

# Loop through a bunch of "user unknown" reject messages from various
# providers / MTAs, as delivered by Sendmail, and make sure they give us
# what we want.

my %files_and_responses = (
  "sendmail-host-unknown.msg"                => {
    "reason"      => '550 Host unknown',
    "smtp_code"   =>  550,
    "recipient"   => 'recipient@#example.net'
  },
  "postfix-host-unknown.msg"                => {
    "reason"      => '[dest.example.com]: Name or service not known',
    "smtp_code"   =>  '',
    "recipient"   => 'bounce@dest.example.com'
  },
);

foreach my $file (keys %files_and_responses) {

  # just for debugging
  print "$file\n";
  my $smtp_code = $files_and_responses{$file}{"smtp_code"};
  my $reason    = $files_and_responses{$file}{"reason"};
  my $expected  = $files_and_responses{$file}{"recipient"};

  my $message = readfile("t/corpus/$file");

  my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

  isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

  ok($bounce->is_bounce, "it's a bounce, alright");

  my ($report) = $bounce->reports;

  # check that std_reason is user_unknown
  is($report->get('std_reason'), 'domain_error', "We got the right reason");

  # and that the message matches up
  is($report->get('reason'), $reason, "We got the right message");

  is($report->get('smtp_code'), $smtp_code, "We got the right smtp code");

  my ($address) = $bounce->addresses;
  $address      = lc($address);
  is($address, $expected, "the right bounced address is given");

}
