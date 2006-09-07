#!perl -wT
use strict;

use Test::More tests => 3;

use Mail::DeliveryStatus::BounceParser;

# Test an issue reported by Chris Dragon, where a bounce generated by
# the IIS SMTP service generates bounces with 2 "\n"s between
# recipients, causing MBP to only "see" one report.

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/iis-multiple-bounce.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

my (@addresses) = $bounce->addresses;
print "addresses: @addresses\n";
is($#addresses, 3, "We want 4 bounces");
is($addresses[2], 'bounced3@example.net', "One is the right address");
