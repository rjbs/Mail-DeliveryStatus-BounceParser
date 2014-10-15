use strict;
use 5.006;

use inc::Module::Install;

name          ('Mail-DeliveryStatus-BounceParser');
author        ('Ricardo SIGNES <rjbs@cpan.org>');
license       ('perl');
version_from  ('lib/Mail/DeliveryStatus/BounceParser.pm');

perl_version  ('5.006'); # rjbs refuses to continue supporting 5.00503!

requires		('MIME::Entity' => 5.418); # topic localization bug fixed
requires		("Mail::Header"	=> 2.04); # known to work with current version
test_requires	('Test::More' => 0.94); # known to work with current version

repository('https://gitorious.org/mail-deliverystatus-bounceparser-fork/mail-deliverystatus-bounceparser-fork');

WriteAll();
