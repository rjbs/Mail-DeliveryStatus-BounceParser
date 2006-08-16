#!perl -wT
use strict;

use Test::More 'no_plan';

use Mail::DeliveryStatus::BounceParser;

# Make sure we don't interpret part of an IP address as a status code
# See bug #20734

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/postfix-smtp-550.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

ok($bounce->is_bounce, "it's a bounce, alright");

my ($report) = $bounce->reports;

is($report->get('smtp_code'), 550, "we got the right smtp code");

