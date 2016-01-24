package TestBounceParser;

=encoding utf8

=head1 NAME

TestBounceParser - utility functions for L<Mail::DeliveryStatus::BounceParser>'s unittests

=head1 SYNOPSIS

  use TestBounceParser;

  check_report('file-in-corpus.msg',
    is_bounce => 1,
    addresses => [qw(foo@example.com bar@example.com)],
    std_reason => 'domain_error',
    smtp_code => 550
  );

=head1 EXPORTED FUNCTIONS

=cut

use warnings;
use strict;

use Test::More;
use Mail::DeliveryStatus::BounceParser;

use Exporter 'import';
our @EXPORT = qw(readfile check_report);

=head2 readfile

  my $content = readfile('path/to_file.msg');

Returns the content of the file passed as argument.

=cut

# FH because we're being backcompat to pre-lexical
sub readfile {
    my $fn = shift;
    open FH, "$fn" or die $!;
    local $/;
    my $text = <FH>;
    close FH;
    return $text;
}

=head2 check_report

  my $bounce = check_report($filename, %expectations);

The following keys are supported in C<%expectations>:

=over 4

=item is_bounce

whether the message is expected to be a bounce

=item reports

the number of reports we are expecting

=item addresses

an Arrayref to the list of addresses we are expecting

=item smtp_code

the SMTP code we are expecting (e.g. "554")

=item status

the status code we are expecting (e.g. "5.4.4")

=item reason

the reason string we are expecting (e.g. "550 Host unknown")

=item orig_message_id

the parsed original message id we are expecting

=item todo_is_bounce

when set, the is_bounce check is guarded in a TODO block

=item todo_std_reason

when set, the std_reason check is guarded in a TODO block

=back

=cut

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

=head1 AUTHOR

Philipp Gortan <gortan@cpan.org>

=cut
