=pod

=encoding utf-8

=head1 PURPOSE

Test that Sub::Boolean compiles.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2022 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

use strict;
use warnings;
use Test::More;

use Sub::Boolean -all;
use Scalar::Util qw( refaddr );

make_true( __PACKAGE__ . '::foo' );
make_false( __PACKAGE__ . '::bar' );
make_false( __PACKAGE__ . '::baz' );

ok  foo();
ok  foo(123);
ok !bar();
ok !bar(123);

isnt refaddr(\&baz), refaddr(\&bar);

make_undef( __PACKAGE__ . '::quux' );
make_empty( __PACKAGE__ . '::quuux' );

is_deeply [ quux() ], [ undef ];
is_deeply [ quuux() ], [];

done_testing;

