#!perl -wT
use strict;

use Test::More tests => 2;

use Mail::DeliveryStatus::BounceParser;

# Test an issue where a non-bounce spam message is parsed as a bounce,
# and a URL in the message is identified as an email address.

# (Currently) returns two reports with bogus strings like:
# href="http://uFZxuoVI.fedeck.be?/x2Mw5PocSJohI3YhyzLgx2Mw9FoiAzYmI3o0yJLvI2YibQp0EUn&unsubscribe=recipient@example.com>">link</a
# href="mailto:recipient@example.com>",

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my $message = readfile('t/corpus/spam-bogus-email-in-report.msg');
my $bounce = Mail::DeliveryStatus::BounceParser->new($message);
isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

ok( not($bounce->reports), "No reports (good)");

