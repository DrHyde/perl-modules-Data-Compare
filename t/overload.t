#!perl
{
package SpecialClass;
use strict;use warnings;
use overload
    '""' => \&to_string,
    '0+' => \&to_number,
        fallback=>1;

sub new { my ($class,%data) = @_; bless {%data},$class }
sub to_string { return $_[0]->{str} || 'foo' }
sub to_number { return $_[0]->{num} || 12 }
}

use strict;
use warnings;
use Data::Compare;
use Test::More tests=>2;

ok(!Compare(SpecialClass->new(str=>'bar'),
            SpecialClass->new(str=>'bar',num=>15)),
   'String overload does not fool it');

ok(!Compare(SpecialClass->new(str=>'bar',num=>15),
            SpecialClass->new(str=>'boo',num=>15)),
   'Numeric overload does not fool it');
