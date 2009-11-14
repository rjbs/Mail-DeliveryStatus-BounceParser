#!/usr/bin/perl -w

use strict;

# in a separate test file
use Test::More;

eval { require Test::Kwalitee; Test::Kwalitee->import() };

plan( skip_all => 'Test::Kwalitee not installed; skipping' ) if $@;
