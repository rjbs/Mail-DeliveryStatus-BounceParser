#!perl -wT
use strict;

use Test::More tests => 16;
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

my @bad_addrs = ('enI@rgement',          # yay spammers
                 'ide@$',
                 'embarr@$sment',
                 'href="http://mukrasa.info/del.php?mail=address@example.com',  # We don't want the whole thing
                 'MYADDRESS@YAHOO',      # Invalid domain name 
                 'Person@!yahoo.com',    # invalid char in hostname
                 'face="@r1aI"',         # more HTML garbage
                 'Amig@:/FONT></P',      # yet more
                );

like($_, $regex , "\"$_\" is Ok") for @ok_addrs;
unlike($_, $regex , "\"$_\" is Ok") for @bad_addrs;

# This caused some problems, initially
my $addr;
my $string = 'RCPT TO:<luser@example.com>:';
if ($string =~ $regex) {
  $addr = $1;
}
is($addr, 'luser@example.com', "We got the right address");
