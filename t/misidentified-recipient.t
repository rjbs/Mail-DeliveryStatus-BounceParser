#!perl -wT
use strict;

use Test::More tests => 3;

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

my $message = readfile('t/corpus/misidentified-recipient.msg');
my $bounce = Mail::DeliveryStatus::BounceParser->new($message);
isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

ok($bounce->is_bounce, "It's a bounce, alright");

is_deeply(
	[ $bounce->addresses ],
	[ 'john.b@b.c'],
	"We've got the right address",
);
