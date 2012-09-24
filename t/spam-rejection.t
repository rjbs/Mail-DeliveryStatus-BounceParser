#!perl -wT
use strict;

use Test::More tests => 114;

use Mail::DeliveryStatus::BounceParser;

# Test we can spot being blocked by spamassassin.

# FH because we're being backcompat to pre-lexical
sub readfile {
  my $fn = shift;
  open FH, "$fn" or die "Couldn't open $fn:" . $!;
  local $/;
  my $text = <FH>;
  close FH;
  return $text;
}

my @files = ("spam-rejection.msg",
	     "spam-rejection2.msg",
	     "spam-rejection3.msg",
	     "spam-rejection4.msg",
	     "spam-rejection5.msg",
	     "spam-rejection6.msg",
	     "spam-rejection7.msg",
	     "spam-rejection8.msg",
	     "spam-rejection9.msg",
	     "spam-rejection10.msg",
	     "spam-rejection11.msg",
	     "spam-rejection12.msg",
	     "spam-rejection13.msg",
	     "spam-rejection14.msg",
	     "spam-rejection15.msg",
	     "spam-rejection16.msg",
	     "spam-rejection17.msg",
	     "spam-rejection18.msg",
	     "spam-rejection19.msg",
	     "spam-rejection20.msg",
	     "spam-rejection21.msg",
	     "spam-rejection22.msg",
	     "spam-rejection23.msg",
	     "spam-rejection24.msg",
	     "spam-rejection25.msg",
	     "spam-rejection26.msg",
	     "spam-rejection27.msg",
	     "spam-rejection28.msg",
	     "spam-rejection29.msg",
	     "spam-rejection30.msg",
	     "spam-rejection31.msg",
	     "spam-rejection32.msg",
	     "spam-rejection33.msg",
	     "spam-rejection34.msg",
		 "spam-rejection35.msg",
		 "spam-rejection36.msg",
		 "spam-rejection37.msg",
		 "spam-rejection38.msg"
    );

foreach my $file (@files) {
    my $message = readfile("t/corpus/${file}");
    
    my $bounce = Mail::DeliveryStatus::BounceParser->new($message);
    
    isa_ok($bounce, 'Mail::DeliveryStatus::BounceParser');
    ok($bounce->is_bounce, "This is a bounce");
    
    my ($report) = $bounce->reports;
    
    my $std_reason = $report->get("std_reason");
    
    is($std_reason, "spam", "std reason is spam");
}
