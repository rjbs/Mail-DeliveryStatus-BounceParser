#!perl -wT
use strict;

use Test::More tests => 4;

use Mail::DeliveryStatus::BounceParser;
use Data::Dumper;

# Test parsing AOL "recipient not accepting attachment" messages

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/aol.attachment.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

ok($bounce->is_bounce, "it's a bounce, alright");

my ($report) = $bounce->reports;

is_deeply(
  [ $bounce->addresses ],
  [ 'exampleuser@aol.com' ],
  "We've got the right address",
);

my $reason = $report->get("reason");

is($reason, "Your mail to the following recipients could not be delivered because they are not accepting mail with attachments or embedded images:", "reason is right");
