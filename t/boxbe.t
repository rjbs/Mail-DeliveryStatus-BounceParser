#!perl -wT
use strict;

use Test::More tests => 2;

use Mail::DeliveryStatus::BounceParser;

# Test parsing boxbe Challlenge/Response

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/boxbe-cr.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');
ok(!$bounce->is_bounce, "C/R messages are not bounces");
