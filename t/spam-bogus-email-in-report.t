#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

# Test an issue where a non-bounce spam message is parsed as a bounce,
# and a URL in the message is identified as an email address.

# (Currently) returns two reports with bogus strings like:
# href="http://uFZxuoVI.fedeck.be?/x2Mw5PocSJohI3YhyzLgx2Mw9FoiAzYmI3o0yJLvI2YibQp0EUn&unsubscribe=recipient@example.com>">link</a
# href="mailto:recipient@example.com>",

check_report(
    't/corpus/spam-bogus-email-in-report.msg',
    is_bounce => 1,
    reports   => 0
);

done_testing;
