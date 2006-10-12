#!perl -wT
use strict;

use Test::More tests => 2;

use Mail::DeliveryStatus::BounceParser;

# Test an issue where a non-bounce virus message is parsed as a bounce, and
# bogus binary strings in the message are identified as an email address.

# Originally returned 160 (!!) reports with bogus junk

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/virus-caused-multiple-weird-reports.msg');
my $bounce = Mail::DeliveryStatus::BounceParser->new($message);
isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

ok( not($bounce->reports), "No reports (good)");

