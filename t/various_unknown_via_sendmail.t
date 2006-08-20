#!perl -wT
use strict;

use Test::More tests => 24;

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

foreach (<corpus/*_via_sendmail.unknown.msg>) {
  my $message = readfile('t/$_');

  my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

  isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

  ok($bounce->is_bounce, "it's a bounce, alright");

  is($bounce->get('std_reason'), 'user_unknown', "we got the right reason");

  is_deeply(
    [ $bounce->addresses ],
    [ 'recipient@example.net' ],
    "the right bounced address is given",
  );
}
