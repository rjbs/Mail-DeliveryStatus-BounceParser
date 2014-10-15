Delivered-To: automated-bounces+1ee6fcc4-0320-11e2-a271-ce28aea58548@email.example.com
Received: by 10.14.203.2 with SMTP id e2csp192126eeo;
        Thu, 20 Sep 2012 05:38:59 -0700 (PDT)
Received: by 10.216.243.203 with SMTP id k53mr1141238wer.90.1348144738958;
        Thu, 20 Sep 2012 05:38:58 -0700 (PDT)
Return-Path: <>
Received: from DB3EHSNDR001.sample2.com (db3outboundsmtppool2.messaging.microsoft.com. [94.245.120.124])
        by mx.google.com with ESMTPS id bd3si42013578wib.22.2012.09.20.05.38.58
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 20 Sep 2012 05:38:58 -0700 (PDT)
Received-SPF: neutral (google.com: 94.245.120.124 is neither permitted nor denied by best guess record for domain of DB3EHSNDR001.sample2.com) client-ip=94.245.120.124;
Authentication-Results: mx.google.com; spf=neutral (google.com: 94.245.120.124 is neither permitted nor denied by best guess record for domain of DB3EHSNDR001.sample2.com) smtp.mail=
Received: from db3outboundpool.messaging.microsoft.com (10.3.81.235) by
 DB3EHSNDR001.sample2.com (10.3.84.15) with Microsoft SMTP Server (TLS) id
 14.1.225.23; Thu, 20 Sep 2012 12:38:58 +0000
Received: from mail101-db3-R.sample2.com (10.3.81.232) by
 DB3EHSOBE002.sample2.com (10.3.84.22) with Microsoft SMTP Server id
 14.1.225.23; Thu, 20 Sep 2012 12:38:58 +0000
Received: by mail101-db3-R.sample2.com (Postfix)	id 4B521E021C; Thu, 20 Sep
 2012 12:38:58 +0000 (UTC)
Date: Thu, 20 Sep 2012 12:38:58 +0000
From: MAILER-DAEMON
Subject: Undelivered Mail Returned to Sender
To: <automated-bounces+1EE6FCC4-0320-11E2-A271-CE28AEA58548@email.example.com>
Auto-Submitted: auto-replied
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
	boundary="BEB1AE00EA.1348144738/mail101-db3-R.sample2.com"
Message-ID: <20120920123858.4B521E021C@mail101-db3-R.sample2.com>
Return-Path: <>

--BEB1AE00EA.1348144738/mail101-db3-R.sample2.com
Content-Description: Notification
Content-Type: text/plain; charset="us-ascii"

This is the mail system at host mail101-db3-R.sample2.com.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to postmaster.

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

                   The mail system

<fred.bloggs@sample.com>: host
    smtp-inbound-42016-mail1.customer.sample3.com[80.195.114.23] said: 550
    Error: SPAM-ID: h20030701-214001 Your email is probably spam. Please
    contact your email service provider. (in reply to end of DATA command)

--BEB1AE00EA.1348144738/mail101-db3-R.sample2.com
Content-Description: Delivery report
Content-Type: message/delivery-status

Reporting-MTA: dns; mail101-db3-R.sample2.com
X-Postfix-Queue-ID: BEB1AE00EA
X-Postfix-Sender: rfc822; automated-bounces+1EE6FCC4-0320-11E2-A271-CE28AEA58548@email.example.com
Arrival-Date: Thu, 20 Sep 2012 12:38:51 +0000 (UTC)

Final-Recipient: rfc822; fred.bloggs@sample.com
Original-Recipient: rfc822;fred.bloggs@sample.com
Action: failed
Status: 5.0.0
Remote-MTA: dns; smtp-inbound-42016-mail1.customer.sample3.com
Diagnostic-Code: smtp; 550 Error: SPAM-ID: h20030701-214001 Your email is
    probably spam. Please contact your email service provider.

--BEB1AE00EA.1348144738/mail101-db3-R.sample2.com
Content-Description: Undelivered Message
Content-Type: message/rfc822

Return-Path: <automated-bounces+1EE6FCC4-0320-11E2-A271-CE28AEA58548@email.example.com>
Received: from mail101-db3 (localhost [127.0.0.1])	by
 mail101-db3-R.sample2.com (Postfix) with ESMTP id BEB1AE00EA	for
 <fred.bloggs@sample.com>; Thu, 20 Sep 2012 12:38:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:94.236.45.212;KIP:(null);UIP:(null);IPV:NLI;H:admin1.example.co.uk;RD:admin1.example.co.uk;EFVD:NLI
X-SpamScore: 4
X-BigFish: vps4(z418bkzd6f1izz1202h1d1ah1d2ahzz17326ah8275dh172c6chz2fheh5fh668h839hd25h11b5h121eh1288h12a5h1155h)
Received-SPF: pass (mail101-db3: domain of email.example.com designates 94.236.45.212 as permitted sender) client-ip=94.236.45.212; envelope-from=automated-bounces+1EE6FCC4-0320-11E2-A271-CE28AEA58548@email.example.com; helo=admin1.example.co.uk ;ianomi.co.uk ;
Received: from mail101-db3 (localhost.localdomain [127.0.0.1]) by mail101-db3
 (MessageSwitch) id 1348144729792933_22140; Thu, 20 Sep 2012 12:38:49 +0000
 (UTC)
Received: from DB3EHSMHS001.sample2.com (unknown [10.3.81.243])	by
 mail101-db3.sample2.com (Postfix) with ESMTP id BD810220058	for
 <fred.bloggs@sample.com>; Thu, 20 Sep 2012 12:38:49 +0000 (UTC)
Received: from admin1.example.co.uk (94.236.45.212) by
 DB3EHSMHS001.sample2.com (10.3.87.101) with Microsoft SMTP Server id
 14.1.225.23; Thu, 20 Sep 2012 12:38:46 +0000
Received: by admin1.example.co.uk (Postfix, from userid 507)	id AF62E651347;
 Thu, 20 Sep 2012 13:38:46 +0100 (BST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: multipart/related; boundary="_----------=_1348144726147351370"
X-Mailer: MIME::Lite 3.027 (F2.78; T1.31; A2.08; B3.13; Q3.13)
Date: Thu, 20 Sep 2012 13:38:46 +0100
From: John Smith <john.smith@email.example.com>
Subject: Foo
X-Campaignid: example20100819.2
List-Unsubscribe: <http://www.exampleoffers.co.uk/unsubscribe.epl?uuid=1EE6FCC4-0320-11E2-A271-CE28AEA58548>
To: Fred Bloggs <fred.bloggs@sample.com>
Message-ID: <20120920123846.AF62E651347@admin1.example.co.uk>

--_----------=_1348144726147351370
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html

HTML

--_----------=_1348144726147351370--

--BEB1AE00EA.1348144738/mail101-db3-R.sample2.com--
