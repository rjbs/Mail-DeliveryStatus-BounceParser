#!perl -wT
use strict;

use Test::More tests => 2;

use Mail::DeliveryStatus::BounceParser;

# Test an issue where a non-bounce spam message is parsed as a bounce,
# and strings in the message are (mis)identified as email addresses.

# (Currently) returns about 8 reports with bogus strings like:
# P@tchesreg
# P@&#241;k@ge
# etc.

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/spam-lots-of-bogus-addresses.msg');
my $bounce = Mail::DeliveryStatus::BounceParser->new($message);
isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

TODO: {

  local $TODO = "Haven't started fixing this one yet";
  ok( !($bounce->reports), "No reports (good)");

}
