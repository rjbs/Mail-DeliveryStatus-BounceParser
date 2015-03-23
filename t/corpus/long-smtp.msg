X-Original-To: xyzzy@jeeves.example.com
Delivered-To: xyzzy@jeeves.example.com
Received: from smtprelay-h31.telenor.se (smtprelay-h31.telenor.se [213.150.131.4])
	by arc1.listbox.com (Postfix) with ESMTP id ECD7627631
	for <xyzzy@jeeves.example.com>; Sun, 22 Mar 2015 14:32:57 -0400 (EDT)
Received: from ipb5.telenor.se (ipb5.telenor.se [195.54.127.168])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id 1D01EDF75
	for <xyzzy@jeeves.example.com>; Sun, 22 Mar 2015 19:32:47 +0100 (CET)
X-SENDER-IP: [195.54.127.10]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2ADAQD7CQ9VmQp/NsODH4EVBlSCSkawPQaDNAGGA4dmgVsZAQSFMRA5gR5MAQEBAQEBEQEBAQEBBg0LBxQuhBkFCQ4JJgUHHQMCGycTAQYDAjMVJgQBGAQEiBIBCJI3jSqPTJRihFMMAR+BNYRYh3GBPwUDAQFLgjg7Eh2BG4ULgQ2CbYpqT4IeDIIMgmQ6gnaJOQaCWYNHgiQcgR4zPTEBAQMCgQSBOAEBAQ
X-IPAS-Result: A2ADAQD7CQ9VmQp/NsODH4EVBlSCSkawPQaDNAGGA4dmgVsZAQSFMRA5gR5MAQEBAQEBEQEBAQEBBg0LBxQuhBkFCQ4JJgUHHQMCGycTAQYDAjMVJgQBGAQEiBIBCJI3jSqPTJRihFMMAR+BNYRYh3GBPwUDAQFLgjg7Eh2BG4ULgQ2CbYpqT4IeDIIMgmQ6gnaJOQaCWYNHgiQcgR4zPTEBAQMCgQSBOAEBAQ
X-IronPort-AV: E=Sophos;i="5.11,447,1422918000"; 
   d="scan'208,217";a="899691157"
Received: from mm-proxy1.telenor.se ([195.54.127.10])
  by ipb5.telenor.se with ESMTP; 22 Mar 2015 19:32:46 +0100
Received: from mm-be1.telenor.se (10.81.11.4) by mm-proxy1.telenor.se (8.5.103)
        id 54DFD248011BBA17 for xyzzy@jeeves.example.com; Sun, 22 Mar 2015 19:32:46 +0100
Received: by mm-be1.telenor.se (8.5.128) id 54B4E9E60097BA3E for xyzzy@jeeves.example.com; Sun, 22 Mar 2015 19:32:46 +0100
From: Mail Delivery Service <Postmaster@example.net>
Subject: Delivery Status Notification
To: xyzzy@jeeves.example.com
Date: Sun, 22 Mar 2015 19:32:46 +0100
Message-ID: <54B4E9E60097BA3D@mm-be1.telenor.se>
X-CP-Transaction-ID: 54B4E9E6008C7C3C
X-CP-For: recipient@example.net
MIME-Version: 1.0
Content-Type: Multipart/Report; report-type=delivery-status; boundary="========/54B4E9E6008C7C3C/mm-be1.telenor.se"
X-Listbox-Original-Sender: Mail Delivery Service <Postmaster@example.net>
X-Jeeves-Tag: DD5DD666-D0C1-11E4-BA1C-A88BBC0905B1

This multi-part MIME message contains a Delivery Status Notification.
If you can see this text, your mail client may not be able to understand MIME
formatted messages or DSNs (see RFC 2045 through 2049 for general MIME
information and RFC 1891 through 1894 for DSN specific information).

--========/54B4E9E6008C7C3C/mm-be1.telenor.se
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

 - These recipients of your message have been processed by the mail server:
recipient@example.net; Failed; 4.4.7 (delivery time expired)



--========/54B4E9E6008C7C3C/mm-be1.telenor.se
Content-Type: Message/Delivery-Status

Reporting-MTA: dns; mm-be1.telenor.se
Received-from-MTA: dns; mm-proxy3.telenor.se (195.54.127.12)
Arrival-Date: Tue, 17 Mar 2015 19:32:05 +0100

Final-Recipient: rfc822;recipient@example.net
Action: Failed
Status: 4.4.7 (delivery time expired)

--========/54B4E9E6008C7C3C/mm-be1.telenor.se
Content-Type: Message/RFC822

Return-Path: <xyzzy@jeeves.example.com>
Received: from mm-proxy3.telenor.se (195.54.127.12) by mm-be1.telenor.se (8.5.128)
        id 54B4E9E6008C7C3C for recipient@example.net; Tue, 17 Mar 2015 19:32:05 +0100
Received: from ipb4.telenor.se (195.54.127.167) by mm-proxy3.telenor.se (8.5.103)
        id 54DFD91300D5104C for recipient@example.net; Tue, 17 Mar 2015 19:32:05 +0100
X-LISTENER: [mailgw.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0AiBgC8cghV/wTtSNBbgkNDUgZUgkZGuRiHZoFZGQEEhTFJgT1MAQEBAQEBfYQUAwIJDgkdBgMFAgULEgMFAgMBAgYKJxMBAgQDAgIDLhUGIAQBBBQEBIgOBQiSVZwGcIRogWuUZQEKAQEBAQEWBoE1jXoFAwEBS4I4DC8SHYEWhQuBDIJrimBPhDWCZDqCdIkzBYJVg2qCAhwUgQpOIjEBAQMCgQSBOAEBAQ
X-IPAS-Result: A0AiBgC8cghV/wTtSNBbgkNDUgZUgkZGuRiHZoFZGQEEhTFJgT1MAQEBAQEBfYQUAwIJDgkdBgMFAgULEgMFAgMBAgYKJxMBAgQDAgIDLhUGIAQBBBQEBIgOBQiSVZwGcIRogWuUZQEKAQEBAQEWBoE1jXoFAwEBS4I4DC8SHYEWhQuBDIJrimBPhDWCZDqCdIkzBYJVg2qCAhwUgQpOIjEBAQMCgQSBOAEBAQ
X-IronPort-AV: E=Sophos;i="5.11,418,1422918000"; 
   d="scan'208,217";a="768092764"
Received: from lb-ob1.listbox.com ([208.72.237.4])
  by ipb4.telenor.se with ESMTP; 17 Mar 2015 19:31:57 +0100
Received: from lb-ob1.listbox.com (localhost [127.0.0.1])
	by lb-ob1.listbox.com (Postfix) with ESMTP id C0DE512675
	for <recipient@example.net>; Tue, 17 Mar 2015 14:31:42 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=listbox.com; h=date
	:mime-version:content-type:message-id:subject:from:to:reply-to
	:list-id:list-help:list-unsubscribe:list-subscribe; s=launch;
	 bh=2lmA89Ph+N4GCF18JHdolQ3XjX0=; b=JIQlhRRTsmxYV8tyOIA33BsYDCqH
	ee3HWhJP+JDVibkm7XUrCWGP1WyJgGBpCZDyjNopvNa6neNY1tW3KJpwXw==
Received: from lb-ex1.localdomain (lb-ex1.int.icgroup.com [10.80.90.12])
	by lb-ob1.listbox.com (Postfix) with ESMTP id 9E5B112667
	for <recipient@example.net>; Tue, 17 Mar 2015 14:31:42 -0400 (EDT)
Received: from lb-ex1.int.icgroup.com (localhost [127.0.0.1])
	by lb-ex1.localdomain (Postfix) with ESMTP id 52169448BD6B
	for <recipient@example.net>; Tue, 17 Mar 2015 14:31:49 -0400 (EDT)
Date: Tue, 17 Mar 2015 14:31:30 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="1426617090.Ebeb8.93928"
Message-Id: <47F0E84C-CCC1-11E4-9F5F-EB6EAB8B1A2B@example.com>
Subject: =?UTF-8?B?Rm9sa2V0cyBCaW8gTWFsbcO2?=/Panora Nyhetsbrev #6:
 =?UTF-8?B?IFByZW1pw6RyIGbDtnIgRW4gbnkgZmlja3bDpG4gJiBUaGUgVHJpYmU=?=,
 =?UTF-8?B?IE1hdGluw6lrbGFzc2lrZXI=?=,
  Fatta Man presenterar The Mask You Live In
From: yourface@example.biz
To: recipient@example.net
X-Listbox-Composer: Listbox2::Composer v3
Reply-To: yourface@example.biz
List-ID: <Panora-Nyhetsbrev@example.com>
Precedence: list
X-Listbox-Post-Id: 20150317143136:47F0E84C-CCC1-11E4-9F5F-EB6EAB8B1A2B
Errors-To: xyzzy@jeeves.example.com

--1426617090.Ebeb8.93928
Date: Tue, 17 Mar 2015 14:31:29 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

--1426617090.Ebeb8.93928
Date: Tue, 17 Mar 2015 14:31:30 -0400
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
content-transfer-encoding: quoted-printable

<html>Hi.</html>=

--1426617090.Ebeb8.93928--

--========/54B4E9E6008C7C3C/mm-be1.telenor.se--

