#!perl -wT
use strict;

# Add 6 to this for each case you add to %files_and_responses
use Test::More tests => 174;

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

my %files_and_responses = (
  "att-via-sendmail.unknown.msg"                => {
    "reason"      =>
      '550 [SUSPEND] Mailbox currently suspended - Please contact correspondent directly',
    "smtp_code"   =>  550,
  },
  "comcast-via-sendmail.unknown.msg"            => {
    "reason"      =>
      '551 not our customer',
    "smtp_code"   =>  551,
  },
  "cox-via-sendmail.unknown.msg"                => {
    "reason"      =>
      '550 <recipient@example.net> recipient rejected',
    "smtp_code"   =>  550,
  },
  "generic-postfix-via-sendmail.unknown.msg"    => {
    "reason"      =>
      '550 5.1.1 <recipient@example.net>: Recipient address rejected: User unknown in local recipient table',
    "smtp_code"   =>  550,
  },
  "gmail-via-sendmail.unknown.msg"              => {
    "reason"      =>
  '550 5.7.1 No such user c18si2365148hub',
    "smtp_code"   =>  550,
  },
  "msn-via-sendmail.unknown.msg"                => {
    "reason"      =>
  '550 Requested action not taken: mailbox unavailable',
    "smtp_code"   =>  550,
  },
  "yahoo-via-sendmail.unknown.msg"              => {
    "reason"      =>
      '554 delivery error: dd Sorry your message to recipient@example.net cannot be delivered. This account has been disabled or discontinued [#102]. - mta330.mail.mud.yahoo.com',
    "smtp_code"   =>  554,
  },
  "hotmail-via-sendmail.unknown.msg"            => {
    "reason"      =>
      '550 Requested action not taken: mailbox unavailable',
    "smtp_code"   =>  550,
  },
  "domino.unknown.msg"                          => {
  # TODO = should return actual code / reason
    "reason"      =>
      'Your message

  Subject: Test Bounce

was not delivered to:',
    "smtp_code"   =>  '',
  },
  "aol.unknown.msg"                             => {
    "reason"      =>
      '550 MAILBOX NOT FOUND',
    "smtp_code"   =>  550,
  },
  "qmail.unknown.msg"                           => {
  # TODO = should return actual code / reason
    "reason"      =>
      "Hi. This is the qmail-send program at mail1.coqui.net.
I'm afraid I wasn't able to deliver your message to the following addresses.
This is a permanent error; I've given up. Sorry it didn't work out.",
    "smtp_code"   =>  '',
  },
  "exchange.unknown.msg"                        => {
  # TODO = should return actual code / reason
    "reason"      =>
      '',
    "smtp_code"   =>  '',
  },
  "novell-with-rhs.msg"                           => {
    # TODO = should (maybe) return actual reason
    "reason"      =>
      'The message that you sent was undeliverable to the following:',
    # Can't really get this since it DNE
    "smtp_code"   =>  '',
  },
  "yahoo-user-unknown.msg" => {
	  "reason" => '553 5.3.0 <recipient@example.net>... Address does not     exist',
	  "smtp_code" => "553",
  },
  "user-unknown-polish.msg" => {
	  # reason is a little ugly
	  "reason" => '501 5.1.3 Odbiorca <recipient@example.net> nie     istnieje / Recipient <recipient@example.net> does not exist',
	  "smtp_code" => "501",
	  },
  "me-user-unknown.msg" => {
	  "reason" => '550 5.1.6 recipient no longer on server: recipient@example.net',
	  "smtp_code" => "550",
  },
  "cam-unknown.msg" => {
	  "reason" => '550-<recipient@example.net> is not a known user on this     system; 550 see http://www.example.net/cs/email/bounce.html',
	  "smtp_code" => '550',
  },
  "rcpt-dne.msg" => {
	  "reason" => '554 Rcpt <recipient@example.net> does not exist',
	  "smtp_code" => "554",
  },
  "polish-unknown.msg" => {
		"reason" => "550 5.2.1 Mailbox not available / Konto niedostepne",
		"smtp_code" => "550"
	},
  "mailbox-unknown.msg" => {
		"reason" => "550 5.7.1 No mailbox found",
		"smtp_code" => "550",
	},
  "deactivated-mailbox.msg" => {
		"reason" => '551 <recipient@example.net> is a deactivated mailbox',
		"smtp_code" => "551",
	},
	"user-unknown-dne.msg" => {
		"reason" => "550 Recipient does not exist on this system",
		"smtp_code" => "550"
	},
	"badrcptto.msg" => {
		"reason" => "553 sorry, badrcptto(user mail-box not found) (#5.7.1)",
		"smtp_code" => "553",
	},
	"nomailbox.msg" => {
		"reason" => "550 ** No mail box available for this user **",
		"smtp_code" => "550",
	},
	"doesnotexist.msg" => {
		"reason" => '550 User [recipient@example.net] does not exist',
		"smtp_code" => "550",
	},
	"doesnotexist2.msg" => {
		"reason" => "550 Recipient does not exist",
		"smtp_code" => "550",
	},
	"user-unknown-disabled.msg" => {
		"reason" => "550 5.2.1 The email account that you tried to reach is     disabled. t11si6005099wes.103",
		"smtp_code" => "550",
	},
	"user-unknown-not-active.msg" => {
		"reason" => '550-recipient@example.net is not an active address at this     host (invalid FreeUK 550 username)',
		"smtp_code" => "550",
		},
	"user-unknown-not.msg" => {
		"reason" => '550 "recipient@example.net" is not a known user',
		"smtp_code" => "550",
		}
);

foreach my $file (keys %files_and_responses) {

  # just for debugging
  print "$file\n";
  my $smtp_code = $files_and_responses{$file}{"smtp_code"};
  my $reason    = $files_and_responses{$file}{"reason"};

  my $message = readfile("t/corpus/$file");

  my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

  isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

  ok($bounce->is_bounce, "it's a bounce, alright");

  my ($report) = $bounce->reports;

  # check that std_reason is user_unknown
  is($report->get('std_reason'), 'user_unknown', "We got the right reason");

  # and that the message matches up
  is($report->get('reason'), $reason, "We got the right message");

  is($report->get('smtp_code'), $smtp_code, "We got the right smtp code");

  my ($address) = $bounce->addresses;
  $address = lc($address);
  is($address, 'recipient@example.net', "the right bounced address is given");

}
