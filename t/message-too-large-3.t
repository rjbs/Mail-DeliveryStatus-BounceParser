#!perl -wT
use strict;

use Test::More tests => 3;

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

my $message = readfile('t/corpus/message-too-large-3.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');
ok($bounce->is_bounce, "It's a bounce");

my ($report) = $bounce->reports;

my $std_reason = $report->get("std_reason");

is($std_reason, "message_too_large", "std reason is message_too_large");
