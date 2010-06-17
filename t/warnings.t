#!perl -wT
use strict;

use Test::More tests => 23;

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

my $message4 = readfile('t/corpus/warning-4.msg');
my $bounce4 = Mail::DeliveryStatus::BounceParser->new($message4);

isa_ok($bounce4, 'Mail::DeliveryStatus::BounceParser');
ok($bounce4->is_bounce, "This is a bounce");

my ($report4) = $bounce4->reports;

my $std_reason4 = $report4->get("std_reason");

is($std_reason4, "unknown", "std reason is unknown");

my $message5 = readfile('t/corpus/warning-5.msg');
my $bounce5 = Mail::DeliveryStatus::BounceParser->new($message5);

isa_ok($bounce5, 'Mail::DeliveryStatus::BounceParser');
ok($bounce5->is_bounce, "This is a bounce");

my ($report5) = $bounce5->reports;

# FIXME: This is actually wrong, but documents current behaviour
# it should give a report!
is($report5, undef, "report is missing");

my $message6 = readfile('t/corpus/warning-6.msg');
my $bounce6 = Mail::DeliveryStatus::BounceParser->new($message6);

isa_ok($bounce6, 'Mail::DeliveryStatus::BounceParser');
ok(!$bounce6->is_bounce, "This is not a bounce");

my $message7 = readfile('t/corpus/warning-7.msg');
my $bounce7 = Mail::DeliveryStatus::BounceParser->new($message7);

isa_ok($bounce7, 'Mail::DeliveryStatus::BounceParser');
ok($bounce7->is_bounce, "This is a bounce");

my ($report7) = $bounce7->reports;

my $std_reason7 = $report7->get("std_reason");

is($std_reason7, "over_quota", "std reason is over_quota");

my $message8 = readfile('t/corpus/warning-8.msg');
my $bounce8 = Mail::DeliveryStatus::BounceParser->new($message8);

isa_ok($bounce8, 'Mail::DeliveryStatus::BounceParser');

TODO: {
  local $TODO = "Not detected correctly yet";

  ok($bounce8->is_bounce, "This is a bounce");
  my ($report8) = $bounce8->reports;
  
  if (defined $report8) {
	my $std_reason8 = $report8->get("std_reason");
	is($std_reason8, "over_quota", "std reason is over_quota");
  } else {
	fail("report8 should be defined");
  }
}
