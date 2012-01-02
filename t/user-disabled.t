#!perl -wT
use strict;

# 	"user-unknown-disabled.msg" => {
#		"reason" => "550 5.2.1 The email account that you tried to reach is     disabled. t11si6005099wes.103",
#		"smtp_code" => "550",
#	},

use Test::More tests => 6;

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

my $message = readfile('t/corpus/user-unknown-disabled.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');
ok($bounce->is_bounce, "This is a bounce");

my ($report) = $bounce->reports;

my $std_reason = $report->get("std_reason");

is($std_reason, "user_disabled", "std reason is user_disabled");

#   "polish-unknown.msg" => {
#		"reason" => "550 5.2.1 Mailbox not available / Konto niedostepne",
#		"smtp_code" => "550"
#	},

my $message3 = readfile('t/corpus/polish-unknown.msg');

my $bounce3 = Mail::DeliveryStatus::BounceParser->new($message3);

isa_ok($bounce3, 'Mail::DeliveryStatus::BounceParser');
ok($bounce3->is_bounce, "This is a bounce");

my ($report3) = $bounce3->reports;

my $std_reason3 = $report3->get("std_reason");

is($std_reason3, "user_disabled", "std reason is user_disabled");
