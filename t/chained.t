#!perl -w
use strict;
use Test::More tests => 3;

package Foo;
use base 'Class::Accessor::Chained';
__PACKAGE__->mk_accessors(qw( foo bar baz ));
package main;

my $foo = Foo->new->foo(1)->baz(2)->bar(4);
isa_ok( $foo, 'Foo' );
is( $foo->bar, 4, "get gets the value" );
is( $foo->foo( 5 ), $foo, "set gets the object" );
