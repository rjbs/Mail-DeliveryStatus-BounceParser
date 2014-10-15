#!perl -wT
use strict;

use Test::More tests => 2;

use Mail::DeliveryStatus::BounceParser;
use Data::Dumper;

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/autoreply.msg');

my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

TODO: {
	local $TODO = "Putting this in out of hope, but right now it looks hard to recognise as an autoreply";
	ok(!$bounce->is_bounce, "it's not a bounce, alright");
};
