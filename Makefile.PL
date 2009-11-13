use strict;

use inc::Module::Install;

name          ('Mail-DeliveryStatus-BounceParser');
author        ('Ricardo SIGNES <rjbs@cpan.org>');
license       ('perl');
version_from  ('lib/Mail/DeliveryStatus/BounceParser.pm');

# unknown reason, inherited from 1.5 and before
perl_version  ('5.00503');

requires		('MIME::Entity' => 5.418); # topic localization bug fixed
requires		("Mail::Header"	=> 2.04); # known to work with current version
test_requires	('Test::More' => 0.94); # known to work with current version

repository('http://github.com/rjbs/mail-deliverystatus-bounceparser');

WriteAll();
