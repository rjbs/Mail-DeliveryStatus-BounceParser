Delivered-To: automated-bounces+d51547e4-3535-11e1-9a08-d6b6d6ea5270@email.example.com
Received: by 10.52.111.104 with SMTP id ih8cs426414vdb;
        Mon, 2 Jan 2012 03:37:11 -0800 (PST)
Received: by 10.180.19.74 with SMTP id c10mr105125762wie.8.1325504229025;
        Mon, 02 Jan 2012 03:37:09 -0800 (PST)
Return-Path: <>
Received: from thing.example3.com (thing.example3.com. [196.33.120.15])
        by mx.google.com with ESMTP id ei1si35423807wid.95.2012.01.02.03.37.07;
        Mon, 02 Jan 2012 03:37:09 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of thing.example3.com designates 196.33.120.15 as permitted sender) client-ip=196.33.120.15;
Authentication-Results: mx.google.com; spf=pass (google.com: best guess record for domain of thing.example3.com designates 196.33.120.15 as permitted sender) smtp.mail=
Received: by thing.example3.com (Postfix)
	id ED3C4DE025C; Mon,  2 Jan 2012 13:37:01 +0200 (SAST)
Date: Mon,  2 Jan 2012 13:37:01 +0200 (SAST)
From: MAILER-DAEMON@example3.com (Mail Delivery System)
Subject: Undelivered Mail Returned to Sender
To: automated-bounces+D51547E4-3535-11E1-9A08-D6B6D6EA5270@email.example.com
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
	boundary="6A5B6DE0256.1325504221/thing.example3.com"
Content-Transfer-Encoding: 7bit
Message-Id: <20120102113701.ED3C4DE025C@thing.example3.com>

This is a MIME-encapsulated message.

--6A5B6DE0256.1325504221/thing.example3.com
Content-Description: Notification
Content-Type: text/plain

This is the Postfix program at host thing.example3.com.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to <postmaster>

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

			The Postfix program

<john.smith@example2.co.za>: host 196.33.120.18[196.33.120.18] said: 534
    SIZE=Message too big. (in reply to MAIL FROM command)

--6A5B6DE0256.1325504221/thing.example3.com
Content-Description: Delivery report
Content-Type: message/delivery-status

Reporting-MTA: dns; thing.example3.com
X-Postfix-Queue-ID: 6A5B6DE0256
X-Postfix-Sender: rfc822; automated-bounces+D51547E4-3535-11E1-9A08-D6B6D6EA5270@email.example.com
Arrival-Date: Mon,  2 Jan 2012 13:36:14 +0200 (SAST)

Final-Recipient: rfc822; john.smith@example2.co.za
Action: failed
Status: 5.0.0
Diagnostic-Code: X-Postfix; host 196.33.120.18[196.33.120.18] said: 534
    SIZE=Message too big. (in reply to MAIL FROM command)

--6A5B6DE0256.1325504221/thing.example3.com
Content-Description: Undelivered Message
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit

Received: from localhost (localhost.localdomain [127.0.0.1])
	by thing.example3.com (Postfix) with ESMTP id 6A5B6DE0256
	for <john.smith@example2.co.za>; Mon,  2 Jan 2012 13:36:14 +0200 (SAST)
Received: from thing.example3.com ([127.0.0.1])
	by localhost (thing.example3.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5kvuqTDCPnB for <john.smith@example2.co.za>;
	Mon,  2 Jan 2012 13:36:10 +0200 (SAST)
Received: from admin1.example.co.uk (admin1.example.co.uk [94.236.45.212])
	by thing.example3.com (Postfix) with ESMTP id A70ACDE025F
	for <john.smith@example2.co.za>; Mon,  2 Jan 2012 13:35:17 +0200 (SAST)
Received: by admin1.example.co.uk (Postfix, from userid 507)
	id BFD93650D6C; Mon,  2 Jan 2012 11:35:12 +0000 (GMT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: multipart/related; boundary="_----------=_1325504112319940"
X-Mailer: MIME::Lite 3.027 (F2.78; T1.31; A2.07; B3.13; Q3.13)
Date: Mon, 2 Jan 2012 11:35:12 +0000
From: Fred Bloggs <fred.bloggs@email.example.com>
From: foo
Subject: foo
List-Unsubscribe: <http://www.exampleoffers.co.uk/unsubscribe.epl?uuid=D51547E4-3535-11E1-9A08-D6B6D6EA5270>
To: John Smith <john.smith@example2.co.za>
Message-Id: <20120102113512.BFD93650D6C@admin1.example.co.uk>

This is a multi-part message in MIME format.

--_----------=_1325504112319940
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html

HTML

--_----------=_1325504112319940
Content-Disposition: inline; filename="foo.pdf"
Content-Transfer-Encoding: base64
Content-Type: application/pdf; name="foo.pdf"

PDF

--6A5B6DE0256.1325504221/thing.example3.com--
