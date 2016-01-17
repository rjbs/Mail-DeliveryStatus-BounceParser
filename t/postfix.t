#!perl -wT
use strict;

use Test::More tests => 7;

use Mail::DeliveryStatus::BounceParser;

use lib 't';
use TestBounceParser;


{
  my $message = readfile('t/corpus/postfix.msg');

  my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

  isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

  ok($bounce->is_bounce, "it's a bounce, alright");

  is_deeply(
    [ $bounce->addresses ],
    [ 'bounce@dest.example.com' ],
    "the right bounced address is given",
  );

  is(
    $bounce->orig_message_id,
    '<20060527213404.GN13012@mta.domain-1.com>',
    "the right bounced message id is given (but has angle-brackets)",
  );

  my $orig_message = <<'END_MESSAGE';
Received: by mta.domain-1.com (Postfix, from userid 1001)
	id 89BEE2E6069; Sat, 27 May 2006 21:34:04 +0000 (UTC)
Date: Sat, 27 May 2006 17:34:04 -0400
From: Ricardo SIGNES <sender@domain-2.org>
To: bounce@dest.example.com
Subject: asdf
Message-ID: <20060527213404.GN13012@mta.domain-1.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.11+cvs20060126


Test.
-- 
sender
END_MESSAGE

  is($bounce->orig_message->as_string, $orig_message, "got original message");
}

{
  my $message = readfile('t/corpus/postfix-orig.msg');

  {
    my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

    is_deeply(
      [ $bounce->addresses ],
      [ 'original@dest.example.com' ],
      "default behavior is to prefer original to final recipient",
    );
  }

  {
    my $bounce = Mail::DeliveryStatus::BounceParser->new(
      $message,
      { prefer_final_recipient => 1 },
    );

    is_deeply(
      [ $bounce->addresses ],
      [ 'final@dest.example.com' ],
      "...but we can request preference for final",
    );
  }
}
