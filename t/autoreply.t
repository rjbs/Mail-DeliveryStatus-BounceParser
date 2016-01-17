#!perl -wT
use strict;

use Test::More;

use lib 't';
use TestBounceParser;

check_report(
    't/corpus/autoreply.msg',
    is_bounce => 0,
    todo_is_bounce =>
        'Putting this in out of hope, but right now it looks hard to recognise as an autoreply'
);

done_testing;
