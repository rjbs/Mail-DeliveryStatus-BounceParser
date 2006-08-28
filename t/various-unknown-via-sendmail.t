#!perl -wT
use strict;

use Test::More tests => 48;

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

# Loop through a bunch of "user unknown" reject messages from various
# providers / MTAs, as delivered by Sendmail, and make sure they give us
# what we want.

my %files_and_msgs = (
  "att-via-sendmail.unknown.msg"                =>
  '550 [SUSPEND] Mailbox currently suspended - Please contact correspondent directly',
  "comcast-via-sendmail.unknown.msg"            =>
  '551 not our customer',
  "cox-via-sendmail.unknown.msg"                =>
  '550 <recipient@example.net> recipient rejected',
  "generic-postfix-via-sendmail.unknown.msg"    =>
  '550 5.1.1 <recipient@example.net>: Recipient address rejected: User unknown in local recipient table',
  "gmail-via-sendmail.unknown.msg"              =>
  '550 5.7.1 No such user c18si2365148hub',
  "msn-via-sendmail.unknown.msg"                =>
  '550 Requested action not taken: mailbox unavailable',
  "yahoo-via-sendmail.unknown.msg"              =>
  '554 delivery error: dd Sorry your message to recipient@example.net cannot be delivered. This account has been disabled or discontinued [#102]. - mta330.mail.mud.yahoo.com',
  "hotmail-via-sendmail.unknown.msg"            =>
  '550 Requested action not taken: mailbox unavailable'
);

while (my ($file, $msg) = each(%files_and_msgs)) {

  my $message = readfile("t/corpus/$file");

  my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

  isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

  ok($bounce->is_bounce, "it's a bounce, alright");

  my ($report) = $bounce->reports;

  # check that std_reason is user_unknown
  is($report->get('std_reason'), 'user_unknown', "We got the right reason");

  # and that the message matches up
  is($report->get('reason'), $msg, "We got the right message");

  my ($smtp_code) = (split(/\s/,$msg))[0];
  is($report->get('smtp_code'), $smtp_code, "We got the right smtp code");

  is_deeply(
    [ $bounce->addresses ],
    [ 'recipient@example.net' ],
    "the right bounced address is given",
  );

}
