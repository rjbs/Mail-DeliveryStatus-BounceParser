#!perl -wT
use strict;

use Test::More tests => 2;

use Mail::DeliveryStatus::BounceParser;

# Test an issue where binary image attachments were being parsed,
# resulting in tons of junk reports for each message.
# Fixes bug #20751

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/spam-with-image.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

ok( !($bounce->reports), "No reports (good)");

