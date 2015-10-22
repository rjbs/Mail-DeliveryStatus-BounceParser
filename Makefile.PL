use strict;
use 5.6.0;
use ExtUtils::MakeMaker;

my $mm_ver = ExtUtils::MakeMaker->VERSION;

WriteMakefile(
  AUTHOR       => 'IC Group',
  NAME         => 'Mail::DeliveryStatus::BounceParser',
  VERSION_FROM => './lib/Mail/DeliveryStatus/BounceParser.pm',
  LICENSE => "perl",
  PREREQ_PM    => {
    'MIME::Entity' => 5.418, # topic localization bug fixed
    "Mail::Header" => 2.04, # known to work with current version
    ($mm_ver >= 6.64 ? () : ('Test::More' => 0.94)),
  },

  ($mm_ver >= 6.48
      ? (MIN_PERL_VERSION => 5.6.0)
      : ()
  ),

  ($mm_ver < 6.64 ? () : (TEST_REQUIRES => { 'Test::More' => 0.94 })),

  ($mm_ver < 6.46 ? () : (META_MERGE => {
    'meta-spec' => { version => 2 },
    dynamic_config => 1,
    resources       => {
      homepage      => 'https://github.com/rjbs/Mail-DeliveryStatus-BounceParser',
      repository    => {
         url        => 'https://github.com/rjbs/Mail-DeliveryStatus-BounceParser.git',
         web        => 'https://github.com/rjbs/Mail-DeliveryStatus-BounceParser',
         type       => 'git',
      },
      bugtracker    => {
         web        => 'https://github.com/rjbs/Mail-DeliveryStatus-BounceParser/issues',
      },
      x_IRC         => 'irc://irc.perl.org/#email',
    },
  })),
);

