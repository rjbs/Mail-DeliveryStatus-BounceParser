#!perl -wT
use strict;

use Test::More tests => 5;

use Mail::DeliveryStatus::BounceParser;

# Test a postfix message where we got a DNS failure
# not marked as domain_error before this test added

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/postfix-malformed.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

ok($bounce->is_bounce, "it's a bounce, alright");

is_deeply(
   [ $bounce->addresses ],
   [ 'exampleuser@yyahoo.com' ],
   "the right bounced address is given",
);

is(
  $bounce->orig_message_id,
  '<42@server4.example.co.uk>',
  "the right bounced message id is given (but has angle-brackets)",
);

my ($report) = $bounce->reports;

is(
	$report->get("std_reason"),
	"domain_error",
	"standard reason is right"
);
