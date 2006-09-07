#!perl -wT
use strict;

use Test::More tests => 13;
use Mail::DeliveryStatus::BounceParser;

my $regex = $Mail::DeliveryStatus::BounceParser::EMAIL_ADDR_REGEX;

my @ok_addrs = ('TEST-ING@example.com',
                'my_email_address@example.net',
                'fakeaddress.123@us.example.com',
                'bogus@example.co.uk',
                'not-arealaddress@emh15.invalid.army.mil',
                '"recipient:lycos.com"@mail.lycos.com-us4cluster7.as.int',
                '&-@no.spam.example.com'
                );

my @bad_addrs = ('enI@rgement',         # yay spammers
                 'href="http://mukrasa.info/del.php?mail=address@example.com',  # We don't want the whole thing
                 'IMCEAX400-c=US+3Ba=+20+3Bp=Ticketmaster+3Bo=Pasadena+3Bdda+3ASMTP=KAZAM+40CITYSEARCH+2ECOM+3B@Ticketmaster.com', # long URL
                 'MYADDRESS@YAHOO',      # Invalid domain name 
                 'Person@!yahoo.com',    # invalid char in hostname
                 'face="@r1aI"'          # more HTML garbage
                );

like($_, $regex , "\"$_\" is Ok") for @ok_addrs;
unlike($_, $regex , "\"$_\" is Ok") for @bad_addrs;

