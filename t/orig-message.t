#!perl -wT
use strict;

use Test::More tests => 12;

use Mail::DeliveryStatus::BounceParser;

use lib 't';
use TestBounceParser;


{
  my $message = readfile('t/corpus/postfix.msg');

  my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

  isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

  ok($bounce->is_bounce, "it's a bounce, alright");

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
  my $message = readfile('t/corpus/aol.unknown.msg');

  my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

  isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

  ok($bounce->is_bounce, "it's a bounce, alright");

  is(
    $bounce->orig_message_id,
    '<200606062115.k56LFe7d012436@somehost.example.com>',
    "the right bounced message id is given (but has angle-brackets)",
  );

  my $orig_headers = <<'END_MESSAGE';
Received: from  somehost.example.com (somehost.example.com [10.0.0.98]) by rly-yi03.mx.aol.com (v109.13) with ESMTP id MAILRELAYINYI34-7bc4485f93b290; Tue, 06 Jun 2006 17:53:00 -0400
Received: from somehost.example.com (localhost [127.0.0.1])
	by somehost.example.com (8.12.11.20060308/8.12.11) with ESMTP id k56LpQ9h031020
	for <recipient@example.net>; Tue, 6 Jun 2006 14:52:59 -0700
Received: (from sender@localhost)
	by somehost.example.com (8.12.11.20060308/8.12.11/Submit) id k56LFe7d012436
	for recipient@example.net; Tue, 6 Jun 2006 14:15:40 -0700
Date: Tue, 6 Jun 2006 14:15:40 -0700
Message-Id: <200606062115.k56LFe7d012436@somehost.example.com>
Content-Type: multipart/alternative;
 boundary="----------=_1149628539-8175-2121"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.415 (Entity 5.415)
From: Sender Address <sender@example.com>
To: Sender Address <sender@example.com>
Subject: Test Message
X-AOL-IP: 10.3.4.5
X-AOL-SCOLL-SCORE: 1:2:477151932:12348031
X-AOL-SCOLL-URL_COUNT: 86
END_MESSAGE

  is($bounce->orig_header->as_string, $orig_headers, "got original headers");
}

{
  my $message = readfile('t/corpus/qmail.unknown.msg');

  my $bounce = Mail::DeliveryStatus::BounceParser->new($message);

  isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');

  ok($bounce->is_bounce, "it's a bounce, alright");

  is(
    $bounce->orig_message_id,
    '<200608282008.k7SK8Bbu032023@somehost.example.com>',
    "the right bounced message id is given (but has angle-brackets)",
  );

  my $orig_message = <<'END_MESSAGE';
Return-Path: <sender@somehost.example.com>
Received: (qmail 7496 invoked from network); 28 Aug 2006 16:38:01 -0400
Received: from avas5.coqui.net ([196.28.61.131])
          (envelope-sender <sender@somehost.example.com>)
          by mail1.coqui.net (qmail-ldap-1.03) with SMTP
          for <recipient@example.net>; 28 Aug 2006 16:38:01 -0400
Received: from somehost.example.com ([64.156.13.103])
  by avas5.coqui.net with ESMTP; 28 Aug 2006 16:37:27 -0400
Received: from somehost.example.com (localhost [127.0.0.1])
	by somehost.example.com (8.12.11.20060308/8.12.11) with ESMTP id k7SKYZYD007776
	for <recipient@example.net>; Mon, 28 Aug 2006 13:37:26 -0700
Received: (from sender@localhost)
	by somehost.example.com (8.12.11.20060308/8.12.11/Submit) id k7SK8Bbu032023
	for recipient@example.net; Mon, 28 Aug 2006 13:08:11 -0700
Date: Mon, 28 Aug 2006 13:08:11 -0700
Message-Id: <200608282008.k7SK8Bbu032023@somehost.example.com>
Content-Type: multipart/alternative;
 boundary="----------=_1156795691-26218-2900"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.415 (Entity 5.415)
From: Sender Address <sender@example.com>
To: Sender Address <sender@example.com>
Subject: Test Bounce Message

This is a multi-part message in MIME format...

------------=_1156795691-26218-2900
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Plaintext part here.

------------=_1156795691-26218-2900
Content-Type: text/html
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd"><html>
  <head>
 <title>Test Bounce Message</title>

<body>
<b>Test HTML part here.</b>
</body>
</html>

------------=_1156795691-26218-2900--
END_MESSAGE

  is($bounce->orig_text, $orig_message, "got original message");
}
