#!perl -wT
use strict;

use Test::More tests => 9;

use Mail::DeliveryStatus::BounceParser;

# Test we can parse various messages without any warnings

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/warning-1.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');
ok($bounce->is_bounce, "This is a bounce");

my ($report) = $bounce->reports;

my $std_reason = $report->get("std_reason");

is($std_reason, "user_unknown", "std reason is user_unknown");

my $message2 = readfile('t/corpus/warning-2.msg');

my $bounce2 = Mail::DeliveryStatus::BounceParser->new($message2);

isa_ok($bounce2, 'Mail::DeliveryStatus::BounceParser');
ok($bounce2->is_bounce, "This is a bounce");

my ($report2) = $bounce2->reports;

my $std_reason2 = $report2->get("std_reason");

# FIXME: later obviously we'll fix this to be something better than "unknown"
# but for now it's the expected behaviour.
is($std_reason2, "unknown", "std reason is unknown");

my $message3 = readfile('t/corpus/warning-3.msg');
my $bounce3 = Mail::DeliveryStatus::BounceParser->new($message3);

isa_ok($bounce3, 'Mail::DeliveryStatus::BounceParser');
ok($bounce3->is_bounce, "This is a bounce");

my ($report3) = $bounce3->reports;

my $std_reason3 = $report3->get("std_reason");

is($std_reason3, "user_unknown", "std reason is user_unknown");
