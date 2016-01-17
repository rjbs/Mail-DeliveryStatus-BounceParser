package TestBounceParser;

use warnings;
use strict;

use Test::More;
use Mail::DeliveryStatus::BounceParser;

use Exporter 'import';
our @EXPORT = qw(readfile check_report);

# FH because we're being backcompat to pre-lexical
sub readfile {
    my $fn = shift;
    open FH, "$fn" or die $!;
    local $/;
    my $text = <FH>;
    close FH;
    return $text;
}

sub check_report {
    my ( $filename, %expectations ) = @_;

    my $message = readfile($filename);
    my $bounce  = Mail::DeliveryStatus::BounceParser->new($message);
    isa_ok( $bounce, 'Mail::DeliveryStatus::BounceParser' );
    my ($report) = $bounce->reports;

TODO: {
        local $TODO = $expectations{todo_is_bounce};
        is( $bounce->is_bounce,
            $expectations{is_bounce},
            'is_bounce is correct'
        );
    }

    if ( exists $expectations{reports} ) {
        my $cnt = $expectations{reports};
        cmp_ok( $bounce->reports, '==', $cnt, "Found $cnt reports" );
    }

    if ( my $addrs = $expectations{addresses} ) {
        my $cnt = $expectations{addresses};
        cmp_ok( $bounce->addresses, '==', @$addrs,
            'found correct number of addresses' );
        is_deeply( [ map {lc} $bounce->addresses ],
            $addrs, 'addresses are correct' );
    }

TODO: {
        local $TODO = $expectations{todo_std_reason};
        if ( my $std_reason = $expectations{std_reason} ) {
            is( $report->get('std_reason'),
                $std_reason, "std reason is $std_reason" );
        }
    }

    if ( my $code = $expectations{smtp_code} ) {
        is( $report->get('smtp_code'), $code, 'smtp_code is correct' );
    }

    if ( my $status = $expectations{status} ) {
        is( $report->get('Status'), $status, 'status code is correct' );
    }

    if ( my $expected_reason = $expectations{reason} ) {
        my $reason = $report->get('reason');
        $expected_reason =~ s/\s//g;
        $reason =~ s/\s//g;
        is( $reason, $expected_reason, 'reason is right' );
    }

    if ( my $omid = $expectations{orig_message_id} ) {
        is( $bounce->orig_message_id, $omid,
            'the right bounced message id is given' );
    }

    return $bounce;
}

1;
