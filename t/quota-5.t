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

my $message = readfile('t/corpus/quota-5.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');
ok($bounce->is_bounce, "It's a bounce");

my ($report) = $bounce->reports;

my $std_reason = $report->get("std_reason");

TODO: {
	local $TODO = "not done yet";
	is($std_reason, "over_quota", "std reason is over_quota");
};
