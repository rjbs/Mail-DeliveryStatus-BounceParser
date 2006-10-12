#!perl -wT
use strict;

use Test::More tests => 3;

use Mail::DeliveryStatus::BounceParser;

# Test parsing AOL "sender block" messages

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/aol-senderblock.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

ok($bounce->is_bounce, "it's a bounce, alright");

my ($report) = $bounce->reports;

is_deeply(
  [ $bounce->addresses ],
  [ 'mykewlaolacct@aol.com' ],
  "We've got the right address",
);

