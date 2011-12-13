#!perl -wT
use strict;

use Test::More tests => 4;

use Mail::DeliveryStatus::BounceParser;

# Test we can spot being blocked by spamassassin.

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/malformed-dns.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');
ok($bounce->is_bounce, "This is a bounce");

my ($report) = $bounce->reports;

my $std_reason = $report->get("std_reason");

is($std_reason, "domain_error", "std reason is domain_error");

is($report->get("Status"), "5.4.4", "check status code is extracted ok");
