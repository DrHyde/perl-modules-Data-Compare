#!/usr/bin/perl -w

use strict;
use warnings;
# use diagnostics;

use Test::More tests => 1;

use Data::Compare;

my $z = 0;
ok(Compare([\$z, \$z], [\$z, \$z]), 'Can compare duplicated data');
